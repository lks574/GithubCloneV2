import Architecture
import LinkNavigator

extension HomeGroup {
  static func user() -> RouteBuilderOf<RootNavigator> {
    let matchPath = RouteLink.Home.Path.user.rawValue
    return .init(matchPath: matchPath) { navigator, _, _ in
      DebugWrappingController(matchPath: matchPath) {
        UserPage(store: .init(
          initialState: UserReducer.State(), 
          reducer: {
            UserReducer(sideEffect: .init(
              navigator: navigator))
          })
        )
      }
    }
  }
}
