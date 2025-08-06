//
//  Logs.API.swift
//  swift-mailgun-types
//
//  Created by Coen ten Thije Boonkkamp on 31/12/2024.
//

import Foundation
import Mailgun_Types_Shared
import URLRouting

extension Mailgun.Reporting.Logs {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case analytics(request: Analytics.Request)
    }
}

extension Mailgun.Reporting.Logs.API {
    public struct Router: ParserPrinter, Sendable {

        public init() {}

        public var body: some URLRouting.Router<Mailgun.Reporting.Logs.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Reporting.Logs.API.analytics)) {
                    Method.post
                    Path { "v1" }
                    Path.analytics
                    Path.logs
                    Body(.json(Mailgun.Reporting.Logs.Analytics.Request.self))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe)
    public static let logs: Path<PathBuilder.Component<String>> = Path {
        "logs"
    }
}
