import Architecture
import ComposableArchitecture
import DesignSystem
import SwiftUI
import Domain

@ViewAction(for: UserDetailReducer.self)
struct UserDetailPage {
  @Bindable var store: StoreOf<UserDetailReducer>
}

extension UserDetailPage: View {
  var body: some View {
    VStack(spacing: .zero) {
      Text("UserDetailPage")
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .onDisappear {
      send(.teardown)
    }
  }
}
