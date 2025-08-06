//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesTestSupport
import Testing
@testable import Mailgun_Reporting_Types

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
}

extension Double {
    fileprivate static let timeInterval1970to20220101: Self = 1640995200
    fileprivate static let timeInterval1970to20220102: Self = 1641081600
}
