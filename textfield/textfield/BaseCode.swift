import UIKit
import SnapKit


public class BaseViewController: UIViewController{
    @objc open func addSubView() {}
    @objc open func layOut() {}
    
    override public func viewDidLoad() {
        super.viewDidLoad() //상위 클래스 초기화 완료, 정상 동작
        addSubView() // 호출해야 하위 클래스 구현 동작 실행
        layOut()
    }
}
