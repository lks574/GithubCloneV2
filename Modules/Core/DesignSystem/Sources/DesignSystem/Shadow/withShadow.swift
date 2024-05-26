import Foundation
import SwiftUI

// MARK: - WithShadow

public struct WithShadow: ViewModifier {

  public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
    self.color = color
    self.radius = radius
    self.x = x
    self.y = y
  }

  let color: Color
  let radius: CGFloat
  let x: CGFloat
  let y: CGFloat

  public func body(content: Content) -> some View {
    content
      .clipped()
      .shadow(color: color, radius: radius, x: x, y: y)
      .zIndex(1000)
  }
}

extension View {
  public func withShadow(
    condition: Bool = true,
    color: Color = .black.opacity(0.08),
    radius: CGFloat = 1,
    x: CGFloat = 0,
    y: CGFloat = 1)
    -> some View
  {
    modifier(WithShadow(color: condition ? color : .clear, radius: radius, x: x, y: y))
  }
}
