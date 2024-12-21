import SkeletonUI
import SwiftUI

#Preview {
    let viewModel = HomeViewModel()
    let view = HomeView(viewModel: viewModel)
    return view
}

struct CreateOrderModel {
    let locationPoints: [LocationPointDTO]
    let deliveryDateTime: DateTimeDTO
    let commodity: CommodityDTO
    let truckType: TruckTypeDTO
    let serviceOptions: [ServiceOptionDTO]?
    let note: String?
    let pictures: [String]?

    func makeParams() -> [String: Any] {
        var params: [String: Any] = [
            "locationPoints": locationPoints.map { $0.makeParams() },
            "deliveryDateTime": deliveryDateTime.makeParams(),
            "commodity": commodity.makeParams(),
            "truckType": truckType.makeParams()
        ]

        if let serviceOptions = serviceOptions {
            params["serviceOptions"] = serviceOptions.map { $0.makeParams() }
        }

        if let note = note {
            params["note"] = note
        }

        if let pictures = pictures {
            params["pictures"] = pictures
        }

        return params
    }
}

class HomeViewModel: ObservableObject {
    @Published var createOrderModel: CreateOrderModel?
}

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView {
            HomeHeader(name: "Monhamed Ahmed", image: "person.circle")
                .padding()
                .padding(.bottom, 100)
                .background(
                    Image(.imgHomeHeaderBackground)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.4)
                )

            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    // Search bar
                    PrimarySearchBar()
                        .onTapGesture {
                            print("Search bar tapped")
                        }
                        .padding(.horizontal, 24)

                    VStack(alignment: .leading, spacing: 16) {
                        // Pickup time section
                        PickTimeSection()

                        // Commodity type section
                        ComodityTypeSection()
                    }
                    .padding(.leading, 24)

                    VStack(alignment: .leading, spacing: 20) {
                        // Truck type section
                        TruckTypeSection()

                        // Create order button
                        PrimaryButton(title: "Create your order") {
                            // Action
                            print("Create order tapped")
                        }
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color(.grayF9FAFB))
                        .shadow(color: Color(.grayA1A1A125), radius: 8, x: 0, y: 2)
                )
            }
            .offset(y: -80)
            .background(.white)
        }
    }
}
