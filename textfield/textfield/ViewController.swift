import UIKit
import SnapKit

class ViewController:BaseViewController,UITextFieldDelegate { //BaseViewController 상속
    // 여기서 touchesBegan(_:with:) 등 UIResponder의 메서드를 오버라이드해서 사용할 수 있습니다.
    
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
        label.text = "8글자를 넘지 않았습니다."
        return label
    }()
    
    
    override func addSubView(){
        view.addSubview(textField)
        view.addSubview(checkLabel)
        
        textField.addTarget(self, action: #selector(chechText), for: .editingChanged)
        textField.delegate = self
    }
    
    // 배경 클릭시 키보드 내림
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //상속받은 UIResponder 클래스에서 제공하는 메서드입니다.
        self.view.endEditing(true)
        textField.layer.borderWidth = 0 //테두리 사라짐
        textField.layer.borderColor = UIColor.clear.cgColor // 테두리 색도 투명하게
    }

    // 입력 시작시 호출됨 (becomeFirstResponder 호출은 불필요)
    func textFieldDidBeginEditing(_ textField: UITextField) { //UITextFieldDelegate 프로토콜에 정의된 델리게이트 메서드
        textField.layer.borderWidth = 2 //없으면 색갈 안보임
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    override func layOut() {
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        checkLabel.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.left.right.equalTo(textField)
            $0.height.equalTo(50)
        }

    }
    
    // 델리게이트 메서드: 입력 제한
      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let currentText = textField.text ?? ""
          guard let stringRange = Range(range, in: currentText) else { return false }
          let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
          return updatedText.count <= 8
      }
    
    @objc private func chechText() {
        if (textField.text?.count ?? 0 < 8) {
            checkLabel.backgroundColor = .gray
            checkLabel.textColor = .black
            checkLabel.text = "8글자를 넘지 않았습니다."
        } else {
            checkLabel.backgroundColor = .red
            checkLabel.textColor = .white
            checkLabel.text = "8글자를 넘었습니다!"
        }
    }
}

