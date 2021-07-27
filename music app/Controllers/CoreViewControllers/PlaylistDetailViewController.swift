//
//  PlaylistDetailViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/26.
//

import UIKit

class PlaylistDetailViewController: UIViewController {
    
    @IBOutlet weak var playlistDetailTableView: UITableView!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension PlaylistDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.musicList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as? MusicListCell else {
            fatalError("no cell")
        }
        return cell
    }
}
