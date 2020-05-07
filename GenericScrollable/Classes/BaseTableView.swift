//
//  BaseTableView.swift
//  GenericScrollable
//
//  Created by Anar Guseynov on 07.05.2020.
//

import UIKit

public final class BaseTableView: UITableView {
    
    // MARK: private properties
    
    private weak var rootView: UIView?
    private var onTapHandler: ((ModelItem) -> Void)?

    // MARK: public properties
    
    public var items: [ModelItem] = [] {
        didSet { reloadData() }
    }

    // MARK: initialization
    public init(
        rootView: UIView,
        style: UITableView.Style = .plain,
        onTapHandler: @escaping (ModelItem) -> Void
    ) {
        self.rootView = rootView
        self.onTapHandler = onTapHandler
        super.init(frame: .zero, style: style)
        selfLayouting()
        configure()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: configurable methods
    
    private func configure() {
        dataSource = self
        delegate = self
    }
    
    private func selfLayouting() {
        guard let rootView = rootView else {
            assertionFailure()
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(self)
        leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: 0).isActive = true
        topAnchor.constraint(equalTo: rootView.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: 0).isActive = true
    }

    // MARK: helping methods
    
    private func getItemType(for indexPath: IndexPath) -> ModelItem.Type {
        return type(of: items[indexPath.row])
    }
}

// MARK:  tableView dataSource

extension BaseTableView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemType = getItemType(for: indexPath).self
        guard let cell = dequeueReusable(type: itemType) as? ConfigurableCell else {
            register(type: itemType)
            return self.tableView(tableView, cellForRowAt: indexPath)
        }
        cell.configure(by: items[indexPath.row])
        return cell
    }
    
    public func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    public func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK:  tableView dataSource
extension BaseTableView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        onTapHandler?(item)
    }
}
