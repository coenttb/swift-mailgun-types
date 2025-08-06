//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Suppressions.Allowlist {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case get(domain: Domain, value: String)
        case delete(domain: Domain, value: String)
        case list(domain: Domain, request: Mailgun.Suppressions.Allowlist.List.Request)
        case create(domain: Domain, request: Mailgun.Suppressions.Allowlist.Create.Request)
        case deleteAll(domain: Domain)
        case importList(domain: Domain, request: Foundation.Data)
    }
}

extension Mailgun.Suppressions.Allowlist.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Suppressions.Allowlist.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Suppressions.Allowlist.API.get)) {
                    Method.get
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.Allowlists
                    Path { Parse(.string) }
                }

                URLRouting.Route(.case(Mailgun.Suppressions.Allowlist.API.delete)) {
                    Method.delete
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.Allowlists
                    Path { Parse(.string) }
                }

                URLRouting.Route(.case(Mailgun.Suppressions.Allowlist.API.list)) {
                    Method.get
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.Allowlists
                    Parse(.memberwise(Mailgun.Suppressions.Allowlist.List.Request.init)) {
                        URLRouting.Query {
                            Optionally {
                                Field("address") { Parse(.string.representing(EmailAddress.self)) }
                            }
                            Optionally {
                                Field("term") { Parse(.string) }
                            }
                            Optionally {
                                Field("limit") { Digits() }
                            }
                            Optionally {
                                Field("page") { Parse(.string) }
                            }
                        }
                    }
                }

                URLRouting.Route(.case(Mailgun.Suppressions.Allowlist.API.create)) {
                    Method.post
                    Headers {
                        Field.contentType { "application/x-www-form-urlencoded" }
                    }
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.Allowlists
                    Body(.form(Mailgun.Suppressions.Allowlist.Create.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.Suppressions.Allowlist.API.deleteAll)) {
                    Method.delete
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.Allowlists
                }

                URLRouting.Route(.case(Mailgun.Suppressions.Allowlist.API.importList)) {

                    let multipart = URLFormCoding.Multipart.FileUpload.csv()

                    Method.post
                    Headers {
                        Field.contentType { multipart.contentType }
                    }
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.Allowlists
                    Path { "import" }
                    Body(multipart)
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let Allowlists = Path {
        "Allowlists"
    }
}
