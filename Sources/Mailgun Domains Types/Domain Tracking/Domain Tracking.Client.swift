//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Dependencies
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Domains.Domains.Tracking {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var get: @Sendable (_ domain: TypesFoundation.Domain) async throws -> Mailgun.Domains.Domains.Tracking.Get.Response

        @DependencyEndpoint
        public var updateClick: @Sendable (_ domain: TypesFoundation.Domain, _ request: Mailgun.Domains.Domains.Tracking.UpdateClick.Request) async throws -> Mailgun.Domains.Domains.Tracking.UpdateClick.Response

        @DependencyEndpoint
        public var updateOpen: @Sendable (_ domain: TypesFoundation.Domain, _ request: Mailgun.Domains.Domains.Tracking.UpdateOpen.Request) async throws -> Mailgun.Domains.Domains.Tracking.UpdateOpen.Response

        @DependencyEndpoint
        public var updateUnsubscribe: @Sendable (_ domain: TypesFoundation.Domain, _ request: Mailgun.Domains.Domains.Tracking.UpdateUnsubscribe.Request) async throws -> Mailgun.Domains.Domains.Tracking.UpdateUnsubscribe.Response
    }
}
