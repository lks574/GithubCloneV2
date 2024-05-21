import Architecture
import ComposableArchitecture
import Foundation
import Domain

@Reducer
struct UserDetailReducer {
  private let pageID: String
  private let sideEffect: UserDetailEffect

  init(
    pageID: String = UUID().uuidString,
    sideEffect: UserDetailEffect)
  {
    self.pageID = pageID
    self.sideEffect = sideEffect
  }

  @ObservableState
  struct State: Equatable {

  }

  public enum Action: ViewAction, Sendable {
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case teardown
      case onTapBack
    }
  }

  enum CancelID: Equatable, CaseIterable {
    case teardown
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none

      case .view(.teardown):
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) }
        )

      case .view(.onTapBack):
        return .none
        
      }
    }
  }
}
