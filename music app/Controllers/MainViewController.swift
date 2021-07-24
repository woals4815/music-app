//
//  ViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var musicData: [Music] = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeTableView.delegate = self
        homeTableView.dataSource = self
        let musicTitles = ["Crazy(Cover)", "Day 1", "Leave the Door Open", "Come and Get Your Love", "Mr. Blue Sky"]
        let artistNames = ["Daniela Andrade", "HONNE", "Silk Sonic", "Redbone", "Electric Light Orchestra"]
        let genres = [1,1,1,1,1]
        let dataCount = genres.count
        for i in 0..<dataCount {
            musicData.append(Music(title: musicTitles[i], artistName: artistNames[i], genre: genres[i]))
        }
        //MARK: register reusable cell in viewdidload
        let nibName = UINib(nibName: "MusicListCell", bundle: nil)
        homeTableView.register(nibName, forCellReuseIdentifier: "MusicCell")
        
    }
    
    //MARK: tableView datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicData.count
    }
    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as? MusicListCell else {
            fatalError("there's no cell")
        }
        cell.musicTitle.text = musicData[indexPath.row].title!
        cell.artistName.text = musicData[indexPath.row].artistName!
        return cell
    }
    //MARK: tableView cell height custom
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let musicVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicViewController") as! MusicViewController
        present(musicVC, animated: true, completion: nil)
    }
}

