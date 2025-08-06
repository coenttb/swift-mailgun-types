//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared

extension Mailgun.IPAllowlist {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case list
        case update(request: Mailgun.IPAllowlist.UpdateRequest)
        case add(request: Mailgun.IPAllowlist.AddRequest)
        case delete(request: Mailgun.IPAllowlist.DeleteRequest)
    }
}

extension Mailgun.IPAllowlist.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}
        
        public var body: some URLRouting.Router<Mailgun.IPAllowlist.API> {
            OneOf {
                URLRouting.Route(.case(Mailgun.IPAllowlist.API.list)) {
                    Method.get
                    Path.v2
                    Path.ipAllowlist
                }
                
                URLRouting.Route(.case(Mailgun.IPAllowlist.API.update)) {
                    Method.put
                    Path.v2
                    Path.ipAllowlist
                    Body(.form(Mailgun.IPAllowlist.UpdateRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
                
                URLRouting.Route(.case(Mailgun.IPAllowlist.API.add)) {
                    Method.post
                    Path.v2
                    Path.ipAllowlist
                    Body(.form(Mailgun.IPAllowlist.AddRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
                
                URLRouting.Route(.case(Mailgun.IPAllowlist.API.delete)) {
                    Method.delete
                    Path.v2
                    Path.ipAllowlist
                    Body(.form(Mailgun.IPAllowlist.DeleteRequest.self, decoder: .mailgun, encoder: .mailgun))
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe)
    public static let v2: Path<PathBuilder.Component<String>> = Path {
        "v2"
    }
    
    nonisolated(unsafe)
    public static let ipAllowlist: Path<PathBuilder.Component<String>> = Path {
        "ip_Allowlist"
    }
}
