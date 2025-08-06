//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Domains {
    public enum DomainKeys {}
}

extension Mailgun.Domains.DomainKeys {
    public struct Key: Sendable, Codable, Equatable {
        public let signingDomain: String
        public let selector: String
        public let publicKey: String?
        public let isActive: Bool?
        public let createdAt: String?
        
        public init(
            signingDomain: String,
            selector: String,
            publicKey: String? = nil,
            isActive: Bool? = nil,
            createdAt: String? = nil
        ) {
            self.signingDomain = signingDomain
            self.selector = selector
            self.publicKey = publicKey
            self.isActive = isActive
            self.createdAt = createdAt
        }
        
        private enum CodingKeys: String, CodingKey {
            case signingDomain = "signing_domain"
            case selector
            case publicKey = "public_key"
            case isActive = "is_active"
            case createdAt = "created_at"
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum List {}
}

extension Mailgun.Domains.DomainKeys.List {
    public struct Request: Sendable, Codable, Equatable {
        public let page: String?
        public let limit: Int?
        public let signingDomain: String?
        public let selector: String?
        
        public init(
            page: String? = nil,
            limit: Int? = nil,
            signingDomain: String? = nil,
            selector: String? = nil
        ) {
            self.page = page
            self.limit = limit
            self.signingDomain = signingDomain
            self.selector = selector
        }
        
        private enum CodingKeys: String, CodingKey {
            case page
            case limit
            case signingDomain = "signing_domain"
            case selector
        }
    }
    
    public struct Response: Sendable, Codable, Equatable {
        public let items: [Mailgun.Domains.DomainKeys.Key]
        public let paging: Paging?
        
        public init(
            items: [Mailgun.Domains.DomainKeys.Key],
            paging: Paging? = nil
        ) {
            self.items = items
            self.paging = paging
        }
    }
    
    public struct Paging: Sendable, Codable, Equatable {
        public let first: String?
        public let last: String?
        public let next: String?
        public let previous: String?
        
        public init(
            first: String? = nil,
            last: String? = nil,
            next: String? = nil,
            previous: String? = nil
        ) {
            self.first = first
            self.last = last
            self.next = next
            self.previous = previous
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum Create {}
}

extension Mailgun.Domains.DomainKeys.Create {
    public struct Request: Sendable, Codable, Equatable {
        public let signingDomain: String
        public let selector: String
        public let bits: Int?
        public let pem: String?
        
        public init(
            signingDomain: String,
            selector: String,
            bits: Int? = nil,
            pem: String? = nil
        ) {
            self.signingDomain = signingDomain
            self.selector = selector
            self.bits = bits
            self.pem = pem
        }
        
        private enum CodingKeys: String, CodingKey {
            case signingDomain = "signing_domain"
            case selector
            case bits
            case pem
        }
    }
    
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        public let key: Mailgun.Domains.DomainKeys.Key?
        
        public init(
            message: String,
            key: Mailgun.Domains.DomainKeys.Key? = nil
        ) {
            self.message = message
            self.key = key
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum Delete {}
}

extension Mailgun.Domains.DomainKeys.Delete {
    public struct Request: Sendable, Codable, Equatable {
        public let signingDomain: String
        public let selector: String
        
        public init(
            signingDomain: String,
            selector: String
        ) {
            self.signingDomain = signingDomain
            self.selector = selector
        }
        
        private enum CodingKeys: String, CodingKey {
            case signingDomain = "signing_domain"
            case selector
        }
    }
    
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum Activate {}
}

extension Mailgun.Domains.DomainKeys.Activate {
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum DomainKeysList {}
}

extension Mailgun.Domains.DomainKeys.DomainKeysList {
    public struct Response: Sendable, Codable, Equatable {
        public let items: [Mailgun.Domains.DomainKeys.Key]
        public let totalCount: Int?
        
        public init(
            items: [Mailgun.Domains.DomainKeys.Key],
            totalCount: Int? = nil
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

extension Mailgun.Domains.DomainKeys {
    public enum Deactivate {}
}

extension Mailgun.Domains.DomainKeys.Deactivate {
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum SetDkimAuthority {}
}

extension Mailgun.Domains.DomainKeys.SetDkimAuthority {
    public struct Request: Sendable, Codable, Equatable {
        public let dkimAuthority: String
        
        public init(dkimAuthority: String) {
            self.dkimAuthority = dkimAuthority
        }
        
        private enum CodingKeys: String, CodingKey {
            case dkimAuthority = "dkim_authority"
        }
    }
    
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Domains.DomainKeys {
    public enum SetDkimSelector {}
}

extension Mailgun.Domains.DomainKeys.SetDkimSelector {
    public struct Request: Sendable, Codable, Equatable {
        public let dkimSelector: String
        
        public init(dkimSelector: String) {
            self.dkimSelector = dkimSelector
        }
        
        private enum CodingKeys: String, CodingKey {
            case dkimSelector = "dkim_selector"
        }
    }
    
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}
