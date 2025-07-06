import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "문자열 입력"
        textField.backgroundColor = .cyan
        return textField
    }()
    
    private let checkLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.textColor = .black
        label.text = "5글자를 넘지 않았습니다."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(checkLabel)
        
        // SnapKit constraints 설정
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }

        checkLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.left.right.equalTo(textField)
            $0.height.equalTo(50)
        }

        // 실시간 텍스트 검사 이벤트 등록
        textField.addTarget(self, action: #selector(chechText), for: .editingChanged)
    }
    
    @objc private func chechText() {
        if (textField.text?.count ?? 0 < 5) {
            checkLabel.backgroundColor = .gray
            checkLabel.textColor = .black
            checkLabel.text = "5글자를 넘지 않았습니다."
        } else {
            checkLabel.backgroundColor = .red
            checkLabel.textColor = .white
            checkLabel.text = "5글자를 넘었습니다!"
        }
    }
}

