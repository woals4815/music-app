//
//  MusicViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import UIKit



class MusicViewController: UIViewController {
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var totalPlayTime: UILabel!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var backwardBtn: UIButton!
    @IBOutlet weak var musicProgress: UIProgressView!
    @IBOutlet weak var albumImg: UIImageView!
    
    @IBOutlet weak var addBtn: UIButton!
    
    var defaultTitle: String = "Default Title"
    var defaultArtist: String = "Unknown"
    var playlists: [Playlist]? = []
    var music: Music?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        let middleConfig = UIImage.SymbolConfiguration(pointSize: 19, weight: .bold, scale: .large)
        let largeBoldPlay = UIImage(systemName: "play.fill", withConfiguration: largeConfig)
        let largeBoldBackward = UIImage(systemName: "backward.fill", withConfiguration: largeConfig)
        let largeBoldForward =
            UIImage(systemName: "forward.fill", withConfiguration: largeConfig)
        let middleBoldAdd =  UIImage(systemName: "plus.circle.fill", withConfiguration: middleConfig)
        //MARK: CSS Part
        playBtn.setImage(largeBoldPlay, for: .normal)
        backwardBtn.setImage(largeBoldBackward, for: .normal)
        forwardBtn.setImage(largeBoldForward, for: .normal)
        addBtn.setImage(middleBoldAdd, for: .normal)
        albumImg.layer.masksToBounds = true
        albumImg.layer.cornerRadius = 10
        
        musicTitle.text = defaultTitle
        artistName.text = defaultArtist
    }
    
    @IBAction func tabAddBtn(_ sender: UIButton) {
        guard let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modalVC") as? ModalViewController  else {
             fatalError("No vc")
        }
        modalVC.modalPresentationStyle = .overFullScreen
        modalVC.music = music
//        modalVC.playlists = [Playlist(musicList: nil, listName: "test1")]
        present(modalVC, animated: true, completion: nil)
    }
}
