//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import EmailAddress
import Mailgun_Types_Shared

extension Mailgun.AccountManagement {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case updateAccount(request: Mailgun.AccountManagement.Update.Request)
        case getHttpSigningKey
        case regenerateHttpSigningKey
        case getSandboxAuthRecipients
        case addSandboxAuthRecipient(email: EmailAddress)
        case deleteSandboxAuthRecipient(email: EmailAddress)
        case resendActivationEmail
        case getSAMLOrganization
        case createSAMLOrganization(request: Mailgun.AccountManagement.SAML.CreateRequest)
    }
}

extension Mailgun.AccountManagement.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Mailgun.AccountManagement.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.AccountManagement.API.updateAccount)) {
                    Method.put
                    Path { "v5" }
                    Path.accounts
                    Body(.form(Mailgun.AccountManagement.Update.Request.self, decoder: .mailgun, encoder: .mailgun))
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.getHttpSigningKey)) {
                    Method.get
                    Path { "v5" }
                    Path.accounts
                    Path.httpSigningKey
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.regenerateHttpSigningKey)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.httpSigningKey
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.getSandboxAuthRecipients)) {
                    Method.get
                    Path { "v5" }
                    Path.sandbox
                    Path.authRecipients
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.addSandboxAuthRecipient)) {
                    Method.post
                    Path { "v5" }
                    Path.sandbox
                    Path.authRecipients
                    Query {
                        Field("email") { Parse(.string.representing(EmailAddress.self)) }
                    }
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.deleteSandboxAuthRecipient)) {
                    Method.delete
                    Path { "v5" }
                    Path.sandbox
                    Path.authRecipients
                    Path { Parse(.string.representing(EmailAddress.self)) }
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.resendActivationEmail)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.resendActivationEmail
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.getSAMLOrganization)) {
                    Method.get
                    Path { "v5" }
                    Path.accounts
                    Path.samlOrg
                }
                
                URLRouting.Route(.case(Mailgun.AccountManagement.API.createSAMLOrganization)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.samlOrg
                    Body(.form(Mailgun.AccountManagement.SAML.CreateRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe)
    public static let accounts: Path<PathBuilder.Component<String>> = Path {
        "accounts"
    }
    
    nonisolated(unsafe)
    public static let httpSigningKey: Path<PathBuilder.Component<String>> = Path {
        "http_signing_key"
    }
    
    nonisolated(unsafe)
    public static let sandbox: Path<PathBuilder.Component<String>> = Path {
        "sandbox"
    }
    
    nonisolated(unsafe)
    public static let authRecipients: Path<PathBuilder.Component<String>> = Path {
        "auth_recipients"
    }
    
    nonisolated(unsafe)
    public static let resendActivationEmail: Path<PathBuilder.Component<String>> = Path {
        "resend_activation_email"
    }
    
    nonisolated(unsafe)
    public static let samlOrg: Path<PathBuilder.Component<String>> = Path {
        "saml_org"
    }
}
