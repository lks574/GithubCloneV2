import Architecture
import ComposableArchitecture
import Domain
import Foundation

@Reducer
struct UserDetailReducer {

  // MARK: Lifecycle

  init(
    pageID: String = UUID().uuidString,
    sideEffect: UserDetailEffect)
  {
    self.pageID = pageID
    self.sideEffect = sideEffect
  }

  // MARK: Public

  public enum Action: ViewAction, Sendable {
    case view(View)
    case fetchUser(Result<GithubEntity.Users.User.Response, Error>)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case teardown
      case onTapBack
      case onLoad
      case onTapURL(String)
    }
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none

      case .view(.teardown):
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })

      case .view(.onTapBack):
        return .none

      case .view(.onLoad):
        return sideEffect
          .user(.init(username: state.username))
          .cancellable(pageID: pageID, id: CancelID.requestUser, cancelInFlight: true)

      case .view(.onTapURL(let url)):
        sideEffect.routeToURL(url)
        return .none

      case .fetchUser(let res):
        switch res {
        case .success(let user):
          state.userResponse = user
          return .none

        case .failure(let error):
          print("aaaa", error)
          return .none
        }
      }
    }
  }

  // MARK: Internal

  @ObservableState
  struct State: Equatable {
    let username: String
    var userResponse: GithubEntity.Users.User.Response?
  }

  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestUser
  }

  // MARK: Private

  private let pageID: String
  private let sideEffect: UserDetailEffect

}
