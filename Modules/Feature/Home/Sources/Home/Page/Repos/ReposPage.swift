import Architecture
import ComposableArchitecture
import DesignSystem
import Domain
import LinkNavigator
import SwiftUI

// MARK: - ReposPage

@ViewAction(for: ReposReducer.self)
struct ReposPage {
  @Bindable var store: StoreOf<ReposReducer>
}

// MARK: View

extension ReposPage: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack(alignment: .leading, spacing: .zero) {
        ForEach(store.itemList, id: \.id) {
          repoView(repo: $0)
            .overlay(alignment: .bottom) {
              Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            }
        }
      }
    }
    .onAppear {
      send(.onLoad)
    }
    .onAppear {
      send(.teardown)
    }
  }
}

extension ReposPage {

  @ViewBuilder
  private func repoView(repo: GithubEntity.Users.Repos.Response) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("name: \(repo.name)")
        .font(.system(size: 14, weight: .regular))
        .foregroundStyle(.black)
      Text("fullName: \(repo.fullName)")
        .font(.system(size: 14, weight: .regular))
        .foregroundStyle(.black)

      if let description = repo.description {
        Text("description : \(description)")
          .font(.system(size: 14, weight: .regular))
          .foregroundStyle(.black)
      }
    }
    .padding(8)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  NavigationStack {
    ReposPage(
      store: .init(
        initialState: ReposReducer.State(username: "lks574"),
        reducer: {
          ReposReducer(
            sideEffect: .init(
              navigator: TabLinkNavigatorMock()))
        }))
  }
}
