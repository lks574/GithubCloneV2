import Domain
import Foundation

public struct GithubSearchUseCaseMock {
  public init() { }
}

extension GithubSearchUseCaseMock: GithubSearchUseCase {
  public var searchUser: @Sendable (GithubEntity.Search.User.Request) async throws -> GithubEntity.Search.User.Response {
    { _ in
      let data = try! Data(contentsOf: Files.searchUserJson.url)
      return try! JSONDecoder().decode(GithubEntity.Search.User.Response.self, from: data)
    }
  }
}
