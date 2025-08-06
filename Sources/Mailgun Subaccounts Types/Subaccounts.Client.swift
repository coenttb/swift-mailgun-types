//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Subaccounts {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var get: @Sendable (_ subaccountId: String) async throws -> Mailgun.Subaccounts.Subaccount
        
        @DependencyEndpoint
        public var list: @Sendable () async throws -> Mailgun.Subaccounts.List.Response
        
        @DependencyEndpoint
        public var create: @Sendable (_ request: Mailgun.Subaccounts.Create.Request) async throws -> Mailgun.Subaccounts.Subaccount
        
        @DependencyEndpoint
        public var delete: @Sendable (_ subaccountId: String) async throws -> Mailgun.Subaccounts.Delete.Response
        
        @DependencyEndpoint
        public var disable: @Sendable (_ subaccountId: String) async throws -> Mailgun.Subaccounts.Disable.Response
        
        @DependencyEndpoint
        public var enable: @Sendable (_ subaccountId: String) async throws -> Mailgun.Subaccounts.Enable.Response
        
        @DependencyEndpoint
        public var getCustomLimit: @Sendable (_ subaccountId: String) async throws -> Mailgun.Subaccounts.CustomLimit.Response
        
        @DependencyEndpoint
        public var updateCustomLimit: @Sendable (_ subaccountId: String, _ request: Mailgun.Subaccounts.CustomLimit.UpdateRequest) async throws -> Mailgun.Subaccounts.CustomLimit.Response
        
        @DependencyEndpoint
        public var deleteCustomLimit: @Sendable (_ subaccountId: String) async throws -> Mailgun.Subaccounts.CustomLimit.DeleteResponse
        
        @DependencyEndpoint
        public var updateFeatures: @Sendable (_ subaccountId: String, _ request: Mailgun.Subaccounts.Features.UpdateRequest) async throws -> Mailgun.Subaccounts.Features.Response
    }
}
