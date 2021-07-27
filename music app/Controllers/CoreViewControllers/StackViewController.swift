//
//  StackViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import UIKit

class StackViewController: UIViewController {
    
    var playlists = Playlists.sharedPlaylists.playlists
    var selectedIndex: IndexPath?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playlistDetailSegue" {
            let detailVC = segue.destination as! PlaylistDetailViewController
            detailVC.title = playlists[selectedIndex!.row].listName
            detailVC.playlist = playlists[selectedIndex!.row]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        print("스택 뷰 playlists: \(playlists)")
    }
}

//MARK: Playlist tableView delegate, datasource extension
extension StackViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell") as? PlaylistCell else {
            fatalError("no cell")
        }
        
        cell.listName.text = playlists[indexPath.row].listName
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath
        
        performSegue(withIdentifier: "playlistDetailSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            playlists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK: addPlaylistModalDelegate extension
extension StackViewController: addPlaylistModalDelegate {
    func addPlaylistTitle(title: String?) {
        let list = Playlist(musicList: nil, listName: title!)
        playlists.append(list)
        playlistTableView.reloadData()
    }
}
