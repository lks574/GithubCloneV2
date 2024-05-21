import ComposableArchitecture
import Domain
import Platform
import SwiftUI

// MARK: - AppEnvironment

public struct AppEnvironment {
  public let githubSearchUseCase: GithubSearchUseCase
}

// MARK: TestDependencyKey

extension AppEnvironment: TestDependencyKey {
  static public var previewValue: AppEnvironment = .init(
    githubSearchUseCase: GithubSearchUseCaseMock())

  public static var testValue: AppEnvironment = .init(
    githubSearchUseCase: GithubSearchUseCaseMock())
}

// MARK: DependencyKey

extension AppEnvironment: DependencyKey {
  static public var liveValue: AppEnvironment = .init(
    githubSearchUseCase: GithubSearchUseCasePlatform())
}

extension DependencyValues {
  public var appEnvironment: AppEnvironment {
    get { self[AppEnvironment.self] }
    set { self[AppEnvironment.self] = newValue }
  }
}
