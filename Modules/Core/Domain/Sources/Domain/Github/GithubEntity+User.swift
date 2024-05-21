extension GithubEntity {
  public enum Users {
    public enum User { }
  }
}

extension GithubEntity.Users.User {
  public struct Request: Equatable, Codable, Sendable {
    public let username: String

    public init(username: String) {
      self.username = username
    }

    enum CodingKeys: String, CodingKey {
      case username
    }
  }

  public struct Response: Equatable, Codable, Sendable {
    public let avatarURL: String
    public let bio: String?
    public let blog: String
    public let company: String
    public let createdAt: String
    public let email: String?
    public let eventsURL: String
    public let followers: Int
    public let followersURL: String
    public let following: Int
    public let followingURL: String
    public let gistsURL: String
    public let gravatarID: String
    public let hireable: String?
    public let htmlURL: String
    public let id: Int
    public let location: String?
    public let login: String
    public let name: String
    public let nodeID: String
    public let organizationsURL: String
    public let publicGists: Int
    public let publicRepos: Int
    public let receivedEventsURL: String
    public let reposURL: String
    public let siteAdmin: Bool
    public let starredURL: String
    public let subscriptionsURL: String
    public let twitterUsername: String?
    public let type: String
    public let updatedAt: String
    public let url: String

    public enum CodingKeys: String, CodingKey {
      case avatarURL = "avatar_url"
      case bio = "bio"
      case blog = "blog"
      case company = "company"
      case createdAt = "created_at"
      case email = "email"
      case eventsURL = "events_url"
      case followers = "followers"
      case followersURL = "followers_url"
      case following = "following"
      case followingURL = "following_url"
      case gistsURL = "gists_url"
      case gravatarID = "gravatar_id"
      case hireable = "hireable"
      case htmlURL = "html_url"
      case id = "id"
      case location = "location"
      case login = "login"
      case name = "name"
      case nodeID = "node_id"
      case organizationsURL = "organizations_url"
      case publicGists = "public_gists"
      case publicRepos = "public_repos"
      case receivedEventsURL = "received_events_url"
      case reposURL = "repos_url"
      case siteAdmin = "site_admin"
      case starredURL = "starred_url"
      case subscriptionsURL = "subscriptions_url"
      case twitterUsername = "twitter_username"
      case type = "type"
      case updatedAt = "updated_at"
      case url = "url"
    }

  }
}
