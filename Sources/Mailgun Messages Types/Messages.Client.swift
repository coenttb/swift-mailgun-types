//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 19/12/2024.
//

import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Messages {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var send: @Sendable (_ request: Mailgun.Messages.Send.Request) async throws -> Mailgun.Messages.Send.Response

        @DependencyEndpoint
        public var sendMime: @Sendable (_ request: Mailgun.Messages.Send.Mime.Request) async throws -> Mailgun.Messages.Send.Response

        @DependencyEndpoint
        public var retrieve: @Sendable (_ storageKey: String) async throws -> Mailgun.Messages.StoredMessage

        @DependencyEndpoint
        public var queueStatus: @Sendable () async throws -> Mailgun.Messages.Queue.Status

        @DependencyEndpoint
        public var deleteAll: @Sendable () async throws -> Mailgun.Messages.Delete.Response
    }
}
