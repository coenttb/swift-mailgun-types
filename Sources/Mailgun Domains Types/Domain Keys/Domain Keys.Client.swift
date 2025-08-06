//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Dependencies
import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Domains.DomainKeys {
    @DependencyClient
    public struct Client: Sendable {
        // GET /v1/dkim/keys
        @DependencyEndpoint
        public var list: @Sendable (_ request: Mailgun.Domains.DomainKeys.List.Request?) async throws -> Mailgun.Domains.DomainKeys.List.Response

        // POST /v1/dkim/keys
        @DependencyEndpoint
        public var create: @Sendable (_ request: Mailgun.Domains.DomainKeys.Create.Request) async throws -> Mailgun.Domains.DomainKeys.Create.Response

        // DELETE /v1/dkim/keys
        @DependencyEndpoint
        public var delete: @Sendable (_ request: Mailgun.Domains.DomainKeys.Delete.Request) async throws -> Mailgun.Domains.DomainKeys.Delete.Response

        // PUT /v4/domains/{authority_name}/keys/{selector}/activate
        @DependencyEndpoint
        public var activate: @Sendable (_ authorityName: String, _ selector: String) async throws -> Mailgun.Domains.DomainKeys.Activate.Response

        // GET /v4/domains/{authority_name}/keys
        @DependencyEndpoint
        public var listDomainKeys: @Sendable (_ authorityName: String) async throws -> Mailgun.Domains.DomainKeys.DomainKeysList.Response

        // PUT /v4/domains/{authority_name}/keys/{selector}/deactivate
        @DependencyEndpoint
        public var deactivate: @Sendable (_ authorityName: String, _ selector: String) async throws -> Mailgun.Domains.DomainKeys.Deactivate.Response

        // PUT /v3/domains/{name}/dkim_authority
        @DependencyEndpoint
        public var setDkimAuthority: @Sendable (_ domainName: String, _ request: Mailgun.Domains.DomainKeys.SetDkimAuthority.Request) async throws -> Mailgun.Domains.DomainKeys.SetDkimAuthority.Response

        // PUT /v3/domains/{name}/dkim_selector
        @DependencyEndpoint
        public var setDkimSelector: @Sendable (_ domainName: String, _ request: Mailgun.Domains.DomainKeys.SetDkimSelector.Request) async throws -> Mailgun.Domains.DomainKeys.SetDkimSelector.Response
    }
}
