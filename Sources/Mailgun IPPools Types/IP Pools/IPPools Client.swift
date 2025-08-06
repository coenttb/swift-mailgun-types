//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesMacros
@_exported import Mailgun_Types_Shared

extension Mailgun.IPPools {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable () async throws -> Mailgun.IPPools.ListResponse
        
        @DependencyEndpoint
        public var create: @Sendable (_ request: Mailgun.IPPools.CreateRequest) async throws -> Mailgun.IPPools.CreateResponse
        
        @DependencyEndpoint
        public var get: @Sendable (_ poolId: String) async throws -> Mailgun.IPPools.IPPool
        
        @DependencyEndpoint
        public var update: @Sendable (_ poolId: String, _ request: Mailgun.IPPools.UpdateRequest) async throws -> Mailgun.IPPools.UpdateResponse
        
        @DependencyEndpoint
        public var delete: @Sendable (_ poolId: String, _ request: Mailgun.IPPools.DeleteRequest?) async throws -> Mailgun.IPPools.DeleteResponse
        
        @DependencyEndpoint
        public var listDomains: @Sendable (_ poolId: String) async throws -> Mailgun.IPPools.DomainsListResponse
    }
}
