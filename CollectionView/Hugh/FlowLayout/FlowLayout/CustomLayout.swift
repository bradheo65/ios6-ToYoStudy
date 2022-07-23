//
//  CustomLayout.swift
//  FlowLayout
//
//  Created by dhoney96 on 2022/07/16.
//

import UIKit

class CustomLayout: UICollectionViewLayout {
    
    // 보열지는 item의 갯수, item 간의 padding
    var numberOfColumns = 4
    var padding: CGFloat = 6
    
    var contentHeight: CGFloat = 0
    
    // UICollectionViewLayoutAttributes는 collectionView의 bound, frame, size, isHidden 등 item(Cell)에 대한 속성을 가지고 있다.
    var cache = [UICollectionViewLayoutAttributes]()
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.bounds.width, height: 0.0)
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        
        let columnWidth = collectionView.bounds.width / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        
        // xOffset은 height와 다르게 사용자가 지정한 column만큼 일정하다.
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        // xOffset과 yOffset의 index (column이 2개라면, 0,1 두개임.)
        var column = 0
        
        // item의 전체 갯수가 아닌 numberOfColumns인 이유는 계속해서 변경되기 때문
        // ex)
        // let liar = Array(repeating: false, count: 5)
        // print(liar)  /* [false, false, false, false, false] *
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        
        // 3 전체 item갯수를 돌면서, cache에 item 정보를 저장함.
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            //item의 frame
            let frame = CGRect(x: xOffset[column],
                               y: yOffset[column],
                               width: columnWidth,
                               height: 100)
            // insetBy 만큼 터치 인식 영역이 증가하거나 감소함.
            // dx, dy가 음수이면 bounds의 크기를 증가, dx, dy가 양수이면 bounds의 크기 감소
            let insetFrame = frame.insetBy(dx: padding, dy: padding)
            
            // 5 item의 x,y,width,height를 지정한 frame을 cache에 저장함.
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // 6
            contentHeight = max(contentHeight, frame.maxY)
                
            yOffset[column] = yOffset[column] + 100
            
            // 다음 item이 다음 열에 배치되도록 설정
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache.filter { rect.intersects( $0.frame) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
