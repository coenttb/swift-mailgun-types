//
//  File.swift
//  swift-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 27/12/2024.
//

import DependenciesTestSupport
import Domain
import EmailAddress
import Testing

@testable import Mailgun_Suppressions_Types

@Suite(
  "Allowlist Router Tests"
)
struct AllowlistRouterTests {

  @Test("Creates correct URL for importing Allowlist")
  func testImportAllowlistURL() throws {
    let router: Mailgun.Suppressions.Allowlist.API.Router = .init()

    let testData = Data("test".utf8)
    let api: Mailgun.Suppressions.Allowlist.API = .importList(
      domain: try .init("test.domain.com"),
      request: testData
    )

    let url = router.url(for: api)
    #expect(url.path == "/v3/test.domain.com/whitelists/import")

    // Note: Import endpoints use multipart form data which doesn't support round-trip testing
    // due to the complex nature of multipart boundary generation and Data encoding
  }

  @Test("Creates correct URL for getting specific Allowlist entry")
  func testGetAllowlistURL() throws {
    let router: Mailgun.Suppressions.Allowlist.API.Router = .init()

    let api: Mailgun.Suppressions.Allowlist.API = .get(
      domain: try .init("test.domain.com"),
      value: "example.com"
    )

    let url = router.url(for: api)
    #expect(url.path == "/v3/test.domain.com/whitelists/example.com")

    let match: Mailgun.Suppressions.Allowlist.API = try router.match(
      request: try router.request(for: api)
    )
    #expect(match.is(\.get))
    let expected1 = try Domain("test.domain.com")
    #expect(match.get?.domain == expected1)
  }
}
