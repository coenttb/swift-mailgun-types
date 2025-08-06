//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum Webhooks {}
}


extension Mailgun.Webhooks {
    public struct Webhook: Sendable, Codable, Equatable {
        public let urls: [String]

        public init(urls: [String]) {
            self.urls = urls
        }
    }
}

extension Mailgun.Webhooks.Webhook {
    public enum Variant: String, Sendable, Codable, Equatable, CaseIterable, CodingKey {
        case accepted = "accepted"
        case delivered = "delivered"
        case opened = "opened"
        case clicked = "clicked"
        case unsubscribed = "unsubscribed"
        case complained = "complained"
        case permanentFail = "permanent_fail"
        case temporaryFail = "temporary_fail"

        public var stringValue: String { rawValue }
        public var intValue: Int? { nil }

        public init?(stringValue: String) {
            self.init(rawValue: stringValue)
        }

        public init?(intValue: Int) {
            return nil
        }
    }
}

extension Mailgun.Webhooks.Client {
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        public let webhook: Mailgun.Webhooks.Webhook

        public init(message: String, webhook: Mailgun.Webhooks.Webhook) {
            self.message = message
            self.webhook = webhook
        }
    }
}

extension Mailgun.Webhooks.Client.Response {
    public struct Webhook: Sendable, Codable, Equatable {
        public let webhook: Mailgun.Webhooks.Webhook

        public init(webhook: Mailgun.Webhooks.Webhook) {
            self.webhook = webhook
        }
    }
}

extension Mailgun.Webhooks.Client.Response {
    public struct List: Sendable, Codable, Equatable {
        public let webhooks: List.All

        public init(webhooks: List.All) {
            self.webhooks = webhooks
        }
    }
}

extension Mailgun.Webhooks.Client.Response.List {
    public struct All: Sendable, Codable, Equatable {
        public let accepted: Mailgun.Webhooks.Webhook?
        public let delivered: Mailgun.Webhooks.Webhook?
        public let opened: Mailgun.Webhooks.Webhook?
        public let clicked: Mailgun.Webhooks.Webhook?
        public let unsubscribed: Mailgun.Webhooks.Webhook?
        public let complained: Mailgun.Webhooks.Webhook?
        public let temporary_fail: Mailgun.Webhooks.Webhook?
        public let permanent_fail: Mailgun.Webhooks.Webhook?

        public init(
            accepted: Mailgun.Webhooks.Webhook? = nil,
            delivered: Mailgun.Webhooks.Webhook? = nil,
            opened: Mailgun.Webhooks.Webhook? = nil,
            clicked: Mailgun.Webhooks.Webhook? = nil,
            unsubscribed: Mailgun.Webhooks.Webhook? = nil,
            complained: Mailgun.Webhooks.Webhook? = nil,
            temporary_fail: Mailgun.Webhooks.Webhook? = nil,
            permanent_fail: Mailgun.Webhooks.Webhook? = nil
        ) {
            self.accepted = accepted
            self.delivered = delivered
            self.opened = opened
            self.clicked = clicked
            self.unsubscribed = unsubscribed
            self.complained = complained
            self.temporary_fail = temporary_fail
            self.permanent_fail = permanent_fail
        }

        public subscript(_ variant: Mailgun.Webhooks.Webhook.Variant) -> Mailgun.Webhooks.Webhook? {
            switch variant {
            case .accepted: return accepted
            case .delivered: return delivered
            case .opened: return opened
            case .clicked: return clicked
            case .unsubscribed: return unsubscribed
            case .complained: return complained
            case .temporaryFail: return temporary_fail
            case .permanentFail: return permanent_fail
            }
        }
    }
}
