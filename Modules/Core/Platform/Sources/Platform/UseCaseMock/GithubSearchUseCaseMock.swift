import Domain
import Foundation

// MARK: - GithubSearchUseCaseMock

public struct GithubSearchUseCaseMock {
  public init() { }
}

// MARK: GithubSearchUseCase

extension GithubSearchUseCaseMock: GithubSearchUseCase {
  public var searchUser: @Sendable (GithubEntity.Search.User.Request) async throws -> GithubEntity.Search.User.Response {
    { _ in
      let data = try! Data(contentsOf: Files.searchUserJson.url)
      return try! JSONDecoder().decode(GithubEntity.Search.User.Response.self, from: data)
    }
  }

  public var user: @Sendable (GithubEntity.Users.User.Request) async throws -> GithubEntity.Users.User.Response {
    { _ in
      let data = try! Data(contentsOf: Files.userJson.url)
      return try! JSONDecoder().decode(GithubEntity.Users.User.Response.self, from: data)
    }
  }

  public var userRepos: @Sendable (GithubEntity.Users.Repos.Request) async throws -> [GithubEntity.Users.Repos.Response] {
    { _ in
      let data = try! Data(contentsOf: Files.reposJson.url)
      return try! JSONDecoder().decode([GithubEntity.Users.Repos.Response].self, from: data)
    }
  }
}
