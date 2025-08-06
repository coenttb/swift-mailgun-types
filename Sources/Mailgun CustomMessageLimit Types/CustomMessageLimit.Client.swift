//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import DependenciesMacros

extension Mailgun.CustomMessageLimit {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var getMonthlyLimit: @Sendable () async throws -> Mailgun.CustomMessageLimit.Monthly.Get.Response
        
        @DependencyEndpoint
        public var setMonthlyLimit: @Sendable (_ request: Mailgun.CustomMessageLimit.Monthly.Set.Request) async throws -> Mailgun.CustomMessageLimit.Monthly.Set.Response
        
        @DependencyEndpoint
        public var deleteMonthlyLimit: @Sendable () async throws -> Mailgun.CustomMessageLimit.Monthly.Delete.Response
        
        @DependencyEndpoint
        public var enableAccount: @Sendable () async throws -> Mailgun.CustomMessageLimit.EnableAccount.Response
    }
}
