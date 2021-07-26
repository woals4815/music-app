//
//  StackViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import UIKit

class StackViewController: UIViewController {
    
    var playlist: [Playlist] = [Playlist]()
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
    }
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        guard let addPlaylistModalVC = self.storyboard?.instantiateViewController(withIdentifier: "addPlaylistModalVC") else {
            fatalError("there's no VC")
        }
        addPlaylistModalVC.modalPresentationStyle = .overFullScreen
        present(addPlaylistModalVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension StackViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell") as? PlaylistCell else {
            fatalError("there's no cell")
        }
        cell.listName.text = playlist[indexPath.row].listName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
