import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - UserEffect

struct UserEffect {
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

extension UserEffect {
  var searchUser: (GithubEntity.Search.User.Request) -> Effect<UserReducer.Action> {
    { req in
      .run { send in
        await send(.fetchSearchUser(Result { try await appEnvironment.githubSearchUseCase.searchUser(req) }))
      }
    }
  }
}

extension UserEffect {
  var routeToDetail: (RouteLink.Home.QueryItem.UserDetail) -> Void {
    { user in
      navigator.backOrNext(
        linkItem: .init(
          path: RouteLink.Home.Path.userDetail.rawValue,
          items: user),
        isAnimated: true)
    }
  }
}
