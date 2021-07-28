

import Foundation

class CatalogueViewModel {
    
    var network = Network()
    var results: Store!
    
    func fetch() {
        DispatchQueue.main.async {
            self.network.request { (result) in
                switch result {
                case.success(let results):
                    self.results = results
                    print(results)
                case .failure(let error):
                    break
                }
            }
        }
    }
    
//    init(network: Network, results: Store) {
//        self.network = network
//        self.results = results
//    }
}
