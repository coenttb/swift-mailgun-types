//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Users {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable () async throws -> Mailgun.Users.List.Response
        
        @DependencyEndpoint
        public var get: @Sendable (_ userId: String) async throws -> Mailgun.Users.User
        
        @DependencyEndpoint
        public var me: @Sendable () async throws -> Mailgun.Users.User
        
        @DependencyEndpoint
        public var addToOrganization: @Sendable (_ userId: String, _ orgId: String, _ request: Mailgun.Users.Organization.UpdateRequest) async throws -> Mailgun.Users.Organization.Response
        
        @DependencyEndpoint
        public var removeFromOrganization: @Sendable (_ userId: String, _ orgId: String) async throws -> Mailgun.Users.Organization.Response
    }
}
