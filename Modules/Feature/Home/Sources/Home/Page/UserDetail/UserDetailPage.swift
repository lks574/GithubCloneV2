import Architecture
import ComposableArchitecture
import DesignSystem
import Domain
import SwiftUI

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
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .onDisappear {
      send(.teardown)
    }
  }
}
