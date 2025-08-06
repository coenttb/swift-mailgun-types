//
//  Domain Tracking Router Tests.swift
//  swift-mailgun-types
//
//  Created by Coen ten Thije Boonkkamp on 27/12/2024.
//

import DependenciesTestSupport
import Domain
@testable import Mailgun_Domains_Types
import Testing

@Suite("Domain Tracking Router Tests")
struct DomainTrackingRouterTests {
    @Test("Creates correct URL for getting tracking settings")
    func testGetTrackingURL() throws {
        let router: Mailgun.Domains.Domains.Tracking.API.Router = .init()
        let domain = try Domain("example.com")

        let api: Mailgun.Domains.Domains.Tracking.API = .get(domain: domain)

        let url = router.url(for: api)
        #expect(url.path == "/v3/domains/example.com/tracking")

        let match: Mailgun.Domains.Domains.Tracking.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.get))
        #expect(match.get == domain)
    }
}
