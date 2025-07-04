import UIKit
import SnapKit

class MyCell: UICollectionViewCell {
    
    static let identifier = "MyCell"
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.numberOfLines = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(contentView.snp.width) // 정사각형 이미지뷰
        }
        
        titleLabel.snp.makeConstraints { //cell 내부의 조건
            $0.top.equalTo(imageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.lessThanOrEqualToSuperview().inset(4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage?, title: String) { //셀의 UI 요소인 imageView와 titleLabel에 데이터를 넣어주는 역할을 합니다
        imageView.image = image
        titleLabel.text = title
    }
}

