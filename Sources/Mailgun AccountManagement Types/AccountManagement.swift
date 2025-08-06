//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import EmailAddress
import Mailgun_Types_Shared
@_exported import Mailgun_Types_Shared

extension Mailgun {
    public enum AccountManagement {}
}

extension Mailgun.AccountManagement {
    public enum Update {}
}

extension Mailgun.AccountManagement.Update {
    public struct Request: Sendable, Codable, Equatable {
        // The exact fields are not documented, but commonly include settings like:
        public let name: String?
        public let timezone: String?
        
        public init(
            name: String? = nil,
            timezone: String? = nil
        ) {
            self.name = name
            self.timezone = timezone
        }
    }
    
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.AccountManagement {
    public struct HttpSigningKey: Sendable, Decodable, Equatable {
        public let httpSigningKey: String
        
        public init(httpSigningKey: String) {
            self.httpSigningKey = httpSigningKey
        }
        
        private enum CodingKeys: String, CodingKey {
            case httpSigningKey = "http_signing_key"
        }
    }
}

extension Mailgun.AccountManagement {
    public enum RegenerateHttpSigningKey {}
}

extension Mailgun.AccountManagement.RegenerateHttpSigningKey {
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        public let httpSigningKey: String
        
        public init(
            message: String,
            httpSigningKey: String
        ) {
            self.message = message
            self.httpSigningKey = httpSigningKey
        }
        
        private enum CodingKeys: String, CodingKey {
            case message
            case httpSigningKey = "http_signing_key"
        }
    }
}

extension Mailgun.AccountManagement {
    public enum Sandbox {}
}

extension Mailgun.AccountManagement.Sandbox {
    public struct AuthRecipient: Sendable, Codable, Equatable {
        public let email: EmailAddress
        
        public init(email: EmailAddress) {
            self.email = email
        }
    }
    
    public struct AuthRecipientsList: Sendable, Decodable, Equatable {
        public let limit: Int?
        public let recipients: [RecipientInfo]
        
        public init(limit: Int? = nil, recipients: [RecipientInfo]) {
            self.limit = limit
            self.recipients = recipients
        }
        
        public struct RecipientInfo: Sendable, Decodable, Equatable {
            public let activated: Bool
            public let email: EmailAddress
            
            public init(activated: Bool, email: EmailAddress) {
                self.activated = activated
                self.email = email
            }
        }
    }
    
    public struct AddAuthRecipientResponse: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
    
    public struct DeleteAuthRecipientResponse: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.AccountManagement {
    public enum ResendActivationEmail {}
}

extension Mailgun.AccountManagement.ResendActivationEmail {
    public struct Response: Sendable, Decodable, Equatable {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.AccountManagement {
    public enum SAML {}
}

extension Mailgun.AccountManagement.SAML {
    public struct Organization: Sendable, Codable, Equatable {
        public let id: String?
        public let name: String?
        public let enabled: Bool?
        public let metadata: String?
        public let entityId: String?
        public let ssoUrl: String?
        public let x509Certificate: String?
        
        public init(
            id: String? = nil,
            name: String? = nil,
            enabled: Bool? = nil,
            metadata: String? = nil,
            entityId: String? = nil,
            ssoUrl: String? = nil,
            x509Certificate: String? = nil
        ) {
            self.id = id
            self.name = name
            self.enabled = enabled
            self.metadata = metadata
            self.entityId = entityId
            self.ssoUrl = ssoUrl
            self.x509Certificate = x509Certificate
        }
        
        private enum CodingKeys: String, CodingKey {
            case id
            case name
            case enabled
            case metadata
            case entityId = "entity_id"
            case ssoUrl = "sso_url"
            case x509Certificate = "x509_certificate"
        }
    }
    
    public struct CreateRequest: Sendable, Codable, Equatable {
        public let name: String
        public let metadata: String?
        public let entityId: String?
        public let ssoUrl: String?
        public let x509Certificate: String?
        
        public init(
            name: String,
            metadata: String? = nil,
            entityId: String? = nil,
            ssoUrl: String? = nil,
            x509Certificate: String? = nil
        ) {
            self.name = name
            self.metadata = metadata
            self.entityId = entityId
            self.ssoUrl = ssoUrl
            self.x509Certificate = x509Certificate
        }
        
        private enum CodingKeys: String, CodingKey {
            case name
            case metadata
            case entityId = "entity_id"
            case ssoUrl = "sso_url"
            case x509Certificate = "x509_certificate"
        }
    }
}
