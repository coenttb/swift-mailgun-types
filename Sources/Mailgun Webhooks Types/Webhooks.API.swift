//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Webhooks {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case list(domain: Domain)
        case get(domain: Domain, type: Webhook.Variant)
        case create(domain: Domain, type: Webhook.Variant, url: String)
        case update(domain: Domain, type: Webhook.Variant, url: String)
        case delete(domain: Domain, type: Webhook.Variant)
    }
}

extension Mailgun.Webhooks.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Webhooks.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Webhooks.API.list)) {
                    Method.get
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.webhooks
                }

                URLRouting.Route(.case(Mailgun.Webhooks.API.get)) {
                    Method.get
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.webhooks
                    Path { Parse(.string.representing(Mailgun.Webhooks.Webhook.Variant.self)) }
                }

                URLRouting.Route(.case(Mailgun.Webhooks.API.create)) {
                    Method.post
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.webhooks
                    URLRouting.Query {
                        Field("id") { Parse(.string.representing(Mailgun.Webhooks.Webhook.Variant.self)) }
                    }
                    URLRouting.Query {
                        Field("url") { Parse(.string) }
                    }
                }

                URLRouting.Route(.case(Mailgun.Webhooks.API.update)) {
                    Method.put
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.webhooks
                    Path { Parse(.string.representing(Mailgun.Webhooks.Webhook.Variant.self)) }
                    URLRouting.Query {
                        Field("url") { Parse(.string) }
                    }
                }

                URLRouting.Route(.case(Mailgun.Webhooks.API.delete)) {
                    Method.delete
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.webhooks
                    Path { Parse(.string.representing(Mailgun.Webhooks.Webhook.Variant.self)) }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let webhooks = Path {
        "webhooks"
    }

    nonisolated(unsafe) public static let domains = Path {
        "domains"
    }
}
