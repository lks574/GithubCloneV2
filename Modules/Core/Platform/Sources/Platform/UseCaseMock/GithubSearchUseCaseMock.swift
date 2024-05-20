import Domain

public struct GithubSearchUseCaseMock {
  public init() { }
}

extension GithubSearchUseCaseMock: GithubSearchUseCase {
  public var searchUser: @Sendable (GithubEntity.Search.User.Request) async throws -> GithubEntity.Search.User.Response {
    { _ in
        return .init()
    }
  }
}
