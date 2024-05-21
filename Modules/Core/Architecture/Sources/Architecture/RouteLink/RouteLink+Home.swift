import Foundation

// MARK: - RouteLink.Home

extension RouteLink {
  public enum Home { }
}

// MARK: - RouteLink.Home.Path

extension RouteLink.Home {
  public enum Path: String, Equatable {
    case logMonitor
    case user
    case userDetail
  }
}
