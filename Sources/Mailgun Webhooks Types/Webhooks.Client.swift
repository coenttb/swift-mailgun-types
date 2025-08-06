//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Webhooks {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable () async throws -> Response.List

        @DependencyEndpoint
        public var get: @Sendable (_ type: Webhook.Variant) async throws -> Response.Webhook

        @DependencyEndpoint
        public var create: @Sendable (_ type: Webhook.Variant, _ url: String) async throws -> Response

        @DependencyEndpoint
        public var update: @Sendable (_ type: Webhook.Variant, _ url: String) async throws -> Response

        @DependencyEndpoint
        public var delete: @Sendable (_ type: Webhook.Variant) async throws -> Response
    }
}
