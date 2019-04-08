import UIKit

protocol ExoDelegate {
    func leftHaveBeenSelected()
    func rightHaveBeenSelected()
}

class ExoBoardViewController: UIViewController {

    @IBOutlet var widget: ExoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
