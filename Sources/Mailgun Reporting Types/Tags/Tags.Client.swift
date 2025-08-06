//
//  Tags.Client.swift
//  coenttb-mailgun
//
//  Created by Claude on 31/12/2024.
//

import Dependencies
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Reporting.Tags {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable (_ request: Mailgun.Reporting.Tags.Tag.List.Request) async throws -> Mailgun.Reporting.Tags.Tag.List.Response

        @DependencyEndpoint
        public var get: @Sendable (_ tag: String) async throws -> Mailgun.Reporting.Tags.Tag

        @DependencyEndpoint
        public var update: @Sendable (_ tag: String, _ description: String) async throws -> Mailgun.Reporting.Tags.Tag

        @DependencyEndpoint
        public var delete: @Sendable (_ tag: String) async throws -> String

        @DependencyEndpoint
        public var stats: @Sendable (_ tag: String, _ request: Mailgun.Reporting.Tags.Tag.Stats.Request) async throws -> Mailgun.Reporting.Tags.Tag.Stats.Response

        @DependencyEndpoint
        public var aggregates: @Sendable (_ tag: String, _ request: Mailgun.Reporting.Tags.Tag.Aggregates.Request) async throws -> Mailgun.Reporting.Tags.Tag.Aggregates.Response

        @DependencyEndpoint
        public var limits: @Sendable () async throws -> Mailgun.Reporting.Tags.Tag.Limits.Response
    }
}
