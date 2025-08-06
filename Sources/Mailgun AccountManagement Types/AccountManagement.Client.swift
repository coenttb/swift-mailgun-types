//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.AccountManagement {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var updateAccount: @Sendable (_ request: Mailgun.AccountManagement.Update.Request) async throws -> Mailgun.AccountManagement.Update.Response
        
        @DependencyEndpoint
        public var getHttpSigningKey: @Sendable () async throws -> Mailgun.AccountManagement.HttpSigningKey
        
        @DependencyEndpoint
        public var regenerateHttpSigningKey: @Sendable () async throws -> Mailgun.AccountManagement.RegenerateHttpSigningKey.Response
        
        @DependencyEndpoint
        public var getSandboxAuthRecipients: @Sendable () async throws -> Mailgun.AccountManagement.Sandbox.AuthRecipientsList
        
        @DependencyEndpoint
        public var addSandboxAuthRecipient: @Sendable (_ email: EmailAddress) async throws -> Mailgun.AccountManagement.Sandbox.AddAuthRecipientResponse
        
        @DependencyEndpoint
        public var deleteSandboxAuthRecipient: @Sendable (_ email: EmailAddress) async throws -> Mailgun.AccountManagement.Sandbox.DeleteAuthRecipientResponse
        
        @DependencyEndpoint
        public var resendActivationEmail: @Sendable () async throws -> Mailgun.AccountManagement.ResendActivationEmail.Response
        
        @DependencyEndpoint
        public var getSAMLOrganization: @Sendable () async throws -> Mailgun.AccountManagement.SAML.Organization
        
        @DependencyEndpoint
        public var createSAMLOrganization: @Sendable (_ request: Mailgun.AccountManagement.SAML.CreateRequest) async throws -> Mailgun.AccountManagement.SAML.Organization
    }
}
