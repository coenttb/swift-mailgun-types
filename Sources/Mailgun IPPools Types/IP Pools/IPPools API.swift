//
//  File.swift
//  swift-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.IPPools {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case list
        case create(request: Mailgun.IPPools.Create.Request)
        case get(poolId: String)
        case update(poolId: String, request: Mailgun.IPPools.Update.Request)
        case delete(poolId: String, request: Mailgun.IPPools.Delete.Request?)
        case listDomains(poolId: String)
    }
}

extension Mailgun.IPPools.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.IPPools.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.IPPools.API.list)) {
                    Method.get
                    Path { "v1" }
                    Path.ipPools
                }

                URLRouting.Route(.case(Mailgun.IPPools.API.create)) {
                    Method.post
                    Path { "v1" }
                    Path.ipPools
                    Body(.form(Mailgun.IPPools.Create.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.IPPools.API.get)) {
                    Method.get
                    Path { "v1" }
                    Path.ipPools
                    Path { Parse(.string) }
                }

                URLRouting.Route(.case(Mailgun.IPPools.API.update)) {
                    Method.patch
                    Path { "v1" }
                    Path.ipPools
                    Path { Parse(.string) }
                    Body(.form(Mailgun.IPPools.Update.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.IPPools.API.delete)) {
                    Method.delete
                    Path { "v1" }
                    Path.ipPools
                    Path { Parse(.string) }
                    Optionally {
                        Parse(.memberwise(Mailgun.IPPools.Delete.Request.init)) {
                            URLRouting.Query {
                                Optionally {
                                    Field("ip") { Parse(.string) }
                                }
                                Optionally {
                                    Field("pool_id") { Parse(.string) }
                                }
                            }
                        }
                    }
                }

                URLRouting.Route(.case(Mailgun.IPPools.API.listDomains)) {
                    Method.get
                    Path { "v1" }
                    Path.ipPools
                    Path { Parse(.string) }
                    Path.domains
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    public static let ipPools = Path {
        "ip_pools"
    }

    public static let domains = Path {
        "domains"
    }
}
