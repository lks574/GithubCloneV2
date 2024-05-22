import Foundation

// MARK: - RouteLink.Home

extension RouteLink {
  public enum Home { }
}

// MARK: - RouteLink.Home.Path

extension RouteLink.Home {
  public enum QueryItem {}
  public enum Path: String, Equatable {
    case logMonitor
    case user
    case userDetail
    case repos
  }
}

extension RouteLink.Home.QueryItem {
  public struct Username: Equatable, Codable {
    public let username: String

    public init(username: String) {
      self.username = username
    }
  }
}
