//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum IPs {}
}

extension Mailgun.IPs {
    public struct IP: Sendable, Codable, Equatable {
        public let ip: String
        public let dedicated: Bool
        public let rdns: String?
        
        public init(
            ip: String,
            dedicated: Bool,
            rdns: String? = nil
        ) {
            self.ip = ip
            self.dedicated = dedicated
            self.rdns = rdns
        }
    }
    
    public struct ListResponse: Sendable, Codable, Equatable {
        public let items: [IP]
        public let totalCount: Int
        
        public init(
            items: [IP],
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
    
    public struct DomainAssignment: Sendable, Codable, Equatable {
        public let domain: String
        
        public init(domain: String) {
            self.domain = domain
        }
    }
    
    public struct DomainListResponse: Sendable, Codable, Equatable {
        public let items: [String]
        public let totalCount: Int
        
        public init(
            items: [String],
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
    
    public struct AssignDomainRequest: Sendable, Codable, Equatable {
        public let domain: String
        
        public init(domain: String) {
            self.domain = domain
        }
    }
    
    public struct AssignDomainResponse: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
    
    public struct IPBandRequest: Sendable, Codable, Equatable {
        public let ipBand: String
        
        public init(ipBand: String) {
            self.ipBand = ipBand
        }
        
        private enum CodingKeys: String, CodingKey {
            case ipBand = "ip_band"
        }
    }
    
    public struct IPBandResponse: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
    
    public struct RequestNewResponse: Sendable, Codable, Equatable {
        public let requested: Int
        
        public init(requested: Int) {
            self.requested = requested
        }
    }
    
    public struct RequestNewRequest: Sendable, Codable, Equatable {
        public let count: Int
        
        public init(count: Int) {
            self.count = count
        }
    }
    
    public struct DeleteResponse: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}
