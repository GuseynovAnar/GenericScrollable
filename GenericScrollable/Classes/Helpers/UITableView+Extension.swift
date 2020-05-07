//
//  UITableView+Extension.swift
//  GenericScrollable
//
//  Created by Anar Guseynov on 07.05.2020.
//

import UIKit

public extension UITableView {
    func register(type: ModelItem.Type) {
        register(type.tableCellClassType, forCellReuseIdentifier: type.tableCellId)
    }

    func dequeueReusable<Cell>(type: ModelItem.Type) -> Cell? where Cell: UITableViewCell {
        return dequeueReusableCell(withIdentifier: type.tableCellId) as? Cell
    }
}

