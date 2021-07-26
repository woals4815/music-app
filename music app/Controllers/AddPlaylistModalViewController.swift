//
//  AddPlaylistModalViewController.swift
//  music app
//
//  Created by 정재민 on 2021/07/26.
//

import UIKit

class AddPlaylistModalViewController: UIViewController {
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var playlistTitleTextfield: UITextField!
    
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
        print(playlistTitleTextfield.text!)
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
