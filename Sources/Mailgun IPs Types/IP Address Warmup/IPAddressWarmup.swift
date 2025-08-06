//
//  IPAddressWarmup.swift
//  swift-mailgun-types
//
//  Created by Assistant on 05/08/2025.
//

import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum IPAddressWarmup {}
}

extension Mailgun.IPAddressWarmup {
    public struct IPWarmup: Sendable, Codable, Equatable {
        public let ip: String
        public let enabled: Bool
        public let created: Date
        public let modified: Date?
        public let startedAt: Date?
        public let completedAt: Date?
        public let volumeDailyCapacity: Int?
        public let volumeCurrentDaily: Int?
        public let status: Status?
        
        public init(
            ip: String,
            enabled: Bool,
            created: Date,
            modified: Date? = nil,
            startedAt: Date? = nil,
            completedAt: Date? = nil,
            volumeDailyCapacity: Int? = nil,
            volumeCurrentDaily: Int? = nil,
            status: Status? = nil
        ) {
            self.ip = ip
            self.enabled = enabled
            self.created = created
            self.modified = modified
            self.startedAt = startedAt
            self.completedAt = completedAt
            self.volumeDailyCapacity = volumeDailyCapacity
            self.volumeCurrentDaily = volumeCurrentDaily
            self.status = status
        }
        
        private enum CodingKeys: String, CodingKey {
            case ip
            case enabled
            case created
            case modified
            case startedAt = "started_at"
            case completedAt = "completed_at"
            case volumeDailyCapacity = "volume_daily_capacity"
            case volumeCurrentDaily = "volume_current_daily"
            case status
        }
        
        public enum Status: String, Sendable, Codable, Equatable {
            case active = "active"
            case scheduled = "scheduled"
            case completed = "completed"
            case paused = "paused"
        }
    }
    
    public struct ListResponse: Sendable, Codable, Equatable {
        public let items: [IPWarmup]
        public let totalCount: Int
        
        public init(
            items: [IPWarmup],
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
    
    public struct CreateRequest: Sendable, Codable, Equatable {
        public let enabled: Bool?
        public let volumeDailyCapacity: Int?
        
        public init(
            enabled: Bool? = nil,
            volumeDailyCapacity: Int? = nil
        ) {
            self.enabled = enabled
            self.volumeDailyCapacity = volumeDailyCapacity
        }
        
        private enum CodingKeys: String, CodingKey {
            case enabled
            case volumeDailyCapacity = "volume_daily_capacity"
        }
    }
    
    public struct CreateResponse: Sendable, Codable, Equatable {
        public let message: String
        public let ip: String
        
        public init(
            message: String,
            ip: String
        ) {
            self.message = message
            self.ip = ip
        }
    }
    
    public struct DeleteResponse: Sendable, Codable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}
