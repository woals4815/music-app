//
//  AddPlaylistModalViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/26.
//

import UIKit

protocol addPlaylistModalDelegate {
    func addPlaylistTitle(title: String?)
}

class AddPlaylistModalViewController: UIViewController {
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var playlistTitleTextfield: UITextField!
    
    var delegate: addPlaylistModalDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        modalView.layer.borderWidth = 0.2
        modalView.layer.masksToBounds = true
        modalView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabCancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tabConfirmBtn(_ sender: UIButton) {
        let playlistTitle = playlistTitleTextfield.text!
        if playlistTitle.count > 0 {
            delegate?.addPlaylistTitle(title: playlistTitle)
            self.dismiss(animated: true, completion: nil)
        }else {
            return
        }
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
