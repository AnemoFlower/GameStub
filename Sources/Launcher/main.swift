//
//  main.swift
//  GameStub
//
//  Created by AnemoFlower on 2026/3/6.
//

import Foundation
import AppKit

let arguments: [String] = ProcessInfo.processInfo.arguments

var appBundleURL: URL = .init(fileURLWithPath: arguments[0])
guard FileManager.default.fileExists(atPath: appBundleURL.path) else {
    print("[GameStub Launcher] Error: The executable file '\(arguments[0])' not exists")
    exit(EXIT_FAILURE)
}
while true {
    if appBundleURL.pathComponents.count <= 1 {
        print("[GameStub Launcher] Error: App bundle not found")
        exit(EXIT_FAILURE)
    }
    appBundleURL = appBundleURL.deletingLastPathComponent()
    if appBundleURL.pathExtension == "app" {
        break
    }
}

let configuration: NSWorkspace.OpenConfiguration = .init()
configuration.createsNewApplicationInstance = true
configuration.activates = false
configuration.arguments = Array(arguments.dropFirst())

NSWorkspace.shared.open(appBundleURL, configuration: configuration) { application, error in
    if let error {
        print("[GameStub Launcher] Error: Application launch failed: \n\(error)")
        exit(EXIT_FAILURE)
    }
    if let application {
        let pid: Int32 = application.processIdentifier
        print("[GameStub Launcher] Application launch successed, PID: \(pid)")
    }
}
dispatchMain()
