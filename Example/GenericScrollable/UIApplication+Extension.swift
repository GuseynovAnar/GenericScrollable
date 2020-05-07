//
//  UIApplication+Extension.swift
//  GenericScrollable_Example
//
//  Created by Anar Guseynov on 07.05.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

#if canImport(UIKit)
extension UIAppearance {
    @discardableResult
    func style(_ styleClosure: (Self) -> Void) -> Self {
        styleClosure(self)
        return self
    }
}
#endif
