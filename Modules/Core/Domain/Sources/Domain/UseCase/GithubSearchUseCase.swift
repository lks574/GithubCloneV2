public protocol GithubSearchUseCase {
  var searchUser: @Sendable (GithubEntity.Search.User.Request) async throws -> GithubEntity.Search.User.Response { get }
  var user: @Sendable (GithubEntity.Users.User.Request) async throws -> GithubEntity.Users.User.Response { get }
  var userRepos: @Sendable (GithubEntity.Users.Repos.Request) async throws -> [GithubEntity.Users.Repos.Response] { get }
}
