//
//  IPAddressWarmup Client.swift
//  swift-mailgun-types
//
//  Created by Assistant on 05/08/2025.
//

import Mailgun_Types_Shared
import Dependencies
import DependenciesMacros

extension Mailgun.IPAddressWarmup {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable () async throws -> Mailgun.IPAddressWarmup.ListResponse
        
        @DependencyEndpoint
        public var get: @Sendable (_ ip: String) async throws -> Mailgun.IPAddressWarmup.IPWarmup
        
        @DependencyEndpoint
        public var create: @Sendable (_ ip: String, _ request: Mailgun.IPAddressWarmup.CreateRequest) async throws -> Mailgun.IPAddressWarmup.CreateResponse
        
        @DependencyEndpoint
        public var delete: @Sendable (_ ip: String) async throws -> Mailgun.IPAddressWarmup.DeleteResponse
    }
}
