import Architecture
import ComposableArchitecture
import DesignSystem
import Domain
import LinkNavigator
import SwiftUI

// MARK: - UserDetailPage

@ViewAction(for: UserDetailReducer.self)
struct UserDetailPage {
  @Bindable var store: StoreOf<UserDetailReducer>
}

// MARK: View

extension UserDetailPage {

  @ViewBuilder
  private func userInfoView(user: GithubEntity.Users.User.Response) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 8) {
        AsyncImage(url: URL(string: user.avatarURL)) { phase in
          phase.image?.resizable()
        }
        .frame(width: 50, height: 50)

        VStack(alignment: .leading, spacing: 4) {
          Text(user.login)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(.black)
          Text(user.name ?? "")
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.black)
        }
      }

      HStack(spacing: 8) {
        Image(systemName: "building")
        Text(user.company ?? "")
          .font(.system(size: 14, weight: .regular))
          .foregroundStyle(.black)
      }
      HStack(spacing: 8) {
        Image(systemName: "person")
        Text("\(user.followers) 팔로워")
          .font(.system(size: 14, weight: .regular))
          .foregroundStyle(.black)
        Text("\(user.following) 팔로잉")
          .font(.system(size: 14, weight: .regular))
          .foregroundStyle(.black)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  @ViewBuilder
  private func menuView(user: GithubEntity.Users.User.Response) -> some View {
    VStack(alignment: .leading, spacing: .zero) {
      Button(action: { send(.onTapRepos) }) {
        HStack(spacing: 8) {
          Image(systemName: "text.book.closed")
            .foregroundStyle(Color.black)
          Text("리포지토리")
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.black)
          Spacer()
          Text("\(user.publicRepos)")
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(Color.black)
          Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 5, height: 10)
            .foregroundStyle(Color.black)
        }
        .padding(8)
      }

      Rectangle()
        .fill(Color.gray)
        .frame(height: 0.5)
        .frame(maxWidth: .infinity)
        .padding(.leading, 30)

      Button(action: { send(.onTapURL(user.htmlURL)) }) {
        HStack(spacing: 8) {
          Image(systemName: "globe")
            .foregroundStyle(Color.black)
          Text("URL")
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.black)
          Spacer()
          Text(user.htmlURL)
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(Color.black)
          Image(systemName: "chevron.right")
            .resizable()
            .frame(width: 5, height: 10)
            .foregroundStyle(Color.black)
        }
        .padding(8)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.white)
    .withShadow()
  }
}

// MARK: View

extension UserDetailPage: View {
  var body: some View {
    VStack(spacing: 24) {
      if let user = store.userResponse {
        userInfoView(user: user)
        menuView(user: user)
      }
      Spacer()
    }

    .padding(16)
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
        initialState: UserDetailReducer.State(username: "lks574"),
        reducer: {
          UserDetailReducer(
            sideEffect: .init(
              navigator: TabLinkNavigatorMock()))
        }))
  }
}
