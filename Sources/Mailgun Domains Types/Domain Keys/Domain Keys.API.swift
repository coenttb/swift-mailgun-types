//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Domains.DomainKeys {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case list(request: Mailgun.Domains.DomainKeys.List.Request?)
        case create(request: Mailgun.Domains.DomainKeys.Create.Request)
        case delete(request: Mailgun.Domains.DomainKeys.Delete.Request)
        case activate(authorityName: String, selector: String)
        case listDomainKeys(authorityName: String)
        case deactivate(authorityName: String, selector: String)
        case setDkimAuthority(domainName: String, request: Mailgun.Domains.DomainKeys.SetDkimAuthority.Request)
        case setDkimSelector(domainName: String, request: Mailgun.Domains.DomainKeys.SetDkimSelector.Request)
    }
}

extension Mailgun.Domains.DomainKeys.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Domains.DomainKeys.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.list)) {
                    Method.get
                    Path { "v1" }
                    Path { "dkim" }
                    Path { "keys" }
                    Optionally {
                        Parse(.memberwise(Mailgun.Domains.DomainKeys.List.Request.init)) {
                            URLRouting.Query {
                                Optionally {
                                    Field("page") { Parse(.string) }
                                }
                                Optionally {
                                    Field("limit") { Digits() }
                                }
                                Optionally {
                                    Field("signing_domain") { Parse(.string) }
                                }
                                Optionally {
                                    Field("selector") { Parse(.string) }
                                }
                            }
                        }
                    }
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.create)) {
                    Method.post
                    Path { "v1" }
                    Path { "dkim" }
                    Path { "keys" }
                    Body(.form(Mailgun.Domains.DomainKeys.Create.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.delete)) {
                    Method.delete
                    Path { "v1" }
                    Path { "dkim" }
                    Path { "keys" }
                    Body(.form(Mailgun.Domains.DomainKeys.Delete.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.activate)) {
                    Method.put
                    Path { "v4" }
                    Path { "domains" }
                    Path { Parse(.string) }
                    Path { "keys" }
                    Path { Parse(.string) }
                    Path { "activate" }
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.listDomainKeys)) {
                    Method.get
                    Path { "v4" }
                    Path { "domains" }
                    Path { Parse(.string) }
                    Path { "keys" }
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.deactivate)) {
                    Method.put
                    Path { "v4" }
                    Path { "domains" }
                    Path { Parse(.string) }
                    Path { "keys" }
                    Path { Parse(.string) }
                    Path { "deactivate" }
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.setDkimAuthority)) {
                    Method.put
                    Path { "v3" }
                    Path { "domains" }
                    Path { Parse(.string) }
                    Path { "dkim_authority" }
                    Body(.form(Mailgun.Domains.DomainKeys.SetDkimAuthority.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.Domains.DomainKeys.API.setDkimSelector)) {
                    Method.put
                    Path { "v3" }
                    Path { "domains" }
                    Path { Parse(.string) }
                    Path { "dkim_selector" }
                    Body(.form(Mailgun.Domains.DomainKeys.SetDkimSelector.Request.self, decoder: .mailgun, encoder: .mailgun))
                }
            }
        }
    }
}
