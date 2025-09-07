import SwiftUI

struct Recipe: Identifiable {
    let id: UUID = UUID()
    let imageName: String // For demo, use asset name or system image
    let title: String
    let subtitle: String
}

struct RecipeResultsView: View {
    // We expect a string called "searchText"
    // We pass the searchText string that is in HomeViewModel into the RecipeResultsView
    // When we open this screen we should see a list of items that match
    var searchText: String
    // Demo data
    let recipes: [Recipe] = [
        Recipe(imageName: "photo", title: "Pasta Carbonara", subtitle: "Classic Italian pasta"),
        Recipe(imageName: "photo", title: "Chicken Alfredo", subtitle: "Creamy chicken pasta"),
        Recipe(imageName: "photo", title: "Vegetable Stir Fry", subtitle: "Healthy and quick")
    ]
    var body: some View {
        List(filteredRecipes) { recipe in
            HStack {
                Image(systemName: recipe.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.headline)
                    Text(recipe.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("Results for \(searchText)")
    }
    // Filter recipes by searchText
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty { return recipes }
        return recipes.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    RecipeResultsView(searchText: "Pasta")
}
