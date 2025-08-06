//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum Users {}
}

extension Mailgun.Users {
    public struct User: Sendable, Codable, Equatable {
        public let id: String
        public let email: String
        public let name: String?
        public let role: String?
        public let status: String?
        public let createdAt: Date?
        public let updatedAt: Date?
        
        public init(
            id: String,
            email: String,
            name: String? = nil,
            role: String? = nil,
            status: String? = nil,
            createdAt: Date? = nil,
            updatedAt: Date? = nil
        ) {
            self.id = id
            self.email = email
            self.name = name
            self.role = role
            self.status = status
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
        
        private enum CodingKeys: String, CodingKey {
            case id
            case email
            case name
            case role
            case status
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    }
    
    public enum List {
        public struct Response: Sendable, Decodable, Equatable {
            public let items: [Mailgun.Users.User]
            public let totalCount: Int
            
            public init(
                items: [Mailgun.Users.User],
                totalCount: Int
            ) {
                self.items = items
                self.totalCount = totalCount
            }
            
            private enum CodingKeys: String, CodingKey {
                case items
                case totalCount = "total_count"
            }
        }
    }
    
    public enum Organization {
        public struct UpdateRequest: Sendable, Codable, Equatable {
            public let role: String?
            
            public init(role: String? = nil) {
                self.role = role
            }
        }
        
        public struct Response: Sendable, Decodable, Equatable {
            public let message: String
            
            public init(message: String) {
                self.message = message
            }
        }
    }
}
