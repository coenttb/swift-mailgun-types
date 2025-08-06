//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
extension Mailgun {
    public enum Subaccounts {}
}

extension Mailgun.Subaccounts {
    public struct Subaccount: Sendable, Codable, Equatable {
        public let id: String
        public let name: String
        public let status: Status
        public let parentAccountId: String?
        public let childAccountIds: [String]?
        public let createdAt: Date?
        public let updatedAt: Date?

        public init(
            id: String,
            name: String,
            status: Status,
            parentAccountId: String? = nil,
            childAccountIds: [String]? = nil,
            createdAt: Date? = nil,
            updatedAt: Date? = nil
        ) {
            self.id = id
            self.name = name
            self.status = status
            self.parentAccountId = parentAccountId
            self.childAccountIds = childAccountIds
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

        public enum Status: String, Sendable, Codable, Equatable {
            case enabled
            case disabled
        }
    }

    public enum List {
        public struct Response: Sendable, Decodable, Equatable {
            public let subaccounts: [Subaccount]
            public let totalCount: Int

            public init(subaccounts: [Subaccount], totalCount: Int) {
                self.subaccounts = subaccounts
                self.totalCount = totalCount
            }
        }
    }

    public enum Create {
        public struct Request: Sendable, Codable, Equatable {
            public let name: String

            public init(name: String) {
                self.name = name
            }
        }
    }

    public enum Delete {
        public struct Response: Sendable, Decodable, Equatable {
            public let message: String

            public init(message: String) {
                self.message = message
            }
        }
    }

    public enum Disable {
        public struct Response: Sendable, Decodable, Equatable {
            public let message: String

            public init(message: String) {
                self.message = message
            }
        }
    }

    public enum Enable {
        public struct Response: Sendable, Decodable, Equatable {
            public let message: String

            public init(message: String) {
                self.message = message
            }
        }
    }

    public enum CustomLimit {
        public struct Response: Sendable, Decodable, Equatable {
            public let limit: Int
            public let period: String

            public init(limit: Int, period: String) {
                self.limit = limit
                self.period = period
            }
        }

        public struct UpdateRequest: Sendable, Codable, Equatable {
            public let limit: Int

            public init(limit: Int) {
                self.limit = limit
            }
        }

        public struct DeleteResponse: Sendable, Decodable, Equatable {
            public let message: String

            public init(message: String) {
                self.message = message
            }
        }
    }

    public enum Features {
        public struct UpdateRequest: Sendable, Codable, Equatable {
            public let features: [String: Bool]

            public init(features: [String: Bool]) {
                self.features = features
            }
        }

        public struct Response: Sendable, Decodable, Equatable {
            public let message: String
            public let features: [String: Bool]?

            public init(message: String, features: [String: Bool]? = nil) {
                self.message = message
                self.features = features
            }
        }
    }
}
