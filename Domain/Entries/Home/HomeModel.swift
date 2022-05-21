//
//  HomeModel.swift
//  Domain
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation

// MARK: - HomeModelElement
public class HomeModel: Codable {
    public var id: String?
    public var createdAt: String?
    public var updatedAt: String?
    public var promotedAt: String?
    public var width: Int?
    public var height: Int?
    public var color: String?
    public var blurHash: String?
    public var homeModelDescription: String?
    public var altDescription: String?
    public var urls: Urls?
    public var links: HomeModelLinks?
    public var categories: [JSONAny]?
    public var likes: Int?
    public var likedByUser: Bool?
    public var currentUserCollections: [JSONAny]?
    public var sponsorship: Sponsorship?
    public var topicSubmissions: TopicSubmissions?
    public var user: User?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width = "width"
        case height = "height"
        case color = "color"
        case blurHash = "blur_hash"
        case homeModelDescription = "description"
        case altDescription = "alt_description"
        case urls = "urls"
        case links = "links"
        case categories = "categories"
        case likes = "likes"
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case sponsorship = "sponsorship"
        case topicSubmissions = "topic_submissions"
        case user = "user"
    }

    public init(id: String?, createdAt: String?, updatedAt: String?, promotedAt: String?, width: Int?, height: Int?, color: String?, blurHash: String?, homeModelDescription: String?, altDescription: String?, urls: Urls?, links: HomeModelLinks?, categories: [JSONAny]?, likes: Int?, likedByUser: Bool?, currentUserCollections: [JSONAny]?, sponsorship: Sponsorship?, topicSubmissions: TopicSubmissions?, user: User?) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.promotedAt = promotedAt
        self.width = width
        self.height = height
        self.color = color
        self.blurHash = blurHash
        self.homeModelDescription = homeModelDescription
        self.altDescription = altDescription
        self.urls = urls
        self.links = links
        self.categories = categories
        self.likes = likes
        self.likedByUser = likedByUser
        self.currentUserCollections = currentUserCollections
        self.sponsorship = sponsorship
        self.topicSubmissions = topicSubmissions
        self.user = user
    }
}

// MARK: - HomeModelLinks
public struct HomeModelLinks: Codable {
    public var linksSelf: String?
    public var html: String?
    public var download: String?
    public var downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html = "html"
        case download = "download"
        case downloadLocation = "download_location"
    }

    public init(linksSelf: String?, html: String?, download: String?, downloadLocation: String?) {
        self.linksSelf = linksSelf
        self.html = html
        self.download = download
        self.downloadLocation = downloadLocation
    }
}

// MARK: - Sponsorship
public struct Sponsorship: Codable {
    public var impressionUrls: [String]?
    public var tagline: String?
    public var taglineURL: String?
    public var sponsor: User?

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline = "tagline"
        case taglineURL = "tagline_url"
        case sponsor = "sponsor"
    }

    public init(impressionUrls: [String]?, tagline: String?, taglineURL: String?, sponsor: User?) {
        self.impressionUrls = impressionUrls
        self.tagline = tagline
        self.taglineURL = taglineURL
        self.sponsor = sponsor
    }
}

// MARK: - User
public struct User: Codable {
    public var id: String?
    public var updatedAt: String?
    public var username: String?
    public var name: String?
    public var firstName: String?
    public var lastName: String?
    public var twitterUsername: String?
    public var portfolioURL: String?
    public var bio: String?
    public var location: String?
    public var links: UserLinks?
    public var profileImage: ProfileImage?
    public var instagramUsername: String?
    public var totalCollections: Int?
    public var totalLikes: Int?
    public var totalPhotos: Int?
    public var acceptedTos: Bool?
    public var forHire: Bool?
    public var social: Social?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case updatedAt = "updated_at"
        case username = "username"
        case name = "name"
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio = "bio"
        case location = "location"
        case links = "links"
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social = "social"
    }

    public init(id: String?, updatedAt: String?, username: String?, name: String?, firstName: String?, lastName: String?, twitterUsername: String?, portfolioURL: String?, bio: String?, location: String?, links: UserLinks?, profileImage: ProfileImage?, instagramUsername: String?, totalCollections: Int?, totalLikes: Int?, totalPhotos: Int?, acceptedTos: Bool?, forHire: Bool?, social: Social?) {
        self.id = id
        self.updatedAt = updatedAt
        self.username = username
        self.name = name
        self.firstName = firstName
        self.lastName = lastName
        self.twitterUsername = twitterUsername
        self.portfolioURL = portfolioURL
        self.bio = bio
        self.location = location
        self.links = links
        self.profileImage = profileImage
        self.instagramUsername = instagramUsername
        self.totalCollections = totalCollections
        self.totalLikes = totalLikes
        self.totalPhotos = totalPhotos
        self.acceptedTos = acceptedTos
        self.forHire = forHire
        self.social = social
    }
}

// MARK: - UserLinks
public struct UserLinks: Codable {
    public var linksSelf: String?
    public var html: String?
    public var photos: String?
    public var likes: String?
    public var portfolio: String?
    public var following: String?
    public var followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html = "html"
        case photos = "photos"
        case likes = "likes"
        case portfolio = "portfolio"
        case following = "following"
        case followers = "followers"
    }

    public init(linksSelf: String?, html: String?, photos: String?, likes: String?, portfolio: String?, following: String?, followers: String?) {
        self.linksSelf = linksSelf
        self.html = html
        self.photos = photos
        self.likes = likes
        self.portfolio = portfolio
        self.following = following
        self.followers = followers
    }
}

// MARK: - ProfileImage
public struct ProfileImage: Codable {
    public var small: String?
    public var medium: String?
    public var large: String?

    enum CodingKeys: String, CodingKey {
        case small = "small"
        case medium = "medium"
        case large = "large"
    }

    public init(small: String?, medium: String?, large: String?) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

// MARK: - Social
public struct Social: Codable {
    public var instagramUsername: String?
    public var portfolioURL: String?
    public var twitterUsername: String?
    public var paypalEmail: JSONNull?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }

    public init(instagramUsername: String?, portfolioURL: String?, twitterUsername: String?, paypalEmail: JSONNull?) {
        self.instagramUsername = instagramUsername
        self.portfolioURL = portfolioURL
        self.twitterUsername = twitterUsername
        self.paypalEmail = paypalEmail
    }
}

// MARK: - TopicSubmissions
public struct TopicSubmissions: Codable {
    public var streetPhotography: Film?
    public var film: Film?

    enum CodingKeys: String, CodingKey {
        case streetPhotography = "street-photography"
        case film = "film"
    }

    public init(streetPhotography: Film?, film: Film?) {
        self.streetPhotography = streetPhotography
        self.film = film
    }
}

// MARK: - Film
public struct Film: Codable {
    public var status: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
    }

    public init(status: String?) {
        self.status = status
    }
}

// MARK: - Urls
public struct Urls: Codable {
    public var raw: String?
    public var full: String?
    public var regular: String?
    public var small: String?
    public var thumb: String?
    public var smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
        case smallS3 = "small_s3"
    }

    public init(raw: String?, full: String?, regular: String?, small: String?, thumb: String?, smallS3: String?) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
        self.smallS3 = smallS3
    }
}

public typealias HomeModelElement = [HomeModel]

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

public class JSONAny: Codable {

    public let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
