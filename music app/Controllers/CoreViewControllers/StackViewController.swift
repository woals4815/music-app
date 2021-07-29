//
//  StackViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import UIKit

class StackViewController: UIViewController {
    
    var playlists = Playlists.sharedPlaylists
    var selectedIndex: IndexPath?
    var detailVC: PlaylistDetailViewController?
    
    @IBOutlet weak var playlistTableView: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        
        let nibName = UINib(nibName: "PlaylistCell", bundle: nil)
        playlistTableView.register(nibName, forCellReuseIdentifier: "playlistCell")
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        guard let addPlaylistModalVC = self.storyboard?.instantiateViewController(withIdentifier: "addPlaylistModalVC") as? AddPlaylistModalViewController else {
            fatalError("there's no VC")
        }
        addPlaylistModalVC.modalPresentationStyle = .overFullScreen
        addPlaylistModalVC.delegate = self
        present(addPlaylistModalVC, animated: true, completion: nil)
    }
    
    @IBAction func tabEditBtn(_ sender: UIBarButtonItem) {
        print("Edit 버튼 눌렀을 때: \(playlists)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playlistDetailSegue" {
            let detailVC = segue.destination as! PlaylistDetailViewController
            detailVC.title = playlists.playlists[selectedIndex!.row].listName
            detailVC.playlist = playlists.playlists[selectedIndex!.row]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        print("스택 뷰 playlists: \(playlists)")
    }
}

//MARK: Playlist tableView delegate, datasource extension
extension StackViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlists.playlists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell") as? PlaylistCell else {
            fatalError("no cell")
        }
        
        cell.listName.text = playlists.playlists[indexPath.row].listName
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath
        
        detailVC?.playlist = playlists.playlists[indexPath.row]
        
        performSegue(withIdentifier: "playlistDetailSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            playlists.playlists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK: addPlaylistModalDelegate extension
extension StackViewController: addPlaylistModalDelegate {
    func addPlaylistTitle(title: String?) {
        let list = Playlist(musicList: MusicList.sharedMusicList, listName: title!)
        playlists.playlists.append(list)
        
        playlistTableView.reloadData()
    }
}
