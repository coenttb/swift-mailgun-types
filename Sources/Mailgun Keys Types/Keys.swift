//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum Keys {}
}

extension Mailgun.Keys {
    public struct Key: Sendable, Codable, Equatable {
        public let id: String
        public let createdAt: Date
        public let description: String?
        public let isActive: Bool
        
        public init(
            id: String,
            createdAt: Date,
            description: String? = nil,
            isActive: Bool = true
        ) {
            self.id = id
            self.createdAt = createdAt
            self.description = description
            self.isActive = isActive
        }
        
        private enum CodingKeys: String, CodingKey {
            case id
            case createdAt = "created_at"
            case description
            case isActive = "is_active"
        }
    }
    
    public enum List {
        public struct Response: Sendable, Decodable, Equatable {
            public let items: [Mailgun.Keys.Key]
            public let totalCount: Int
            
            public init(
                items: [Mailgun.Keys.Key],
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
    
    public enum Create {
        public struct Request: Sendable, Codable, Equatable {
            public let description: String?
            
            public init(description: String? = nil) {
                self.description = description
            }
        }
        
        public struct Response: Sendable, Decodable, Equatable {
            public let key: Mailgun.Keys.Key
            public let keyValue: String
            
            public init(
                key: Mailgun.Keys.Key,
                keyValue: String
            ) {
                self.key = key
                self.keyValue = keyValue
            }
            
            private enum CodingKeys: String, CodingKey {
                case key
                case keyValue = "key_value"
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
    
    public enum PublicKey {
        public struct Request: Sendable, Codable, Equatable {
            public let publicKey: String
            
            public init(publicKey: String) {
                self.publicKey = publicKey
            }
            
            private enum CodingKeys: String, CodingKey {
                case publicKey = "public_key"
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
