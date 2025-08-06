//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import Dependencies
import DependenciesMacros

extension Mailgun.Domains.DKIM_Security {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var updateRotation: @Sendable (_ domain: TypesFoundation.Domain, _ request: Mailgun.Domains.DKIM_Security.Rotation.Update.Request) async throws -> Mailgun.Domains.DKIM_Security.Rotation.Update.Response
        
        @DependencyEndpoint
        public var rotateManually: @Sendable (_ domain: TypesFoundation.Domain) async throws -> Mailgun.Domains.DKIM_Security.Rotation.Manual.Response
    }
}
