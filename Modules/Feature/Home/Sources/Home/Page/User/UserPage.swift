import Architecture
import ComposableArchitecture
import DesignSystem
import SwiftUI

@ViewAction(for: UserReducer.self)
struct UserPage {
  @Bindable var store: StoreOf<UserReducer>
}

extension UserPage: View {
  var body: some View {
    VStack(spacing: .zero) {
      Text("UserPage")
        .foregroundStyle(Color.blue)
    }
  }
}
