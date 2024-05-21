import Architecture
import ComposableArchitecture
import DesignSystem
import SwiftUI
import Domain

@ViewAction(for: UserReducer.self)
struct UserPage {
  @Bindable var store: StoreOf<UserReducer>
}

extension UserPage: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack(alignment: .leading, spacing: .zero) {
        ForEach(store.itemList, id: \.id) {
          userItemComponent(user: $0)
        }
      }
    }
    .navigationTitle("유저 찾기")
    .scrollDismissesKeyboard(.immediately)
    .searchable(text: $store.query, placement: .automatic, prompt: "검색")
    .onDisappear {
      send(.teardown)
    }
  }
}

extension UserPage {

  @ViewBuilder
  private func userItemComponent(user: GithubEntity.Search.User.Item) -> some View {
    HStack(spacing: 8) {
      AsyncImage(url: URL(string: user.avatarUrl)) { phase in
        phase.image?.resizable()
      }
      .frame(width: 50, height: 50)

      Text(user.loginName)
        .font(.system(size: 14, weight: .regular))
        .foregroundStyle(.black)
    }
    .padding(8)
    .frame(maxWidth: .infinity, alignment: .leading)
    .contentShape(Rectangle())
    .onTapGesture {
      send(.onTapUser)
    }
  }
}


