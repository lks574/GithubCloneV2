import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.preview(
  projectName: "UISample",
  packages: [
    .local(path: .relativeToRoot("Modules/Core/DesignSystem")),
    .local(path: .relativeToRoot("Modules/Core/Functor")),
    .local(path: .relativeToRoot("Modules/Feature/CommonUI")),
  ],
  dependencies: [
    .package(
      product: "CommonUI",
      type: .runtime,
      condition: .none),
  ])
