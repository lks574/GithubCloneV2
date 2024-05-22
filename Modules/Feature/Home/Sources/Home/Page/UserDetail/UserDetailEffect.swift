import Architecture
import UIKit
import ComposableArchitecture
import Domain
import Foundation

struct UserDetailEffect {
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

extension UserDetailEffect {
  var user: (GithubEntity.Users.User.Request) -> Effect<UserDetailReducer.Action> {
    { req in
        .run { send in
          await send(.fetchUser(Result {
            try await appEnvironment.githubSearchUseCase.user(req)
          }))
        }
    }
  }
}

extension UserDetailEffect {
  var routeToURL: (String) -> Void {
    { url in
      guard 
        let url = URL(string: url),
        UIApplication.shared.canOpenURL(url)
      else { return }
      UIApplication.shared.open(url, options: [:])
    }
  }

  var routeToRepos: (RouteLink.Home.QueryItem.Username) -> Void {
    { user in
      navigator.backOrNext(
        linkItem: .init(
          path: RouteLink.Home.Path.repos.rawValue,
          items: user),
        isAnimated: true)
    }
  }
}
