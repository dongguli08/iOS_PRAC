import UIKit
import SnapKit

class ViewController: UIViewController {
//    1. 버튼의 테두리가 둥근 모서리여야한다.
//    2. 버튼의 테두리를 따라서 그림자가 나타나야 한다. 조건
    
    let roundShadowButton : UIButton = {
          let aButton = UIButton()
          //4fc775
          aButton.backgroundColor = UIColor(red: 0x4f/0xff, green: 0xc7/0xff, blue: 0x75/0xff, alpha: 1.0)
          aButton.setTitle("둥근 버튼", for: .normal)
          aButton.setTitleColor(.white, for: .normal)
          aButton.translatesAutoresizingMaskIntoConstraints = false
          aButton.layer.cornerRadius = 15 //둥근 모서리 설정
        
          aButton.layer.shadowColor = UIColor.gray.cgColor //그림자 설정
          aButton.layer.shadowOpacity = 1.0
          aButton.layer.shadowOffset = CGSize.zero
          aButton.layer.shadowRadius = 6
        return aButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(roundShadowButton)
        self.view.backgroundColor = .white
        
        
        roundShadowButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(120)
        }
    }
}

