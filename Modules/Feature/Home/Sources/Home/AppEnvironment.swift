import Platform
import SwiftUI
import ComposableArchitecture
import Domain

public struct AppEnvironment {
  public let githubSearchUseCase: GithubSearchUseCase
}

extension AppEnvironment: TestDependencyKey {
  static public var previewValue: AppEnvironment = .init(
    githubSearchUseCase: GithubSearchUseCaseMock())

  public static var testValue: AppEnvironment = .init(
    githubSearchUseCase: GithubSearchUseCaseMock())
}

extension AppEnvironment: DependencyKey {
  static public var liveValue: AppEnvironment = .init(
    githubSearchUseCase: GithubSearchUseCasePlatform()
  )
}

extension DependencyValues {
  public var appEnvironment: AppEnvironment {
    get { self[AppEnvironment.self] }
    set { self[AppEnvironment.self] = newValue }
  }
}
