import SwiftUI

struct HomeView: View {
    @StateObject var coordinator = HomeCoordinator<HomeCoordinatorRoute>()

    var body: some View {
        /// ⚠️ A Router view could be used to wrap NavigationStack
        /// We kept it here to demonstrate the issue
        NavigationStack(path: $coordinator.paths) {
            ZStack {
                VStack {
                    Text("This is the first view 1️⃣!")
                    Button("Go to SecondView") {
                        coordinator.push(.secondView(param: "Some param"))
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.pink)
            .navigationDestination(for: HomeCoordinatorRoute.self) { $0.destinationView }
        }.environmentObject(coordinator)
    }
}

struct SecondView: View {
    @EnvironmentObject var coordinator: HomeCoordinator<HomeCoordinatorRoute>

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

struct ThirdView: View {
    @EnvironmentObject var coordinator: HomeCoordinator<HomeCoordinatorRoute>

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
