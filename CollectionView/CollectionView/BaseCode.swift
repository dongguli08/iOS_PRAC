import SnapKit
import Then
import UIKit


public class BaseViewController: UIViewController {
    func addSubview() { }
    func layout() { }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    
        addSubview()
        layout()
    }
}

