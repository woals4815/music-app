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
        playlistDetailTableView.delegate = self
        playlistDetailTableView.dataSource = self
        
        let nibName = UINib(nibName: "MusicListCell", bundle: nil)
        playlistDetailTableView.register(nibName, forCellReuseIdentifier: "MusicCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        print(playlist?.musicList.musicList.count)
        playlistDetailTableView.reloadData()
    }
}
//MARK: PlaylistDetail delegate, datasource part
extension PlaylistDetailViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: playlistDetailTableView row number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.musicList.musicList.count ?? 0
    }
    //MARK: playlistDetailTableView create cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as? MusicListCell else {
            fatalError("no cell")
        }
        cell.musicTitle.text = playlist?.musicList.musicList[indexPath.row].title
        cell.artistName.text = playlist?.musicList.musicList[indexPath.row].artistName
        return cell
    }
}
