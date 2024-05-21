import Pulse
import PulseLogHandler

private let logging = PersistentLogHandler(label: "com.sro.github-clone", store: .shared)

// MARK: - Logger

public struct Logger: Equatable {

  public static func debug(_ message: String) {
    logging.log(
      level: .debug,
      message: .init(stringLiteral: ""),
      metadata: .none,
      file: "",
      function: "",
      line: .zero)
  }

  public static func trace(_ message: String) {
    logging.log(
      level: .trace,
      message: .init(stringLiteral: message),
      metadata: .none,
      file: "",
      function: "",
      line: .zero)
  }

  public static func error(_ message: String) {
    logging.log(
      level: .error,
      message: .init(stringLiteral: message),
      metadata: .none,
      file: "",
      function: "",
      line: .zero)
  }
}
