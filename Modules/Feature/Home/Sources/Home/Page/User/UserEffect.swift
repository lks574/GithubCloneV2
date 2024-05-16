import Architecture
import ComposableArchitecture
import Foundation

struct UserEffect {
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
