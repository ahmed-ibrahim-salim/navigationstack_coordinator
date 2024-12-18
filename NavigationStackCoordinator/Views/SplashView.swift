import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if isActive {
            if hasSeenOnboarding {
                TapsView()
            } else {
                OnboardingView()
            }
        } else {
            Text("Naqla")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}
