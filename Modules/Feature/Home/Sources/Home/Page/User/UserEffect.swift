import Architecture
import ComposableArchitecture
import Foundation
import Domain

struct UserEffect {
  @Dependency(\.appEnvironment) var appEnvironment

  let main: AnySchedulerOf<DispatchQueue>
  let navigator: RootNavigatorType

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

