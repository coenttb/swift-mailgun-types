//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.Users {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case list
        case me
        case get(userId: String)
        case addToOrganization(userId: String, orgId: String, request: Mailgun.Users.Organization.UpdateRequest)
        case removeFromOrganization(userId: String, orgId: String)
    }
}

extension Mailgun.Users.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Mailgun.Users.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.Users.API.list)) {
                    Method.get
                    Path { "v5" }
                    Path.users
                }
                
                URLRouting.Route(.case(Mailgun.Users.API.me)) {
                    Method.get
                    Path { "v5" }
                    Path.users
                    Path.me
                }
                
                URLRouting.Route(.case(Mailgun.Users.API.get)) {
                    Method.get
                    Path { "v5" }
                    Path.users
                    Path { Parse(.string) }
                }
                
                URLRouting.Route(.case(Mailgun.Users.API.addToOrganization)) {
                    Method.put
                    Path { "v5" }
                    Path.users
                    Path { Parse(.string) }
                    Path.org
                    Path { Parse(.string) }
                    Body(.form(Mailgun.Users.Organization.UpdateRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
                
                URLRouting.Route(.case(Mailgun.Users.API.removeFromOrganization)) {
                    Method.delete
                    Path { "v5" }
                    Path.users
                    Path { Parse(.string) }
                    Path.org
                    Path { Parse(.string) }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe)
    public static let users: Path<PathBuilder.Component<String>> = Path {
        "users"
    }
    
    nonisolated(unsafe)
    public static let me: Path<PathBuilder.Component<String>> = Path {
        "me"
    }
    
    nonisolated(unsafe)
    public static let org: Path<PathBuilder.Component<String>> = Path {
        "org"
    }
}
