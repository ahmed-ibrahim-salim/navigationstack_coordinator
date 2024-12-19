import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("This is the first view 1️⃣!")
                    .customFont(size: 20, weight: .semibold)

                Text(L10n.hello)
                    .customFont(size: 20, weight: .semibold)
                Text(L10n.lookingGood)
                    .customFont(size: 20, weight: .semibold)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
