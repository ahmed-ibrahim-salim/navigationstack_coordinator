import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.pink)
            
            Text("Welcome to Naqla")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    hasSeenOnboarding = true
                }
            }) {
                Text("Get Started")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 50)
        }
    }
}
