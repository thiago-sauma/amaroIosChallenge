
import UIKit

class CatalogueViewController: UIViewController {
    
    var viewModel: CatalogueViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel = CatalogueViewModel()
        viewModel.fetch()
        
    }


}

