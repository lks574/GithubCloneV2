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
