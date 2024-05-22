import Architecture
import LinkNavigator

public struct HomeGroup<RootNavigator: RootNavigatorType> {
  public static var release: [RouteBuilderOf<RootNavigator>] {
    [
      logMonitor(),
      user(),
      userDetail(),
      repos(),
    ]
  }
}
