//
//  PlaylistModel.swift
//  music app
//
//  Created by 정재민 on 2021/07/25.
//

import Foundation

struct Playlist {
    var musicList =  MusicList.sharedMusicList
    var listName: String?
}

class MusicList {
    static let sharedMusicList = MusicList()
    
    public var musicList = [Music]()
    private init() {}
}

class Playlists {
    static let sharedPlaylists = Playlists()
    
    public var playlists = [Playlist]()
    private init() {}
}
