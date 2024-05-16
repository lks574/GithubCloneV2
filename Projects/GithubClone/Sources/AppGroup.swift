import Architecture
import Home
import Foundation
import LinkNavigator

struct AppGroup<RootNavigator: RootNavigatorType> {

  var release: [RouteBuilderOf<RootNavigator>] {
    HomeGroup.release
  }
}
