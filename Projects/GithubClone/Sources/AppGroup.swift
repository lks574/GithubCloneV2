import Architecture
import Foundation
import Home
import LinkNavigator

struct AppGroup<RootNavigator: RootNavigatorType> {

  var release: [RouteBuilderOf<RootNavigator>] {
    HomeGroup.release
  }
}
