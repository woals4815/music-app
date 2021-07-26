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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
        
        popupView.layer.masksToBounds = true
        popupView.layer.cornerRadius = 5
//        popupView.layer.borderWidth = 1
        
    }
    
    @IBAction func tabDismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
