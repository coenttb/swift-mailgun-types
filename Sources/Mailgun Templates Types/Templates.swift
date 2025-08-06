//
//  Template.swift
//  coenttb-mailgun
//
//  Created by Coen ten Thije Boonkkamp on 30/12/2024.
//

import Mailgun_Types_Shared
extension Mailgun {
    public enum Templates {}
}

extension Mailgun.Templates {
    public struct Template: Sendable, Codable, Equatable {
        public let name: String
        public let description: String
        public let createdAt: String
        public let createdBy: String?
        public let id: String
        public let version: Version?
        public let versions: [Version]?

        public init(
            name: String,
            description: String,
            createdAt: String,
            createdBy: String? = nil,
            id: String,
            version: Version? = nil,
            versions: [Version]? = nil
        ) {
            self.name = name
            self.description = description
            self.createdAt = createdAt
            self.createdBy = createdBy
            self.id = id
            self.version = version
            self.versions = versions
        }
    }
}

extension Mailgun.Templates {
    public struct Version: Sendable, Codable, Equatable {
        public let tag: String
        public let template: String?
        public let engine: String?
        public let mjml: String?
        public let createdAt: String?
        public let comment: String?
        public let active: Bool?
        public let id: String

        public init(
            tag: String,
            template: String? = nil,
            engine: String? = nil,
            mjml: String? = nil,
            createdAt: String? = nil,
            comment: String? = nil,
            active: Bool? = nil,
            id: String
        ) {
            self.tag = tag
            self.template = template
            self.engine = engine
            self.mjml = mjml
            self.createdAt = createdAt
            self.comment = comment
            self.active = active
            self.id = id
        }
    }
}

extension Mailgun.Templates {
    public struct Paging: Sendable, Codable, Equatable {
        public let first: String
        public let last: String
        public let next: String?
        public let previous: String?

        public init(
            first: String,
            last: String,
            next: String?,
            previous: String?
        ) {
            self.first = first
            self.last = last
            self.next = next
            self.previous = previous
        }
    }
}

extension Mailgun.Templates {
    public enum Page: String, Codable, Hashable, Sendable {
        case first
        case last
        case next
        case previous
    }
}

extension Mailgun.Templates.Template {
    public enum Create {
        public struct Request: Sendable, Codable, Equatable {
            public let name: String?
            public let description: String?
            public let template: String?
            public let engine: String?
            public let tag: String
            public let comment: String?

            public init(
                name: String?,
                description: String?,
                template: String?,
                engine: String?,
                tag: String,
                comment: String?
            ) {
                self.name = name
                self.description = description
                self.template = template
                self.engine = engine
                self.tag = tag
                self.comment = comment
            }
        }

        public struct Response: Sendable, Codable, Equatable {
            public let template: Mailgun.Templates.Template
            public let message: String

            public init(template: Mailgun.Templates.Template, message: String) {
                self.template = template
                self.message = message
            }
        }
    }

    public struct List {
        public struct Request {
            public let page: Mailgun.Templates.Page
            public let limit: Int
            public let p: String?

            public init(
                page: Mailgun.Templates.Page = .first,
                limit: Int = 100,
                p: String? = nil
            ) {
                self.page = page
                self.limit = limit
                self.p = p
            }
        }

        public struct Response: Sendable, Codable, Equatable {
            public let items: [Mailgun.Templates.Template]
            public let paging: Mailgun.Templates.Paging

            public init(items: [Mailgun.Templates.Template], paging: Mailgun.Templates.Paging) {
                self.items = items
                self.paging = paging
            }
        }
    }

    public struct Get {
        public struct Response: Sendable, Codable, Equatable {
            public let template: Mailgun.Templates.Template

            public init(template: Mailgun.Templates.Template) {
                self.template = template
            }
        }
    }

    public struct Update {

        public struct Request: Sendable, Codable, Equatable {
            public let name: String?
            public let description: String?

            public init(name: String?, description: String?) {
                self.name = name
                self.description = description
            }
        }

