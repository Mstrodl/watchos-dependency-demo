//
//  Dependencies.swift
//  Bryx 913Manifests
//
//  Created by Lonnie Gerol on 7/7/22.
//

import ProjectDescription

let dependencies_common = Dependencies(
    swiftPackageManager: .init([
        .local(path: "./ExternalDep"),
    ],
    targetSettings: [
        "CrashReporter": [
            "ALWAYS_SEARCH_USER_PATHS": "NO",
            "USE_HEADERMAP": "YES",
        ]
    ]),
    platforms: [.iOS, .watchOS]
)
