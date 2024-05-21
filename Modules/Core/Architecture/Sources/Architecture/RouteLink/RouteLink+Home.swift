import Foundation

extension RouteLink {
  public enum Home { }
}

extension RouteLink.Home {
  public enum Path: String, Equatable {
    case logMonitor
    case user
    case userDetail
  }
}
