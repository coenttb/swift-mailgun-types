//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
extension Mailgun {
    public enum Routes {}
}

extension Mailgun.Routes {
    public struct Route: Sendable, Codable, Equatable {
        public let id: String
        public let priority: Int
        public let description: String
        public let expression: String
        public let actions: [String]
        public let createdAt: Date

        public init(
            id: String,
            priority: Int,
            description: String,
            expression: String,
            actions: [String],
            createdAt: Date
        ) {
            self.id = id
            self.priority = priority
            self.description = description
            self.expression = expression
            self.actions = actions
            self.createdAt = createdAt
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case priority
            case description
            case expression
            case actions
            case createdAt = "created_at"
        }
    }
}

extension Mailgun.Routes {
    public enum Create {}
}

extension Mailgun.Routes.Create {
    public struct Request: Sendable, Codable, Equatable {
        public let priority: Int
        public let description: String
        public let expression: String
        public let action: [String]

        public init(
            priority: Int,
            description: String,
            expression: String,
            action: [String]
        ) {
            self.priority = priority
            self.description = description
            self.expression = expression
            self.action = action
        }
    }

    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        public let route: Mailgun.Routes.Route

        public init(
            message: String,
            route: Mailgun.Routes.Route
        ) {
            self.message = message
            self.route = route
        }
    }
}

extension Mailgun.Routes {
    public enum List {}
}

extension Mailgun.Routes.List {
    public struct Response: Sendable, Decodable, Equatable {
        public let totalCount: Int
        public let items: [Mailgun.Routes.Route]

        public init(
            totalCount: Int,
            items: [Mailgun.Routes.Route]
        ) {
            self.totalCount = totalCount
            self.items = items
        }

        private enum CodingKeys: String, CodingKey {
            case totalCount = "total_count"
            case items
        }
    }
}

extension Mailgun.Routes {
    public enum Update {}
}

extension Mailgun.Routes.Update {
    public struct Request: Sendable, Codable, Equatable {
        public let priority: Int?
        public let description: String?
        public let expression: String?
        public let action: [String]?

        public init(
            priority: Int? = nil,
            description: String? = nil,
            expression: String? = nil,
            action: [String]? = nil
        ) {
            self.priority = priority
            self.description = description
            self.expression = expression
            self.action = action
        }
    }

    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        public let id: String?

        public init(
            message: String,
            id: String? = nil
        ) {
            self.message = message
            self.id = id
        }
    }
}

extension Mailgun.Routes {
    public enum Delete {}
}

extension Mailgun.Routes.Delete {
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        public let id: String?

        public init(
            message: String,
            id: String? = nil
        ) {
            self.message = message
            self.id = id
        }
    }
}

extension Mailgun.Routes {
    public enum Match {}
}

extension Mailgun.Routes.Match {
    public struct Request: Sendable, Codable, Equatable {
        public let recipient: String

        public init(recipient: String) {
            self.recipient = recipient
        }
    }

    public struct Response: Sendable, Decodable, Equatable {
        public let message: String?
        public let route: Mailgun.Routes.Route?

        public init(
            message: String? = nil,
            route: Mailgun.Routes.Route? = nil
        ) {
            self.message = message
            self.route = route
        }
    }
}
