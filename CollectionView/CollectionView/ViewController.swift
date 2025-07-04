import UIKit

class ViewController: BaseViewController {

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 130) //셀 하나의 크기
        $0.minimumLineSpacing = 10 //행 간 간격
        $0.minimumInteritemSpacing = 10 //셀 사이 간격
        $0.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //섹션 안쪽 여백
    })
    
    override func addSubview() {
           view.addSubview(collectionView)  // 직접 호출해야 뷰가 추가됨
           collectionView.dataSource = self
           collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.identifier)//셀등록
       }
       
       override func layout() {
           collectionView.snp.makeConstraints {
               $0.edges.equalToSuperview() //collectionView는 ViewController의 view 전체를 가득 채움
           }
       }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70 // 원하는 셀 개수
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as? MyCell else {
            return UICollectionViewCell()
        }
        let image = UIImage(named: "sample")
        let title = "아이템 \(indexPath.item + 1)"
        cell.configure(image: image, title: title)
        
        return cell
    }
}

