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
    return .init(matchPath: matchPath) { navigator, items, _ in
      guard let query: RouteLink.Home.QueryItem.Username = items.decoded() else { return .none }
      return DebugWrappingController(matchPath: matchPath) {
        UserDetailPage(
          store: .init(
            initialState: UserDetailReducer.State(username: query.username),
            reducer: {
              UserDetailReducer(sideEffect: .init(
                navigator: navigator))
            }))
      }
    }
  }

  static func repos() -> RouteBuilderOf<RootNavigator> {
    let matchPath = RouteLink.Home.Path.repos.rawValue
    return .init(matchPath: matchPath) { navigator, items, _ in
      guard let query: RouteLink.Home.QueryItem.Username = items.decoded() else { return .none }
      return DebugWrappingController(matchPath: matchPath) {
        ReposPage(
          store: .init(
            initialState: ReposReducer.State(username: query.username),
            reducer: {
              ReposReducer(sideEffect: .init(
                navigator: navigator))
            }))
      }
    }
  }
}
