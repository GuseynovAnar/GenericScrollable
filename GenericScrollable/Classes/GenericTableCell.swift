//
//  GenericTableCell.swift
//  GenericScrollable
//
//  Created by Anar Guseynov on 07.05.2020.
//

import UIKit

// MARK: ModelItem protocol

public protocol ModelItem {
    
    var id: UUID { get }
    
    static var tableCellId: String { get }
    static var tableCellClassType: AnyClass? { get }
}

// MARK: ConfigurableView protocol

public protocol ConfigurableView: UIView {
    // generic typealias
    associatedtype ViewModel: ModelItem
    
    // self component bulder
    static func buildSelf() -> Self
    
    func configure(model: ViewModel)
    var model: ViewModel? { get }
}

extension ConfigurableView {
    // builder default realization
    public static func buildSelf() -> Self {
        return .init(frame: .zero)
    }
}

// MARK: ConfigurableCell protocol

protocol ConfigurableCell: UITableViewCell {
    func configure(by model: ModelItem)
}

// MARK: GenericTableCell

public final class GenericTableCell<Item: ConfigurableView>: UITableViewCell {
    
    private lazy var view: Item = .buildSelf()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layoutSubviewToEdges()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenericTableCell: ConfigurableCell {
    public func configure(by item: ModelItem) {
        guard let model = item as? Item.ViewModel else { assertionFailure(); return }
        view.configure(model: model)
    }
}

extension GenericTableCell {
    private func layoutSubviewToEdges() {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
