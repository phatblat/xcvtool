//
//  main.swift
//  xcvtool
//
//  Created by Ben Chatelain on 3/22/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//

import XcodeProj
import PathKit
import Foundation

guard CommandLine.arguments.count == 2 else {
    let commandName = Path(CommandLine.arguments[0]).lastComponent
    fputs("usage: \(commandName) <project> <new-version>\n", stderr)
    exit(1)
}

let projectPath = Path(CommandLine.arguments[1])
print(projectPath)

let newVersion = 2 //CommandLine.arguments[2]
let xcodeproj = try XcodeProj(path: projectPath)
let key = "CURRENT_PROJECT_VERSION"

guard let rootObject = xcodeproj.pbxproj.rootObject else { fatalError("No rootObject") }

let buildConfigs = rootObject.buildConfigurationList.buildConfigurations

print("build configurations: \(buildConfigs.count)")

for conf in buildConfigs {
    print("build config \(conf.name)")
//    if conf.buildSettings[key] != nil {
        let version = conf.buildSettings[key]
//        print(version!)
        conf.buildSettings[key] = newVersion
//    }
}

try xcodeproj.write(path: projectPath)
