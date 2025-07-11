import UIKit
import SnapKit

class ViewController: UIViewController {
//    1. 버튼의 테두리가 둥근 모서리여야한다.
//    2. 버튼의 테두리를 따라서 그림자가 나타나야 한다. 조건
    
    let roundShadowButton : UIButton = {
          let aButton = UIButton()
        
          aButton.backgroundColor = UIColor(red: 0x4f/0xff, green: 0xc7/0xff, blue: 0x75/0xff, alpha: 1.0)
          aButton.setTitle("둥근 버튼", for: .normal)
          aButton.setTitleColor(.white, for: .normal)
          aButton.translatesAutoresizingMaskIntoConstraints = false
          aButton.layer.cornerRadius = 15 //둥근 모서리 설정
        
          aButton.layer.shadowColor = UIColor.gray.cgColor //그림자색갈은 회식
          aButton.layer.shadowOpacity = 1.0 // "그림자를 완전히 진하게 보이도록 설정한다."
          aButton.layer.shadowOffset = CGSize.zero// "그림자가 버튼 뒤쪽에 정확히 겹치게 위치한다."
          aButton.layer.shadowRadius = 6//6 정도의 퍼짐 효과를 줘서 부드러운 그림자를 만든다
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

