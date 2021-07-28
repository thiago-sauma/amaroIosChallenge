
import Foundation

struct Store: Decodable {
        var products: [StoreItem]
    }
    
struct StoreItem: Decodable {
        var name: String
        var actual_price: String
    }

