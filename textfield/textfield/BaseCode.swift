import UIKit
import SnapKit


public class BaseViewController: UIViewController{
    func addSubview() {}
    func layout() {}
    
    override public func viewDidLoad() {
        super.viewDidLoad() //상위 클래스 초기화 완료, 정상 동작
        addSubview() // 호출해야 하위 클래스 구현 동작 실행
        layout()
    }
}
