//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 20/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Messages {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case send(domain: Domain, request: Mailgun.Messages.Send.Request)
        case sendMime(domain: Domain, request: Mailgun.Messages.Send.Mime.Request)
        case retrieve(domain: Domain, storageKey: String)
        case queueStatus(domain: Domain)
        case deleteScheduled(domain: Domain)
    }
}

extension Mailgun.Messages.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Messages.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Messages.API.send)) {
                    Method.post
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.messages
                    Body(.form(Mailgun.Messages.Send.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.Messages.API.sendMime)) {
                    Method.post
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path { "messages.mime" }
                    Body(.form(Mailgun.Messages.Send.Mime.Request.self, decoder: .mailgun, encoder: .mailgun))
                }

                URLRouting.Route(.case(Mailgun.Messages.API.retrieve)) {
                    Method.get
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.messages
                    Path { Parse(.string) }
                }

                URLRouting.Route(.case(Mailgun.Messages.API.queueStatus)) {
                    Method.get
                    Path { "v3" }
                    Path.domains
                    Path { Parse(.string.representing(Domain.self)) }
                    Path { "sending_queues" }
                }

                URLRouting.Route(.case(Mailgun.Messages.API.deleteScheduled)) {
                    Method.delete
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path { "envelopes" }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let messages = Path {
        "messages"
    }

    nonisolated(unsafe) public static let domains = Path {
        "domains"
    }
}
