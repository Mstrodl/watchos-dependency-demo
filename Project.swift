import ProjectDescription

let settings =  Settings.settings(configurations: [
    .debug(name: .debug),
    .release(name: .release)
], defaultSettings: .essential)

let iosSettings: SettingsDictionary = [
    "OTHER_LDFLAGS": "-ObjC -lc++",
]

let appTarget = Target(
    name: "watchosdepdemo",
    platform: .iOS,
    product: .app,
    bundleId: "com.bryx.watchosdepdemo",
    sources: ["Targets/WatchosDependencyDemo/Sources/**"],
    resources: ["Targets/WatchosDependencyDemo/Resources/**"],
    dependencies: [
        .external(name: "ExternalDep"),
        // You can comment this out to see it compiles for ios fine!
        TargetDependency.target(name: "watchosapp")
    ],
    settings: settings
)

let watchApp = Target(name: "watchosapp",
     platform: .watchOS,
     product: .app,
     bundleId: "com.bryx.watchosdepdemo.watch",
     infoPlist: .extendingDefault(with: [
         "WKCompanionAppBundleIdentifier": "com.bryx.watchosdepdemo",
         "WKApplication": true,
     ]),
     sources: ["Targets/WatchosDependencyDemo/Sources/**"],
     resources: ["Targets/WatchosDependencyDemo/Resources/**"],
     dependencies: [
         .external(name: "ExternalDep"),
     ],
     settings: settings
)

let project = Project(
    name: "watchosdepdemo",
    organizationName: "Bryx Inc.",
    settings: settings,
    targets: [appTarget, watchApp]
)
