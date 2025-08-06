//
//  File.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 24/12/2024.
//

import Mailgun_Types_Shared
import URLFormCoding

extension Mailgun.Templates {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case create(domainId: Domain, request: Mailgun.Templates.Template.Create.Request)
        case list(domainId: Domain, page: Page, limit: Int, p: String?)
        case get(domainId: Domain, templateId: String, active: String?)
        case update(domainId: Domain, templateId: String, request: Mailgun.Templates.Template.Update.Request)
        case delete(domainId: Domain, templateId: String)
        case deleteAll(domainId: Domain)
        case versions(domainId: Domain, templateName: String, page: Page?, limit: Int?, p: String?)
        case createVersion(domainId: Domain, templateId: String, request: Mailgun.Templates.Version.Create.Request)
        case getVersion(domainId: Domain, templateId: String, versionId: String)
        case updateVersion(domainId: Domain, templateId: String, versionId: String, request: Mailgun.Templates.Version.Update.Request)
        case deleteVersion(domainId: Domain, templateId: String, versionId: String)
        case copyVersion(domainId: Domain, templateName: String, versionName: String, newVersionName: String, comment: String?)
    }
}

extension Mailgun.Templates.API {
    public struct Router: ParserPrinter, Sendable {
        public init() {}

        public var body: some URLRouting.Router<Mailgun.Templates.API> {
            OneOf {
                // POST /v3/{domainId}/templates
                Route(.case(Mailgun.Templates.API.create)) {
                    let multipartFormCoding = URLFormCoding.Multipart.Conversion(
                        Mailgun.Templates.Template.Create.Request.self,
                        decoder: .mailgun,
                        encoder: .mailgun
                    )
                    Headers {
                        Field.contentType { multipartFormCoding.contentType }
                    }
                    Method.post
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Body(multipartFormCoding)
                }

                // GET /v3/{domainId}/templates/{templateId}
                Route(.case(Mailgun.Templates.API.get)) {
                    Method.get
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Query {
                        Optionally {
                            Field("active") { Parse(.string) }
                        }
                    }
                }

                // PUT /v3/{domainId}/templates/{templateId}
                Route(.case(Mailgun.Templates.API.update)) {
                    let multipartFormCoding = URLFormCoding.Multipart.Conversion(
                        Mailgun.Templates.Template.Update.Request.self,
                        decoder: .mailgun,
                        encoder: .mailgun
                    )
                    Headers {
                        Field.contentType { multipartFormCoding.contentType }
                    }
                    Method.put
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Body(multipartFormCoding)
                }

                // DELETE /v3/{domainId}/templates/{templateId}
                Route(.case(Mailgun.Templates.API.delete)) {
                    Method.delete
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                }

                // DELETE /v3/{domainId}/templates/
                Route(.case(Mailgun.Templates.API.deleteAll)) {
                    Method.delete
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                }

                // GET /v3/{domainId}/templates/{templateId}/versions
                Route(.case(Mailgun.Templates.API.versions)) {
                    Method.get
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Path.versions
                    Query {
                        Optionally {
                            Field("page") { Parse(.string.representing(Mailgun.Templates.Page.self)) }
                        }
                    }
                    Query {
                        Optionally {
                            Field("limit") { Digits() }
                        }
                    }

                    Query {
                        Optionally {
                            Field("p") { Parse(.string) }
                        }
                    }
                }

                // POST /v3/{domainId}/templates/{templateId}/versions
                Route(.case(Mailgun.Templates.API.createVersion)) {
                    let multipartFormCoding = URLFormCoding.Multipart.Conversion(
                        Mailgun.Templates.Version.Create.Request.self,
                        decoder: .mailgun,
                        encoder: .mailgun
                    )
                    Headers {
                        Field.contentType { multipartFormCoding.contentType }
                    }
                    Method.post
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Path.versions
                    Body(multipartFormCoding)
                }

                // GET /v3/{domainId}/templates/{templateId}/versions/{versionId}
                Route(.case(Mailgun.Templates.API.getVersion)) {
                    Method.get
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Path.versions
                    Path { Parse(.string) }
                }

                // PUT /v3/{domainId}/templates/{templateId}/versions/{versionId}
                Route(.case(Mailgun.Templates.API.updateVersion)) {
                    let multipartFormCoding = URLFormCoding.Multipart.Conversion(
                        Mailgun.Templates.Version.Update.Request.self,
                        decoder: .mailgun,
                        encoder: .mailgun
                    )
                    Headers {
                        Field.contentType { multipartFormCoding.contentType }
                    }
                    Method.put
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Path.versions
                    Path { Parse(.string) }
                    Body(multipartFormCoding)
                }

                // DELETE /v3/{domainId}/templates/{templateId}/versions/{versionId}
                Route(.case(Mailgun.Templates.API.deleteVersion)) {
                    Method.delete
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Path.versions
                    Path { Parse(.string) }
                }

                // PUT /v3/{domainId}/templates/{templateId}/versions/{versionId}/copy/{versionIdTo}
                Route(.case(Mailgun.Templates.API.copyVersion)) {
                    Method.put
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Path { Parse(.string) }
                    Path.versions
                    Path { Parse(.string) }
                    Path { "copy" }
                    Path { Parse(.string) }
                    Query {
                        Optionally {
                            Field("comment") { Parse(.string) }
                        }
                    }
                }

                // GET /v3/{domainId}/templates
                Route(.case(Mailgun.Templates.API.list)) {
                    Method.get
                    Path { "v3" }
                    Path { Parse(.string.representing(Domain.self)) }
                    Path.templates
                    Query {
                        Field("page") { Parse(.string.representing(Mailgun.Templates.Page.self)) }
                    }
                    Query {
                        Field("limit") { Digits() }
                    }
                    Query {
                        Optionally {
                            Field("p") { Parse(.string) }
                        }
                    }
                }
            }
        }
    }
}

extension Path<PathBuilder.Component<String>> {
    nonisolated(unsafe) static let templates = Path { "templates" }
    nonisolated(unsafe) static let versions = Path { "versions" }
}
