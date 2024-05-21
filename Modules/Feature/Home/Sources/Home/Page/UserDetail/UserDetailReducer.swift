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

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case teardown
      case onTapBack
    }
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { _, action in
      switch action {
      case .view(.binding):
        return .none

      case .view(.teardown):
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })

      case .view(.onTapBack):
        return .none
      }
    }
  }

  // MARK: Internal

  @ObservableState
  struct State: Equatable { }

  enum CancelID: Equatable, CaseIterable {
    case teardown
  }

  // MARK: Private

  private let pageID: String
  private let sideEffect: UserDetailEffect

}
