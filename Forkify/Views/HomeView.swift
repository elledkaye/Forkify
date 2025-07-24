
import SwiftUI

/// Welcome screen with a search bar, and display lists
struct HomeView: View {
    
    /// Initializes and owns an instance of HomeViewModel using @StateObject,
    /// so that the view can observe and react to its published changes.
    @StateObject var viewModel = HomeViewModel()
    
    /// @State variable to track what the user enters in
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                Text("Welcome To Forkify")
                    .font(.largeTitle.bold())
                Text("Find recipes for anything in your fridge!")
                    .font(.subheadline)
                    .padding(.horizontal)
                
                // We bind the searchText variable
                TextField("Search for a recipe", text: $viewModel.searchText )
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                /// if viewModel.errorMessage is not empty display the error message, and if it is empty don't display the error message
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                
                Button("Search"){
                    // When the user clicks the search button, we will
                    // Call a function to validate if the input if valid (no special characters or just space)
                    // Navigate to a "Recipe list view"
                    /// Call the searchRecipeText function that is inside the HomeViewModel
                    viewModel.searchRecipeText()
                }
                NavigationLink(
                    destination: RecipeResultsView(searchText: viewModel.searchText),
                    isActive: $viewModel.isPresentingRecipeResults
                    
                ){
                    EmptyView()
                }
                
            } // End of VStack
        } // End of NavigationStack
    }
} // End of struct

#Preview {
    HomeView()
}
