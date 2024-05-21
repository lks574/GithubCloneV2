import Architecture
import LinkNavigator
import SwiftUI

// MARK: - AppMain

struct AppMain {
  let viewModel: AppViewModel
}

// MARK: View

extension AppMain: View {
  var body: some View {
    TabLinkNavigationView(
      linkNavigator: viewModel.linkNavigator,
      isHiddenDefaultTabbar: false,
      tabItemList: [
        .init(
          tag: .zero,
          tabItem: .init(
            title: "User",
            image: .init(systemName: "person.3.fill"),
            tag: .zero),
          linkItem: .init(path: RouteLink.Home.Path.user.rawValue),
          prefersLargeTitles: true),
      ])
      .ignoresSafeArea()
      .onShake {
        viewModel.linkNavigator.tabRootPartialNavigators.first?.sheet(
          linkItem: .init(path: RouteLink.Home.Path.logMonitor.rawValue),
          isAnimated: true)
      }
  }
}
