import ProjectDescription

extension Settings {
  public static var defaultConfig: (Bool) -> Settings {
    { _ in
      .settings(
        base: [
          "CODE_SIGN_IDENTITY": "iPhone Developer",
          "CODE_SIGN_STYLE": "Automatic",
        ],
        configurations: [],
        defaultSettings: .recommended(excluding: .init()))
    }
  }
}

extension DeploymentTargets {
  public static var `default`: Self {
    .iOS("17.0")
  }
}

extension InfoPlist {
  public static var defaultInfoPlist: Self {
    .extendingDefault(with: [
      "UILaunchScreen": .dictionary([:]),
    ])
  }
}
