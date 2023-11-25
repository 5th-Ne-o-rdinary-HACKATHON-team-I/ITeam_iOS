//
//  TextField+.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/25.
//

import Foundation
import UIKit

extension UITextField {
    
    // method - textfield placeholder의 왼쪽 padding주기
    func addLeftPadding(padding: Int) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(padding), height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
}
