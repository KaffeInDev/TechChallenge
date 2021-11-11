//
//  VirnectTechChallengeApp.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/08.
//

import SwiftUI
import CoreModular

@main
struct VirnectTechChallengeApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
    // MARK: - application initialize
    init() {
        RemoteDefault.policy =  RemotePolicy(host: Constants.host)
    }
}
