import Architecture
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
