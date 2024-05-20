public protocol GithubSearchUseCase {
  var searchUser: @Sendable (GithubEntity.Search.User.Request) async throws -> GithubEntity.Search.User.Response { get }
}
