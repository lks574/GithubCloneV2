import Architecture
import ComposableArchitecture
import DesignSystem
import Domain
import SwiftUI
import LinkNavigator

// MARK: - UserDetailPage

@ViewAction(for: UserDetailReducer.self)
struct UserDetailPage {
  @Bindable var store: StoreOf<UserDetailReducer>
}

// MARK: View

extension UserDetailPage: View {
  var body: some View {
    VStack(spacing: .zero) {
      Text("UserDetailPage")
      Text(store.userResponse?.company ?? "")
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      send(.onLoad)
    }
    .onDisappear {
      send(.teardown)
    }
  }
}

#Preview {
  NavigationStack {
    UserDetailPage(
      store: .init(
        initialState: UserDetailReducer.State(),
        reducer: {
          UserDetailReducer(
            sideEffect: .init(
              navigator: TabLinkNavigatorMock()))
        }))
  }
}
