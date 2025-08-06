//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import DependenciesMacros
import Mailgun_Types_Shared

extension Mailgun.Templates {
    @DependencyClient
    public struct Client: Sendable {
        @DependencyEndpoint
        public var create: @Sendable (_ request: Mailgun.Templates.Template.Create.Request) async throws -> Mailgun.Templates.Template.Create.Response

        @DependencyEndpoint
        public var list: @Sendable (_ request: Mailgun.Templates.Template.List.Request) async throws -> Mailgun.Templates.Template.List.Response

        @DependencyEndpoint
        public var get: @Sendable (_ templateId: String, _ active: String) async throws -> Mailgun.Templates.Template.Get.Response

        @DependencyEndpoint
        public var update: @Sendable (_ templateId: String, _ request: Mailgun.Templates.Template.Update.Request) async throws -> Mailgun.Templates.Template.Update.Response

        @DependencyEndpoint
        public var delete: @Sendable (_ templateId: String) async throws -> Mailgun.Templates.Template.Delete.Response

        @DependencyEndpoint
        public var deleteAll: @Sendable () async throws -> Mailgun.Templates.Template.Delete.All.Response

        @DependencyEndpoint
        public var versions: @Sendable (_ templateName: String, _ page: Page, _ limit: Int?, _ p: String?) async throws -> Mailgun.Templates.Template.Versions.Response

        @DependencyEndpoint
        public var createVersion: @Sendable (_ templateId: String, _ request: Mailgun.Templates.Version.Create.Request) async throws -> Mailgun.Templates.Version.Create.Response

        @DependencyEndpoint
        public var getVersion: @Sendable (_ templateId: String, _ versionId: String) async throws -> Mailgun.Templates.Version.Get.Response

        @DependencyEndpoint
        public var updateVersion: @Sendable (_ templateId: String, _ versionId: String, _ request: Mailgun.Templates.Version.Update.Request) async throws -> Mailgun.Templates.Version.Update.Response

        @DependencyEndpoint
        public var deleteVersion: @Sendable (_ templateId: String, _ versionId: String) async throws -> Mailgun.Templates.Version.Delete.Response

        @DependencyEndpoint
        public var copyVersion: @Sendable (_ templateName: String, _ versionName: String, _ newVersionName: String, _ comment: String?) async throws -> Mailgun.Templates.Version.Copy.Response
    }
}
