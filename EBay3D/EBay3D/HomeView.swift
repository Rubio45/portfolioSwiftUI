
import SwiftUI
import RealityKit
import RealityKitContent

struct HomeView: View {
    var body: some View {
        VStack {
            NavigationSplitView {
                ExploreProductView()
            } detail: {
                Text("Seleccione una categoría")
                    .font(.system(.title, design: .rounded))
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    HomeView()
}

struct ExploreProductView: View {
    var body: some View {
        ScrollView {
            NavigationStack {
                ForEach(categories) { category in
                    NavigationLink(destination: ProductListView(category: category)) {
                        HStack(spacing: 10) {
                            Image(systemName: category.image)
                                .foregroundStyle(.white)
                            Text(category.name)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemBackground).opacity(0.4))
                        .cornerRadius(20)
                    }
                }
                .padding()
                .navigationTitle("Categories")
            }
        }
    }
}

