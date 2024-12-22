import SkeletonUI
import SwiftUI

// #Preview {
//    let viewModel = HomeViewModel()
//    let view = HomeView(viewModel: viewModel)
//    return view
// }

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
        
    var body: some View {
        ScrollView {
            HomeHeader(name: "Monhamed Ahmed", image: "person.circle")
                
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 12) {
                        H9Label(text: "Order locations")
                        
                        if viewModel.createOrderModel.locationPoints.count > 0 {
                            PickedLocationsView(locationPoints: $viewModel.createOrderModel.locationPoints, onTap: { print("open choose location tapped")
                            })
                        } else {
                            PrimarySearchBar()
                                .onTapGesture {
                                    print("Search bar tapped")
                                }
                        }
                    }
                    .padding(.horizontal, 24)

                    VStack(alignment: .leading, spacing: 16) {
                        // Pickup time section
                        PickTimeSection { dateTime in
                            viewModel.createOrderModel.deliveryDateTime = dateTime
                            print("dateTime: \(viewModel.createOrderModel.deliveryDateTime.dateTime)")
                        } openDateTimeSheet: {
                            viewModel.showSelectPickUpTimeSheet.toggle()
                        }
                        
                        // Commodity type section
                        ComodityTypeSection { commodity in
                            viewModel.createOrderModel.commodity = commodity
                            print("commodity: \(viewModel.createOrderModel.commodity.name)")
                        }
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
            .sheet(isPresented: $viewModel.showSelectPickUpTimeSheet) {
                SelectPickUpTime()
            }
        }
    }
}
    
