//
//  File.swift
//  swift-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesTestSupport
import Foundation
@testable import Mailgun_Reporting_Types
import Testing

@Suite(
    "Events Router Tests"
)
struct EventsRouterTests {

    @Test("Creates correct URL for listing events with minimal parameters")
    func testListEventsMinimalURL() throws {
        let router: Mailgun.Reporting.Events.API.Router = .init()

        let api: Mailgun.Reporting.Events.API = .list(
            domain: try .init("test.domain.com"),
            query: nil
        )

        let url = router.url(for: api)
        #expect(url.path == "/v3/test.domain.com/events")

        let match: Mailgun.Reporting.Events.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
        #expect(match.list?.domain == (try .init("test.domain.com")))
        // The router parses an empty Query object instead of nil
        #expect(match.list?.query?.begin == nil)
        #expect(match.list?.query?.end == nil)
        #expect(match.list?.query?.ascending == nil)
    }

    @Test("Creates correct URL for listing events with query parameters")
    func testListEventsWithQueryURL() throws {
        let router: Mailgun.Reporting.Events.API.Router = .init()

        let query = Mailgun.Reporting.Events.List.Query(
            begin: Date(timeIntervalSince1970: .timeInterval1970to20220101),
            end: Date(timeIntervalSince1970: .timeInterval1970to20220102),
            ascending: .yes
        )

        let api: Mailgun.Reporting.Events.API = .list(
            domain: try .init("test.domain.com"),
            query: query
        )

        let url = router.url(for: api)
        #expect(url.path == "/v3/test.domain.com/events")

        let match: Mailgun.Reporting.Events.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
        #expect(match.list?.domain == (try .init("test.domain.com")))
        #expect(match.list?.query?.begin == Date(timeIntervalSince1970: .timeInterval1970to20220101))
        #expect(match.list?.query?.end == Date(timeIntervalSince1970: .timeInterval1970to20220102))
        #expect(match.list?.query?.ascending == .yes)
    }

    @Test("Verifies dates are encoded as Unix timestamps in query parameters")
    func testDatesEncodedAsUnixTimestamps() throws {
        let router: Mailgun.Reporting.Events.API.Router = .init()

        // Use known timestamps for testing
        let beginTimestamp: TimeInterval = 1640995200  // 2022-01-01 00:00:00 UTC
        let endTimestamp: TimeInterval = 1641081600    // 2022-01-02 00:00:00 UTC

        let query = Mailgun.Reporting.Events.List.Query(
            begin: Date(timeIntervalSince1970: beginTimestamp),
            end: Date(timeIntervalSince1970: endTimestamp),
            ascending: .no,
            limit: 50
        )

        let api: Mailgun.Reporting.Events.API = .list(
            domain: try .init("test.domain.com"),
            query: query
        )

        let request = try router.request(for: api)
        let url = request.url!

        #expect(url.path == "/v3/test.domain.com/events")

        // Check that the query string contains Unix timestamps
        let queryString = url.query ?? ""
        print("Generated query string: \(queryString)")

        // Parse query parameters to verify format
        let components = queryString.split(separator: "&")
        var queryParams: [String: String] = [:]
        for component in components {
            let parts = component.split(separator: "=", maxSplits: 1)
            if parts.count == 2 {
                queryParams[String(parts[0])] = String(parts[1])
            }
        }

        // Verify that begin and end are Unix timestamps (numeric strings)
        #expect(queryParams["begin"] == "1640995200")
        #expect(queryParams["end"] == "1641081600")
        #expect(queryParams["ascending"] == "no")
        #expect(queryParams["limit"] == "50")
    }
}

extension Double {
    fileprivate static let timeInterval1970to20220101: Self = 1640995200
    fileprivate static let timeInterval1970to20220102: Self = 1641081600
}
