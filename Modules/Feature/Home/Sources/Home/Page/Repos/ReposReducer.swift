import Architecture
import ComposableArchitecture
import Domain
import Foundation

@Reducer
struct ReposReducer {

  // MARK: Lifecycle

  init(
    pageID: String = UUID().uuidString,
    sideEffect: ReposEffect)
  {
    self.pageID = pageID
    self.sideEffect = sideEffect
  }

  // MARK: Public

  public enum Action: ViewAction, Sendable {
    case view(View)
    case fetchRepos(Result<[GithubEntity.Users.Repos.Response], Error>)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case teardown
      case onTapBack
      case onLoad
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
        sideEffect.routeToBack()
        return .none

      case .view(.onLoad):
        return sideEffect
          .repos(.init(username: state.username))
          .cancellable(pageID: pageID, id: CancelID.requestRepos, cancelInFlight: true)

      case .fetchRepos(let res):
        switch res {
        case .success(let repos):
          state.itemList = repos
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
    var itemList: [GithubEntity.Users.Repos.Response] = []
  }

  enum EventID: Hashable {
    case throttle
  }

  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestRepos
  }

  // MARK: Private

  private let pageID: String
  private let sideEffect: ReposEffect

}
