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
    var itemList: [GithubEntity.Search.User.Item] = []
    var query = ""
  }

  public enum Action: ViewAction, Sendable{
    case view(View)
    case searchUser(String)
    case fetchSearchUser(Result<GithubEntity.Search.User.Response, Error>)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onTabNext
    }
  }

  public enum EventID: Hashable {
    case throttle
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { state, action in
      switch action {
      case .view(.binding(\.query)):
        print("aaa state.query", state.query)
        guard !state.query.isEmpty else { return .none }
        state.itemList = []
        return .run { [query = state.query] in
          await $0(.searchUser(query))
        }
        .throttle(
          id: EventID.throttle,
          for: 1.5,
          scheduler: DispatchQueue.main,
          latest: true)
      case .view(.binding):
        return .none

      case .view(.onTabNext):
        return .none

      case .searchUser(let keyword):
        print("aaa", keyword)
        return sideEffect.searchUser(.init(query: keyword, page: .zero))

      case .fetchSearchUser(let res):
        switch res {
        case .success(let user):
          state.itemList = user.itemList
          return .none
        case .failure(let error):
          print("aaaa", error)
          return .none
        }

      }
    }
  }
}
