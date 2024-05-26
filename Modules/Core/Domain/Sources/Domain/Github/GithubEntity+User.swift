// MARK: - GithubEntity.Users

extension GithubEntity {
  public enum Users {
    public enum User { }
    public enum Repos { }
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
    public enum CodingKeys: String, CodingKey {
      case avatarURL = "avatar_url"
      case bio
      case blog
      case company
      case createdAt = "created_at"
      case email
      case eventsURL = "events_url"
      case followers
      case followersURL = "followers_url"
      case following
      case followingURL = "following_url"
      case gistsURL = "gists_url"
      case gravatarID = "gravatar_id"
      case hireable
      case htmlURL = "html_url"
      case id
      case location
      case login
      case name
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
      case type
      case updatedAt = "updated_at"
      case url
    }

    public let avatarURL: String
    public let bio: String?
    public let blog: String
    public let company: String?
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
    public let name: String?
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

  }
}

extension GithubEntity.Users.Repos {
  public struct Request: Equatable, Codable, Sendable {
    public let username: String

    public init(username: String) {
      self.username = username
    }

    enum CodingKeys: String, CodingKey {
      case username
    }
  }

  public struct Response: Equatable, Codable, Identifiable, Sendable {
    public enum CodingKeys: String, CodingKey {
      case id
      case nodeID = "node_id"
      case name
      case fullName = "full_name"
      case repoPrivate = "private"
      case owner
      case htmlURL = "html_url"
      case description, fork, url
      case forksURL = "forks_url"
      case keysURL = "keys_url"
      case collaboratorsURL = "collaborators_url"
      case teamsURL = "teams_url"
      case hooksURL = "hooks_url"
      case issueEventsURL = "issue_events_url"
      case eventsURL = "events_url"
      case assigneesURL = "assignees_url"
      case branchesURL = "branches_url"
      case tagsURL = "tags_url"
      case blobsURL = "blobs_url"
      case gitTagsURL = "git_tags_url"
      case gitRefsURL = "git_refs_url"
      case treesURL = "trees_url"
      case statusesURL = "statuses_url"
      case languagesURL = "languages_url"
      case stargazersURL = "stargazers_url"
      case contributorsURL = "contributors_url"
      case subscribersURL = "subscribers_url"
      case subscriptionURL = "subscription_url"
      case commitsURL = "commits_url"
      case gitCommitsURL = "git_commits_url"
      case commentsURL = "comments_url"
      case issueCommentURL = "issue_comment_url"
      case contentsURL = "contents_url"
      case compareURL = "compare_url"
      case mergesURL = "merges_url"
      case archiveURL = "archive_url"
      case downloadsURL = "downloads_url"
      case issuesURL = "issues_url"
      case pullsURL = "pulls_url"
      case milestonesURL = "milestones_url"
      case notificationsURL = "notifications_url"
      case labelsURL = "labels_url"
      case releasesURL = "releases_url"
      case deploymentsURL = "deployments_url"
      case createdAt = "created_at"
      case updatedAt = "updated_at"
      case pushedAt = "pushed_at"
      case gitURL = "git_url"
      case sshURL = "ssh_url"
      case cloneURL = "clone_url"
      case svnURL = "svn_url"
      case homepage, size
      case stargazersCount = "stargazers_count"
      case watchersCount = "watchers_count"
      case language
      case hasIssues = "has_issues"
      case hasProjects = "has_projects"
      case hasDownloads = "has_downloads"
      case hasWiki = "has_wiki"
      case hasPages = "has_pages"
      case hasDiscussions = "has_discussions"
      case forksCount = "forks_count"
      case mirrorURL = "mirror_url"
      case archived, disabled
      case openIssuesCount = "open_issues_count"
      case license
      case allowForking = "allow_forking"
      case isTemplate = "is_template"
      case webCommitSignoffRequired = "web_commit_signoff_required"
      case topics, visibility, forks
      case openIssues = "open_issues"
      case watchers
      case defaultBranch = "default_branch"
    }

    public struct Owner: Equatable, Codable, Sendable {
      public enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
      }

      public let login: String
      public let id: Int
      public let nodeID: String
      public let avatarURL: String
      public let gravatarID: String
      public let url, htmlURL, followersURL: String
      public let followingURL, gistsURL, starredURL: String
      public let subscriptionsURL, organizationsURL, reposURL: String
      public let eventsURL: String
      public let receivedEventsURL: String
      public let type: String
      public let siteAdmin: Bool

    }

    public struct License: Equatable, Codable, Sendable {
      public let key: String
      public let name: String
      public let nodeID: String
      public let spdxID: String
      public let url: String?

      public enum CodingKeys: String, CodingKey {
        case key
        case name
        case nodeID = "node_id"
        case spdxID = "spdx_id"
        case url
      }
    }

    public let id: Int
    public let nodeID, name, fullName: String
    public let repoPrivate: Bool
    public let owner: Owner
    public let htmlURL: String
    public let description: String?
    public let fork: Bool
    public let url, forksURL: String
    public let keysURL, collaboratorsURL: String
    public let teamsURL, hooksURL: String
    public let issueEventsURL: String
    public let eventsURL: String
    public let assigneesURL, branchesURL: String
    public let tagsURL: String
    public let blobsURL, gitTagsURL, gitRefsURL, treesURL: String
    public let statusesURL: String
    public let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
    public let subscriptionURL: String
    public let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String
    public let contentsURL, compareURL: String
    public let mergesURL: String
    public let archiveURL: String
    public let downloadsURL: String
    public let issuesURL, pullsURL, milestonesURL, notificationsURL: String
    public let labelsURL, releasesURL: String
    public let deploymentsURL: String
    public let createdAt, updatedAt, pushedAt: String
    public let gitURL, sshURL: String
    public let cloneURL: String
    public let svnURL: String
    public let homepage: String?
    public let size, stargazersCount, watchersCount: Int
    public let language: String?
    public let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    public let hasPages, hasDiscussions: Bool
    public let forksCount: Int
    public let mirrorURL: String?
    public let archived, disabled: Bool
    public let openIssuesCount: Int
    public let license: License?
    public let allowForking, isTemplate, webCommitSignoffRequired: Bool
    public let topics: [String?]
    public let visibility: String
    public let forks, openIssues, watchers: Int
    public let defaultBranch: String

  }
}
