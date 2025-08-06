//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Credentials {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var list: @Sendable (_ domain: Domain) async throws -> Mailgun.Credentials.List.Response
        
        @DependencyEndpoint
        public var create: @Sendable (_ domain: Domain, _ request: Mailgun.Credentials.Create.Request) async throws -> Mailgun.Credentials.Create.Response
        
        @DependencyEndpoint
        public var deleteAll: @Sendable (_ domain: Domain) async throws -> Mailgun.Credentials.Delete.Response
        
        @DependencyEndpoint
        public var update: @Sendable (_ domain: Domain, _ login: String, _ request: Mailgun.Credentials.Update.Request) async throws -> Mailgun.Credentials.Update.Response
        
        @DependencyEndpoint
        public var delete: @Sendable (_ domain: Domain, _ login: String) async throws -> Mailgun.Credentials.Delete.Response
        
        @DependencyEndpoint
        public var updateMailbox: @Sendable (_ domain: Domain, _ login: String, _ request: Mailgun.Credentials.Mailbox.Update.Request) async throws -> Mailgun.Credentials.Mailbox.Update.Response
    }
}
