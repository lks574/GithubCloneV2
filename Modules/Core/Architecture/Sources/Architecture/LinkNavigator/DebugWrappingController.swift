import Foundation
import LinkNavigator
import SwiftUI
import UIKit

public final class DebugWrappingController<Content: View>: UIHostingController<Content>, MatchPathUsable {

  public init(
    matchPath: String,
    eventSubscriber: LinkNavigatorItemSubscriberProtocol? = .none,
    @ViewBuilder content: () -> Content)
  {
    self.matchPath = matchPath
    self.eventSubscriber = eventSubscriber
    super.init(rootView: content())
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    Logger.trace("✂️ \(matchPath) deinit...")
  }


  public let matchPath: String
  public let eventSubscriber: LinkNavigatorItemSubscriberProtocol?

  public override func viewDidLoad() {
    super.viewDidLoad()
    Logger.trace("🚗 \(matchPath)")
  }
}
