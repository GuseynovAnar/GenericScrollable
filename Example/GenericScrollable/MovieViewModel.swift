//
//  MovieViewModel.swift
//  GenericScrollable_Example
//
//  Created by Anar Guseynov on 07.05.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import GenericScrollable

struct MovieViewModel: ModelItem {
    
    // MARK: Nested Types
    enum Genre: String {
        case comedy
        case adventure
        case drama
        case thriller
        case documentary
        case horror
        case scienceFiction
    }
    
    var id: UUID = UUID()
    
    var title: String
    var releaseDate: String
    var genre: Genre
    
    init(title: String, releaseDate: String, genre: Genre) {
        self.title = title
        self.releaseDate = releaseDate
        self.genre = genre
    }
}

extension MovieViewModel {
    static var tableCellId: String {
        return String(describing: GenericTableCell<MovieCellView>.self)
    }
    
    static var tableCellClassType: AnyClass? {
        return GenericTableCell<MovieCellView>.self
    }
}
