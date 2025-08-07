//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesTestSupport
@testable import Mailgun_Users_Types
import Testing

@Suite(
    "Users Router Tests"
)
struct UsersRouterTests {

    @Test("Creates correct URL for listing users")
    func testListUsersURL() throws {
        let router: Mailgun.Users.API.Router = .init()

        let api: Mailgun.Users.API = .list(request: nil)

        let url = router.url(for: api)
        #expect(url.path == "/v5/users")

        let match: Mailgun.Users.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.list))
    }

    @Test("Creates correct URL for getting a specific user")
    func testGetUserURL() throws {
        let router: Mailgun.Users.API.Router = .init()

        let userId = "user-123"
        let api: Mailgun.Users.API = .get(userId: userId)

        let url = router.url(for: api)
        #expect(url.path == "/v5/users/user-123")

        let match: Mailgun.Users.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.get))
//        #expect(match.get == userId)
    }

    @Test("Creates correct URL for getting current user")
    func testGetMeURL() throws {
        let router: Mailgun.Users.API.Router = .init()

        let api: Mailgun.Users.API = .me

        let url = router.url(for: api)
        #expect(url.path == "/v5/users/me")

        let match: Mailgun.Users.API = try router.match(request: try router.request(for: api))

        #expect(match.is(\.me))
    }

    @Test("Creates correct URL for adding user to organization")
    func testAddToOrganizationURL() throws {
        let router: Mailgun.Users.API.Router = .init()

        let userId = "user-123"
        let orgId = "org-456"
        let api: Mailgun.Users.API = .addToOrganization(userId: userId, orgId: orgId)

        let url = router.url(for: api)
        #expect(url.path == "/v5/users/user-123/org/org-456")

        let match: Mailgun.Users.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.addToOrganization))
        #expect(match.addToOrganization?.userId == userId)
        #expect(match.addToOrganization?.orgId == orgId)
    }

    @Test("Creates correct URL for removing user from organization")
    func testRemoveFromOrganizationURL() throws {
        let router: Mailgun.Users.API.Router = .init()

        let userId = "user-123"
        let orgId = "org-456"
        let api: Mailgun.Users.API = .removeFromOrganization(userId: userId, orgId: orgId)

        let url = router.url(for: api)
        #expect(url.path == "/v5/users/user-123/org/org-456")

        let match: Mailgun.Users.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.removeFromOrganization))
        #expect(match.removeFromOrganization?.userId == userId)
        #expect(match.removeFromOrganization?.orgId == orgId)
    }

    @Test("Verifies all endpoints use v5 API version")
    func testAllEndpointsUseV5() throws {
        let router: Mailgun.Users.API.Router = .init()

        let listUrl = router.url(for: .list(request: nil))
        let getUrl = router.url(for: .get(userId: "123"))
        let meUrl = router.url(for: .me)
        let addToOrgUrl = router.url(for: .addToOrganization(userId: "123", orgId: "456"))
        let removeFromOrgUrl = router.url(for: .removeFromOrganization(userId: "123", orgId: "456"))

        #expect(listUrl.path.hasPrefix("/v5/"))
        #expect(getUrl.path.hasPrefix("/v5/"))
        #expect(meUrl.path.hasPrefix("/v5/"))
        #expect(addToOrgUrl.path.hasPrefix("/v5/"))
        #expect(removeFromOrgUrl.path.hasPrefix("/v5/"))
    }
}
