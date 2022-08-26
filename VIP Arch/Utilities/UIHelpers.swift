//
//  UIHelpers.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 17/08/22.
//

import Foundation
import UIKit.UIView

enum UIHelpers {
    
    static func createCollectionViewLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 8
        let minimumItemSpacing: CGFloat = 8
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 120)
        
        return flowLayout
    }
}
