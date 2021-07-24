//
//  MusicModel.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import Foundation


struct Music {
    var title: String?
    var artistName: String?
    var genre: Int?
    init(title: String, artistName: String, genre: Int) {
        self.title = title
        self.artistName = artistName
        self.genre = genre
    }
}
