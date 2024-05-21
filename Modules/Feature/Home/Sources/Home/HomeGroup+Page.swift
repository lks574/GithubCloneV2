import Architecture
import LinkNavigator

extension HomeGroup {
  static func logMonitor() -> RouteBuilderOf<RootNavigator> {
    let matchPath = RouteLink.Home.Path.logMonitor.rawValue
    return .init(matchPath: matchPath) { _, _, _ in
      DebugWrappingController(matchPath: matchPath) {
        LogMonitorPage()
      }
    }
  }

  static func user() -> RouteBuilderOf<RootNavigator> {
    let matchPath = RouteLink.Home.Path.user.rawValue
    return .init(matchPath: matchPath) { navigator, _, _ in
      DebugWrappingController(matchPath: matchPath) {
        UserPage(
          store: .init(
            initialState: UserReducer.State(),
            reducer: {
              UserReducer(sideEffect: .init(
                navigator: navigator))
            }))
      }
    }
  }

  static func userDetail() -> RouteBuilderOf<RootNavigator> {
    let matchPath = RouteLink.Home.Path.userDetail.rawValue
    return .init(matchPath: matchPath) { navigator, _, _ in
      DebugWrappingController(matchPath: matchPath) {
        UserDetailPage(
          store: .init(
            initialState: UserDetailReducer.State(),
            reducer: {
              UserDetailReducer(sideEffect: .init(
                navigator: navigator))
            }))
      }
    }
  }
}