        public struct Response: Sendable, Codable, Equatable {
            public let message: String
            public let template: Template

            public struct Template: Sendable, Codable, Equatable {
                public let name: String
                public let version: Mailgun.Templates.Version?

                public init(
                    name: String,
                    version: Mailgun.Templates.Version? = nil
                ) {
                    self.name = name
                    self.version = version
                }
            }

            public init(message: String, template: Template) {
                self.message = message
                self.template = template
            }
        }
    }

//    {\"message\":\"template has been deleted\",\"template\":{\"name\":\"delete test template\"}}
    public struct Delete {
        public struct Response: Sendable, Codable, Equatable {
            public let message: String
            public let template: Template

            public init(
                message: String,
                template: Template
            ) {
                self.template = template
                self.message = message
            }

            public struct Template: Sendable, Codable, Equatable {
                public let name: String
                public let version: Mailgun.Templates.Version?

                public init(name: String, version: Mailgun.Templates.Version? = nil) {
                    self.name = name
                    self.version = version
                }
            }
        }

        public enum All {
            public struct Response: Sendable, Codable, Equatable {
                public let message: String

                public init(message: String) {
                    self.message = message
                }
            }
        }
    }

    public struct Versions {
        public struct Request {
            public let templateName: String
            public let page: Mailgun.Templates.Page
            public let limit: Int?
            public let p: String?

            public init(
                templateName: String,
                page: Mailgun.Templates.Page,
                limit: Int? = nil,
                p: String? = nil
            ) {
                self.templateName = templateName
                self.page = page
                self.limit = limit
                self.p = p
            }
        }

        public struct Response: Sendable, Codable, Equatable {
            public let template: Mailgun.Templates.Template
            public let paging: Mailgun.Templates.Paging

            public init(template: Mailgun.Templates.Template, paging: Mailgun.Templates.Paging) {
                self.template = template
                self.paging = paging
            }
        }
    }
}

extension Mailgun.Templates.Version {
    public enum Create {
        public struct Request: Sendable, Codable, Equatable {
            public let template: String
            public let tag: String
            public let comment: String?
            public let engine: String?

            public init(
                template: String,
                tag: String,
                comment: String?,
                engine: String?
            ) {
                self.template = template
                self.tag = tag
                self.comment = comment
                self.engine = engine
            }
        }

        public struct Response: Sendable, Codable, Equatable {
            public let message: String
            public let template: Mailgun.Templates.Template

            public init(message: String, template: Mailgun.Templates.Template) {
                self.message = message
                self.template = template
            }
        }
    }

    public struct Get {
        public struct Response: Sendable, Codable, Equatable {
            public let template: Mailgun.Templates.Template

            public init(template: Mailgun.Templates.Template) {
                self.template = template
            }
        }
    }

    public struct Update {
        public struct Request: Sendable, Codable, Equatable {
            public let template: String?
            public let tag: String?
            public let active: Bool?
            public let engine: String?
            public let comment: String?

            public init(
                template: String?,
                tag: String?,
                active: Bool?,
                engine: String?,
                comment: String?
            ) {
                self.template = template
                self.tag = tag
                self.active = active
                self.engine = engine
                self.comment = comment
            }
        }

        public struct Response: Sendable, Codable, Equatable {
            public let message: String
            public let template: Mailgun.Templates.Template

            public init(message: String, template: Mailgun.Templates.Template) {
                self.message = message
                self.template = template
            }
        }
    }

    public struct Delete {
        public struct Response: Sendable, Codable, Equatable {
            public let message: String
            public let template: Mailgun.Templates.Template

            public init(message: String, template: Mailgun.Templates.Template) {
                self.message = message
                self.template = template
            }
        }
    }

    public struct Copy {
        public struct Response: Sendable, Codable, Equatable {
            public let message: String
            public let version: Mailgun.Templates.Version?

            public init(message: String, version: Mailgun.Templates.Version?) {
                self.message = message
                self.version = version
            }
        }
    }
}
