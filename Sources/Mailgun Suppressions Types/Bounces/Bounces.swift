import Foundation
@_exported import Mailgun_Types_Shared

extension Mailgun.Suppressions {
    public enum Bounces {}
}

extension Mailgun.Suppressions.Bounces {
    public enum Get {}
}

extension Mailgun.Suppressions.Bounces.Get {
    public typealias Response = Mailgun.Suppressions.Bounces.Record
}

extension Mailgun.Suppressions.Bounces {
    public struct Record: Sendable, Codable, Equatable {
        public let address: EmailAddress
        public let code: String
        public let error: String
        public let createdAt: String

        public init(
            address: EmailAddress,
            code: String,
            error: String,
            createdAt: String
        ) {
            self.address = address
            self.code = code
            self.error = error
            self.createdAt = createdAt
        }

        private enum CodingKeys: String, CodingKey {
            case address
            case code
            case error
            case createdAt = "created_at"
        }
    }
}

extension Mailgun.Suppressions.Bounces {
    public enum Import {}
}

extension Mailgun.Suppressions.Bounces.Import {
    public struct Request: Sendable, Codable, Equatable {
        public let file: Data

        public init(file: Data) {
            self.file = file
        }
    }

    public struct Response: Sendable, Codable, Equatable {
        public let message: String

        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Suppressions.Bounces {
    public enum Create {}
}

extension Mailgun.Suppressions.Bounces.Create {
    public struct Request: Sendable, Codable, Equatable {
        public let address: EmailAddress
        public let code: String?
        public let error: String?
        public let createdAt: String?

        public init(
            address: EmailAddress,
            code: String? = nil,
            error: String? = nil,
            createdAt: String? = nil
        ) {
            self.address = address
            self.code = code
            self.error = error
            self.createdAt = createdAt
        }

        private enum CodingKeys: String, CodingKey {
            case address
            case code
            case error
            case createdAt = "created_at"
        }
    }

    public struct Response: Sendable, Codable, Equatable {
        public let message: String

        public init(message: String) {
            self.message = message
        }
    }
}

extension Mailgun.Suppressions.Bounces {
    public enum Delete {}
}

extension Mailgun.Suppressions.Bounces.Delete {
    public struct Response: Sendable, Codable, Equatable {
        public let message: String
        public let address: EmailAddress

        public init(
            message: String,
            address: EmailAddress
        ) {
            self.message = message
            self.address = address
        }
    }
}

extension Mailgun.Suppressions.Bounces.Delete {
    public enum All {
        public struct Response: Sendable, Codable, Equatable {
            public let message: String

            public init(
                message: String
            ) {
                self.message = message
            }
        }
    }
}

extension Mailgun.Suppressions.Bounces {
    public enum List {}
}

extension Mailgun.Suppressions.Bounces.List {
    public struct Request: Sendable, Codable, Equatable {
        public let limit: Int?
        public let page: String?
        public let term: String?

        public init(
            limit: Int? = nil,
            page: String? = nil,
            term: String? = nil
        ) {
            self.limit = limit
            self.page = page
            self.term = term
        }
    }

    public struct Response: Sendable, Codable, Equatable {
        public let items: [Mailgun.Suppressions.Bounces.Record]
        public let paging: Paging

        public init(
            items: [Mailgun.Suppressions.Bounces.Record],
            paging: Paging
        ) {
            self.items = items
            self.paging = paging
        }
    }

    public struct Paging: Sendable, Codable, Equatable {
        public let previous: String?
        public let first: String
        public let next: String?
        public let last: String

        public init(
            previous: String?,
            first: String,
            next: String?,
            last: String
        ) {
            self.previous = previous
            self.first = first
            self.next = next
            self.last = last
        }
    }
}
