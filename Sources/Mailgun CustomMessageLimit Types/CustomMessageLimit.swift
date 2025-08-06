//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum CustomMessageLimit {}
}

extension Mailgun.CustomMessageLimit {
    public enum Monthly {}
}

extension Mailgun.CustomMessageLimit.Monthly {
    public struct Status: Sendable, Decodable, Equatable {
        public let limit: Int
        public let current: Int
        public let period: String
        
        public init(
            limit: Int,
            current: Int,
            period: String
        ) {
            self.limit = limit
            self.current = current
            self.period = period
        }
    }
    
    public struct SetRequest: Sendable, Codable, Equatable {
        public let limit: Int
        
        public init(limit: Int) {
            self.limit = limit
        }
    }
}

extension Mailgun.CustomMessageLimit {
    public struct SuccessResponse: Sendable, Decodable, Equatable {
        public let success: Bool
        
        public init(success: Bool) {
            self.success = success
        }
    }
}
