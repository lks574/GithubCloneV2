import Architecture
import ComposableArchitecture
import Foundation
import Domain

@Reducer
struct UserReducer {

  private let pageID: String
  private let sideEffect: UserEffect

  init(
    pageID: String = UUID().uuidString,
    sideEffect: UserEffect)
  {
    self.pageID = pageID
    self.sideEffect = sideEffect
  }

  @ObservableState
  struct State: Equatable {

  }

  public enum Action: ViewAction, Sendable{
    case view(View)

    case fetchSearchUser(Result<GithubEntity.Search.User.Response, Error>)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onTabNext
      case onTabSearchUser(String)
    }
  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none

      case .view(.onTabNext):
        return .none

      case .view(.onTabSearchUser(let keyword)):
        return sideEffect.searchUser(.init(query: keyword, page: .zero))

      case .fetchSearchUser:
        return .none
      }
    }
  }
}
