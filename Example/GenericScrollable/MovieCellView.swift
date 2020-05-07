//
//  MovieCellView.swift
//  GenericScrollable_Example
//
//  Created by Anar Guseynov on 07.05.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import GenericScrollable

class MovieCellView: UIView, ConfigurableView {
    var model: MovieViewModel?
    
    private lazy var title = UILabel().style {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .black
    }
    
    private lazy var releaseDate = UILabel().style {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .lightGray
    }
    
    private lazy var genre = UILabel().style {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.textColor = .red
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configureLayout() {
        genre.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(genre)
        addSubview(title)
        addSubview(releaseDate)

        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        title.bottomAnchor.constraint(equalTo: genre.topAnchor, constant: -10).isActive = true
        genre.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        genre.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        genre.bottomAnchor.constraint(equalTo: releaseDate.topAnchor, constant: -10).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        releaseDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        releaseDate.setContentHuggingPriority(.required, for: .vertical)
        title.setContentHuggingPriority(.required, for: .vertical)
        genre.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func configure(model: MovieViewModel) {
        self.model = model
        title.text = model.title
        genre.text = model.genre.rawValue.uppercased()
        releaseDate.text = model.releaseDate
    }
}
