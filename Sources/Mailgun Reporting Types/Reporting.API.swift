//
//  Mailgun.Reporting.API.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Reporting {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case metrics(Metrics.API)
        case stats(Stats.API)
        case events(Events.API)
        case tags(Tags.API)
        case logs(Logs.API)
    }
}

extension Mailgun.Reporting.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Reporting.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Reporting.API.metrics)) {
                    Mailgun.Reporting.Metrics.API.Router()
                }
                URLRouting.Route(.case(Mailgun.Reporting.API.stats)) {
                    Mailgun.Reporting.Stats.API.Router()
                }
                URLRouting.Route(.case(Mailgun.Reporting.API.events)) {
                    Mailgun.Reporting.Events.API.Router()
                }
                URLRouting.Route(.case(Mailgun.Reporting.API.tags)) {
                    Mailgun.Reporting.Tags.API.Router()
                }
                URLRouting.Route(.case(Mailgun.Reporting.API.logs)) {
                    Mailgun.Reporting.Logs.API.Router()
                }
            }
        }
    }
}
