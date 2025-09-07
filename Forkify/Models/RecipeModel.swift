/// RecipeModel which matches the Food2Fork API response
import Foundation

struct RecipeModel: Identifiable, Decodable {
    let id: String
    let title: String
    let publisher: String
    let image_url: String
    let rating: String
    let source_url: String
}
