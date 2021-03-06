//
//  ModalViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/25.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    
    var playlists = Playlists.sharedPlaylists.playlists
    var music: Music?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        popupView.layer.masksToBounds = true
        popupView.layer.cornerRadius = 5
        popupView.layer.borderWidth = 0.2

        let nibName = UINib(nibName: "PlaylistCell", bundle: nil)
        listTableView.register(nibName, forCellReuseIdentifier: "playlistCell")
    }
    
    @IBAction func tabDismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listTableView.reloadData()
        print(playlists)
    }
}

extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playlist = playlists[indexPath.row]
        playlist.musicList.musicList.append(music!)
        print("음악이 들어간 리스트들이 나와야 하늗데: \(playlist)")
        print("ahhhhh: \(playlist.musicList.musicList)")
        self.dismiss(animated: true, completion: nil)
    }
}
