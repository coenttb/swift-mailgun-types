//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import Dependencies
import DependenciesMacros

extension Mailgun.IPs {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable () async throws -> Mailgun.IPs.ListResponse
        
        @DependencyEndpoint
        public var get: @Sendable (_ ip: String) async throws -> Mailgun.IPs.IP
        
        @DependencyEndpoint
        public var listDomains: @Sendable (_ ip: String) async throws -> Mailgun.IPs.DomainListResponse
        
        @DependencyEndpoint
        public var assignDomain: @Sendable (_ ip: String, _ request: Mailgun.IPs.AssignDomainRequest) async throws -> Mailgun.IPs.AssignDomainResponse
        
        @DependencyEndpoint
        public var unassignDomain: @Sendable (_ ip: String, _ domain: String) async throws -> Mailgun.IPs.DeleteResponse
        
        @DependencyEndpoint
        public var assignIPBand: @Sendable (_ ip: String, _ request: Mailgun.IPs.IPBandRequest) async throws -> Mailgun.IPs.IPBandResponse
        
        @DependencyEndpoint
        public var requestNew: @Sendable (_ request: Mailgun.IPs.RequestNewRequest) async throws -> Mailgun.IPs.RequestNewResponse
        
        @DependencyEndpoint
        public var getRequestedIPs: @Sendable () async throws -> Mailgun.IPs.RequestNewResponse
        
        @DependencyEndpoint
        public var deleteDomainIP: @Sendable (_ domain: String, _ ip: String) async throws -> Mailgun.IPs.DeleteResponse
        
        @DependencyEndpoint
        public var deleteDomainPool: @Sendable (_ domain: String, _ ip: String) async throws -> Mailgun.IPs.DeleteResponse
    }
}
