import Alamofire
import Domain
import Foundation
import Pulse

// MARK: - GithubSearchUseCasePlatform

public struct GithubSearchUseCasePlatform {
  let baseURL: String

  public init(
    baseURL: String = "https://api.github.com")
  {
    self.baseURL = baseURL
    URLSessionProxyDelegate.enableAutomaticRegistration()
  }
}

// MARK: GithubSearchUseCase

extension GithubSearchUseCasePlatform: GithubSearchUseCase {
  public var searchUser: @Sendable (GithubEntity.Search.User.Request) async throws -> GithubEntity.Search.User.Response {
    { req in
      let res = await AF.request(baseURL + "/search/users", method: .get, parameters: req.parameters)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .serializingDecodable(GithubEntity.Search.User.Response.self)
        .response
      switch res.result {
      case .success(let response): return response
      case .failure(let error): throw error
      }
    }
  }

  public var user: @Sendable (GithubEntity.Users.User.Request) async throws -> GithubEntity.Users.User.Response {
    { req in
      let res = await AF.request(baseURL + "/users/\(req.username)", method: .get)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .serializingDecodable(GithubEntity.Users.User.Response.self)
        .response
      switch res.result {
      case .success(let response): return response
      case .failure(let error): throw error
      }
    }
  }

  public var userRepos: @Sendable (GithubEntity.Users.Repos.Request) async throws -> [GithubEntity.Users.Repos.Response] {
    { req in
      let res = await AF.request(baseURL + "/users/\(req.username)/repos", method: .get)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .serializingDecodable([GithubEntity.Users.Repos.Response].self)
        .response
      switch res.result {
      case .success(let response): return response
      case .failure(let error): throw error
      }
    }
  }
}
