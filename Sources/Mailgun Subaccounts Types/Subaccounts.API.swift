//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Subaccounts {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case get(subaccountId: String)
        case list
        case create(request: Mailgun.Subaccounts.Create.Request)
        case delete
        case disable(subaccountId: String)
        case enable(subaccountId: String)
        case getCustomLimit(subaccountId: String)
        case updateCustomLimit(subaccountId: String, request: Mailgun.Subaccounts.CustomLimit.UpdateRequest)
        case deleteCustomLimit(subaccountId: String)
        case updateFeatures(subaccountId: String, request: Mailgun.Subaccounts.Features.UpdateRequest)
    }
}

extension Mailgun.Subaccounts.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Mailgun.Subaccounts.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Subaccounts.API.get)) {
                    Method.get
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.list)) {
                    Method.get
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.create)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Body(.form(Mailgun.Subaccounts.Create.Request.self, decoder: .mailgun, encoder: .mailgun))
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.delete)) {
                    Method.delete
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.disable)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                    Path.disable
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.enable)) {
                    Method.post
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                    Path.enable
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.getCustomLimit)) {
                    Method.get
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                    Path.limit
                    Path.custom
                    Path.monthly
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.updateCustomLimit)) {
                    Method.put
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                    Path.limit
                    Path.custom
                    Path.monthly
                    Body(.form(Mailgun.Subaccounts.CustomLimit.UpdateRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.deleteCustomLimit)) {
                    Method.delete
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                    Path.limit
                    Path.custom
                    Path.monthly
                }
                
                URLRouting.Route(.case(Mailgun.Subaccounts.API.updateFeatures)) {
                    Method.put
                    Path { "v5" }
                    Path.accounts
                    Path.subaccounts
                    Path { Parse(.string) }
                    Path.features
                    Body(.form(Mailgun.Subaccounts.Features.UpdateRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe)
    public static let accounts: Path<PathBuilder.Component<String>> = Path {
        "accounts"
    }
    
    nonisolated(unsafe)
    public static let subaccounts: Path<PathBuilder.Component<String>> = Path {
        "subaccounts"
    }
    
    nonisolated(unsafe)
    public static let disable: Path<PathBuilder.Component<String>> = Path {
        "disable"
    }
    
    nonisolated(unsafe)
    public static let enable: Path<PathBuilder.Component<String>> = Path {
        "enable"
    }
    
    nonisolated(unsafe)
    public static let limit: Path<PathBuilder.Component<String>> = Path {
        "limit"
    }
    
    nonisolated(unsafe)
    public static let custom: Path<PathBuilder.Component<String>> = Path {
        "custom"
    }
    
    nonisolated(unsafe)
    public static let monthly: Path<PathBuilder.Component<String>> = Path {
        "monthly"
    }
    
    nonisolated(unsafe)
    public static let features: Path<PathBuilder.Component<String>> = Path {
        "features"
    }
}
