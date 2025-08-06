//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Reporting.Metrics {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case getAccountMetrics(request: GetAccountMetrics.Request)
        case getAccountUsageMetrics(request: GetAccountUsageMetrics.Request)
    }
}

extension Mailgun.Reporting.Metrics.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Reporting.Metrics.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Reporting.Metrics.API.getAccountMetrics)) {
                    Method.post
                    Path { "v1" }
                    Path.analytics
                    Path.metrics
                    Body(.json(Mailgun.Reporting.Metrics.GetAccountMetrics.Request.self))
                }

                URLRouting.Route(.case(Mailgun.Reporting.Metrics.API.getAccountUsageMetrics)) {
                    Method.post
                    Path { "v1" }
                    Path.analytics
                    Path.usage
                    Path.metrics
                    Body(.json(Mailgun.Reporting.Metrics.GetAccountUsageMetrics.Request.self))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) public static let analytics = Path {
        "analytics"
    }

    nonisolated(unsafe) public static let metrics = Path {
        "metrics"
    }

    nonisolated(unsafe) public static let usage = Path {
        "usage"
    }
}
