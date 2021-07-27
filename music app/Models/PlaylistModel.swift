//
//  PlaylistModel.swift
//  music app
//
//  Created by 정재민 on 2021/07/25.
//

import Foundation

struct Playlist {
    var musicList: [Music]?
    var listName: String?
}

class Playlists {
    static let sharedPlaylists = Playlists()
    
    public var playlists = [Playlist]()
    private init() {}
}
