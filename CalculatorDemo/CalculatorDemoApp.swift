//
//  CalculatorDemoApp.swift
//  CalculatorDemo
//
//  Created by Sujit Baruwal on 8/15/22.
//

import SwiftUI

@main
struct CalculatorDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ContentView.ViewModel())
        }
    }
}
