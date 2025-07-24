import Foundation

// Reminder ObservableObject class conforms to the ObservableObject protocol
// Which means it can be observed by SwiftUI views
class HomeViewModel: ObservableObject {
    
    /// The searchText variable is what the user enters in the search textfield on the HomeView
    @Published var searchText: String = ""
    @Published var errorMessage: String = ""
    
    /// Variable to determine whether or not we are showing the RecipeResultsView
    @Published var isPresentingRecipeResults: Bool = false
    
    
    func searchRecipeText(){
        // If searchText is valid, we want to bring the user to the next view
        // If searchText is not valid, we want to display an error "Please enter in a valid food name"
        // REMINDER: guards check for failures and exits early if the condition is false
        // If validateSearchText returns true proceed, otherwise exit
        guard validateSearchText() else{
            return
           
        }
            
        }
        
        /// validateSearchText is a function where we check if searchText after removing the whitespace is empty
        func validateSearchText() -> Bool {
            // guard will return true if there is text in the textfield
            // if it's empty we return false
            // if it's not empty we return true
            guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else{
                errorMessage = "Please Enter a Valid Food Name"
                isPresentingRecipeResults = false
                return false
        }
            isPresentingRecipeResults = true
            return true
        
    }
    
    
}
