//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.CustomMessageLimit {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var getMonthlyLimit: @Sendable () async throws -> Mailgun.CustomMessageLimit.Monthly.Status
        
        @DependencyEndpoint
        public var setMonthlyLimit: @Sendable (_ request: Mailgun.CustomMessageLimit.Monthly.SetRequest) async throws -> Mailgun.CustomMessageLimit.SuccessResponse
        
        @DependencyEndpoint
        public var deleteMonthlyLimit: @Sendable () async throws -> Mailgun.CustomMessageLimit.SuccessResponse
        
        @DependencyEndpoint
        public var enableAccount: @Sendable () async throws -> Mailgun.CustomMessageLimit.SuccessResponse
    }
}
