//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.AccountManagement {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case updateAccount(request: Mailgun.AccountManagement.Update.Request)
        case getHttpSigningKey
        case regenerateHttpSigningKey
        case getSandboxAuthRecipients
        case addSandboxAuthRecipient(request: Mailgun.AccountManagement.Sandbox.Auth.Recipients.Add.Request)
        case deleteSandboxAuthRecipient(email: String)
        case resendActivationEmail
        case getSAMLOrganization
        case addSAMLOrganization(request: Mailgun.AccountManagement.SAML.Organization.Add.Request)
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
                    Parse(.memberwise(Mailgun.AccountManagement.Update.Request.init)) {
                        URLRouting.Query {
                            Optionally { Field("name") { Parse(.string) } }
                            Optionally { Field("inactive_session_timeout") { Digits() } }
                            Optionally { Field("absolute_session_timeout") { Digits() } }
                            Optionally { Field("logout_redirect_url") { Parse(.string) } }
                        }
                    }
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
                    Parse(.memberwise(Mailgun.AccountManagement.Sandbox.Auth.Recipients.Add.Request.init)) {
                        URLRouting.Query {
                            Field("email") { Parse(.string) }
                        }
                    }
                }

                URLRouting.Route(.case(Mailgun.AccountManagement.API.deleteSandboxAuthRecipient)) {
                    Method.delete
                    Path { "v5" }
                    Path.sandbox
                    Path.authRecipients
                    Path { Parse(.string) }
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

                URLRouting.Route(.case(Mailgun.AccountManagement.API.addSAMLOrganization)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.samlOrg
                    Parse(.memberwise(Mailgun.AccountManagement.SAML.Organization.Add.Request.init)) {
                        URLRouting.Query {
                            Field("user_id") { Parse(.string) }
                            Optionally { Field("domain") { Parse(.string) } }
                        }
                    }
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
