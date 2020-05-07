//
//  ViewController.swift
//  GenericScrollable
//
//  Created by AnarGuseynov on 05/07/2020.
//  Copyright (c) 2020 AnarGuseynov. All rights reserved.
//

import UIKit
import GenericScrollable

class ViewController: UIViewController {

    private lazy var tableView = BaseTableView(
        rootView: view,
        style: .grouped,
        onTapHandler: handleOnTap
    ).style(setupTableAppearecne)
    
    private var items: [MovieViewModel] {
        return [
            MovieViewModel(
                title: "Blade Runner 2049",
                releaseDate: "5 октября 2017 г.",
                genre: .scienceFiction
            ),
            MovieViewModel(
                title: "Pirates of the Caribbean / Пираты карибского моря",
                releaseDate: "22 августа 2003 г.",
                genre: .adventure
            ),
            MovieViewModel(
                title: "Once Upon a Time... in Hollywood / Однажы... в Голливуде",
                releaseDate: "8 августа 2019 г.",
                genre: .comedy
            ),
            MovieViewModel(
                title: "Amy / Эми",
                releaseDate: "10 сентября 2015 г.",
                genre: .documentary
            ),
            MovieViewModel(
                title: "Braveheart / Храброе Сердце",
                releaseDate: "19 мая 1995 г.",
                genre: .drama
            ),
            MovieViewModel(
                title: "IT / Оно",
                releaseDate: "7 сентября 2017 г.", genre: .horror
            ),
            MovieViewModel(
                title: "Nightcrawler / Стрингер",
                releaseDate: "6 августа 2015 г.",
                genre: .thriller
            )
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.items = items
    }
    
    private func handleOnTap(_ model: ModelItem) -> Void {
        print(model)
    }
    
    private func setupTableAppearecne(_ table: BaseTableView) -> Void {
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .white
    }
}

