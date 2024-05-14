//
//  ContentView.swift
//  NavigationStackCoordinator
//
//  Created by Saad El Oulladi on 17/04/2023.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var coordinator: Coordinator<Route>
    
    var body: some View {
        VStack {
            Text("This is the third View 3️⃣!")
            Button("Back") {
                coordinator.pop()
            }
            Button("Back to root") {
                coordinator.popToRoot()
            }
        }
        .padding()
    }
}

struct SecondView: View {
    
    @EnvironmentObject var coordinator: Coordinator<Route>
    
    var body: some View {
        VStack {
            Text("This is the second 2️⃣!")
            Button("Go to third view") {
                coordinator.push(.thirdView)
            }
            Button("Back") {
                coordinator.pop()
            }
        }
        .padding()
    }
}

struct ContentView: View {
    
    @StateObject var coordinator = Coordinator<Route>()
    
    var body: some View {
        /// ⚠️ A Router view could be used to wrap NavigationStack
        /// We kept it here to demonstrate the issue
        NavigationStack(path: $coordinator.paths) {
            VStack {
                Text("This is the first view 1️⃣!")
                Button("Go to SecondView") {
                    coordinator.push(.secondView(param: "Some param"))
                }
            }
            .padding()
            .navigationDestination(for: Route.self) { $0.destinationView }
        }.environmentObject(coordinator)
    }
}
