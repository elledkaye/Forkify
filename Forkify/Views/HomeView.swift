
import SwiftUI

/// Welcome screen with a search bar, and display lists
struct HomeView: View {
    
    
    @StateObject var viewModel = HomeViewModel()
    
    /// @State variable to track what the user enters in
    @State private var searchText: String = ""
    
    
    var body: some View {
        VStack(spacing: 16){
            Text("Welcome To Forkify")
                .font(.largeTitle.bold())
            Text("Find recipes for anything in your fridge!")
                .font(.subheadline)
                .padding(.horizontal)
            
            // We bind the searchText variable
            TextField("Search for a recipe", text: $searchText )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Search"){
                // When the user clicks the search button, we will
                // Call a function to validate if the input if valid (no special characters or just space)
                // Navigate to a "Recipe list view"
                // If there are no results we will display "No Results Found"
                
            }
        } // End of VStack
        
    }
} // End of struct

#Preview {
    HomeView()
}
