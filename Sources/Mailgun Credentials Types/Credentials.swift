//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum Credentials {}
}

extension Mailgun.Credentials {
    public struct Credential: Sendable, Codable, Equatable {
        public let login: String
        public let mailbox: String
        public let createdAt: Date
        
        public init(
            login: String,
            mailbox: String,
            createdAt: Date
        ) {
            self.login = login
            self.mailbox = mailbox
            self.createdAt = createdAt
        }
        
        private enum CodingKeys: String, CodingKey {
            case login
            case mailbox
            case createdAt = "created_at"
        }
    }
}

extension Mailgun.Credentials {
    public enum List {}
}

extension Mailgun.Credentials.List {
    public struct Response: Sendable, Decodable, Equatable {
        public let totalCount: Int
        public let items: [Mailgun.Credentials.Credential]
        
        public init(
            totalCount: Int,
            items: [Mailgun.Credentials.Credential]
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

extension Mailgun.Credentials {
    public enum Create {}
}

extension Mailgun.Credentials.Create {
    public struct Request: Sendable, Codable, Equatable {
        public let login: String
        public let password: String
        
        public init(
            login: String,
            password: String
        ) {
            self.login = login
            self.password = password
        }
    }
    
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Credentials {
    public enum Update {}
}

extension Mailgun.Credentials.Update {
    public struct Request: Sendable, Codable, Equatable {
        public let password: String
        
        public init(password: String) {
            self.password = password
        }
    }
    
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Credentials {
    public enum Delete {}
}

extension Mailgun.Credentials.Delete {
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        public let spec: String?
        public let count: Int?
        
        public init(
            message: String,
            spec: String? = nil,
            count: Int? = nil
        ) {
            self.message = message
            self.spec = spec
            self.count = count
        }
    }
}

extension Mailgun.Credentials {
    public enum Mailbox {}
}

extension Mailgun.Credentials.Mailbox {
    public enum Update {}
}

extension Mailgun.Credentials.Mailbox.Update {
    public struct Request: Sendable, Codable, Equatable {
        public let password: String
        
        public init(password: String) {
            self.password = password
        }
    }
    
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}
