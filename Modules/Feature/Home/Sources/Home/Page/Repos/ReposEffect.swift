import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - ReposEffect

struct ReposEffect {
  @Dependency(\.appEnvironment) var appEnvironment

  private let main: AnySchedulerOf<DispatchQueue>
  private let navigator: RootNavigatorType

  init(
    main: AnySchedulerOf<DispatchQueue> = .main,
    navigator: RootNavigatorType)
  {
    self.main = main
    self.navigator = navigator
  }
}

extension ReposEffect {
  var repos: (GithubEntity.Users.Repos.Request) -> Effect<ReposReducer.Action> {
    { req in
      .run { send in
        await send(.fetchRepos(Result { try await appEnvironment.githubSearchUseCase.userRepos(req) }))
      }
    }
  }
}

extension ReposEffect {
  var routeToBack: () -> Void {
    {
      navigator.back(isAnimated: true)
    }
  }
}
