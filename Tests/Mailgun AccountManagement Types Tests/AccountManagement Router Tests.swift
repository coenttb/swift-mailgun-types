//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesTestSupport
import Testing
import EmailAddress
@testable import Mailgun_AccountManagement_Types

@Suite(
    "AccountManagement Router Tests"
)
struct AccountManagementRouterTests {
    
    @Test("Creates correct URL for updating account")
    func testUpdateAccountURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let request = Mailgun.AccountManagement.Update.Request(
            name: "Test Account",
            timezone: "America/New_York"
        )
        
        let api: Mailgun.AccountManagement.API = .updateAccount(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/accounts")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.updateAccount))
        #expect(match.updateAccount?.name == "Test Account")
        #expect(match.updateAccount?.timezone == "America/New_York")
    }
    
    @Test("Creates correct URL for getting HTTP signing key")
    func testGetHttpSigningKeyURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let api: Mailgun.AccountManagement.API = .getHttpSigningKey
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/accounts/http_signing_key")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.getHttpSigningKey))
    }
    
    @Test("Creates correct URL for regenerating HTTP signing key")
    func testRegenerateHttpSigningKeyURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let api: Mailgun.AccountManagement.API = .regenerateHttpSigningKey
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/accounts/http_signing_key")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.regenerateHttpSigningKey))
    }
    
    @Test("Creates correct URL for getting sandbox auth recipients")
    func testGetSandboxAuthRecipientsURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let api: Mailgun.AccountManagement.API = .getSandboxAuthRecipients
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/sandbox/auth_recipients")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.getSandboxAuthRecipients))
    }
    
    @Test("Creates correct URL for adding sandbox auth recipient")
    func testAddSandboxAuthRecipientURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let email = try EmailAddress("test@example.com")
        let api: Mailgun.AccountManagement.API = .addSandboxAuthRecipient(email: email)
        
        let url = router.url(for: api)
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = components?.queryItems ?? []
        let queryDict: [String: String?] = Dictionary(uniqueKeysWithValues: queryItems.map { ($0.name, $0.value) })
        
        #expect(url.path == "/v5/sandbox/auth_recipients")
        #expect(queryDict["email"] == "test@example.com")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.addSandboxAuthRecipient))
        #expect(match.addSandboxAuthRecipient == email)
    }
    
    @Test("Creates correct URL for deleting sandbox auth recipient")
    func testDeleteSandboxAuthRecipientURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let email = try EmailAddress("test@example.com")
        let api: Mailgun.AccountManagement.API = .deleteSandboxAuthRecipient(email: email)
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/sandbox/auth_recipients/test@example.com")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.deleteSandboxAuthRecipient))
        #expect(match.deleteSandboxAuthRecipient == email)
    }
    
    @Test("Creates correct URL for resending activation email")
    func testResendActivationEmailURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let api: Mailgun.AccountManagement.API = .resendActivationEmail
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/accounts/resend_activation_email")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.resendActivationEmail))
    }
    
    @Test("Creates correct URL for getting SAML organization")
    func testGetSAMLOrganizationURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let api: Mailgun.AccountManagement.API = .getSAMLOrganization
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/accounts/saml_org")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.getSAMLOrganization))
    }
    
    @Test("Creates correct URL for creating SAML organization")
    func testCreateSAMLOrganizationURL() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let request = Mailgun.AccountManagement.SAML.CreateRequest(
            name: "Test Organization",
            entityId: "https://test.example.com",
            ssoUrl: "https://test.example.com/sso"
        )
        
        let api: Mailgun.AccountManagement.API = .createSAMLOrganization(request: request)
        
        let url = router.url(for: api)
        #expect(url.path == "/v5/accounts/saml_org")
        
        let match: Mailgun.AccountManagement.API = try router.match(request: try router.request(for: api))
        #expect(match.is(\.createSAMLOrganization))
        #expect(match.createSAMLOrganization?.name == "Test Organization")
        #expect(match.createSAMLOrganization?.entityId == "https://test.example.com")
        #expect(match.createSAMLOrganization?.ssoUrl == "https://test.example.com/sso")
    }
    
    @Test("Verifies all endpoints use v5 API version")
    func testAllEndpointsUseV5() throws {
        let router: Mailgun.AccountManagement.API.Router = .init()
        
        let updateUrl = router.url(for: .updateAccount(request: .init()))
        let httpKeyUrl = router.url(for: .getHttpSigningKey)
        let regenerateUrl = router.url(for: .regenerateHttpSigningKey)
        let sandboxListUrl = router.url(for: .getSandboxAuthRecipients)
        let sandboxAddUrl = router.url(for: .addSandboxAuthRecipient(email: try .init("test@example.com")))
        let sandboxDeleteUrl = router.url(for: .deleteSandboxAuthRecipient(email: try .init("test@example.com")))
        let resendUrl = router.url(for: .resendActivationEmail)
        let samlGetUrl = router.url(for: .getSAMLOrganization)
        let samlCreateUrl = router.url(for: .createSAMLOrganization(request: .init(name: "Test")))
        
        #expect(updateUrl.path.hasPrefix("/v5/"))
        #expect(httpKeyUrl.path.hasPrefix("/v5/"))
        #expect(regenerateUrl.path.hasPrefix("/v5/"))
        #expect(sandboxListUrl.path.hasPrefix("/v5/"))
        #expect(sandboxAddUrl.path.hasPrefix("/v5/"))
        #expect(sandboxDeleteUrl.path.hasPrefix("/v5/"))
        #expect(resendUrl.path.hasPrefix("/v5/"))
        #expect(samlGetUrl.path.hasPrefix("/v5/"))
        #expect(samlCreateUrl.path.hasPrefix("/v5/"))
    }
}
