//
//  MusicListCell.swift
//  music app
//
//  Created by 정재민 on 2021/07/24.
//

import UIKit

class MusicListCell: UITableViewCell {
    @IBOutlet weak var musicImg: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        musicImg.layer.masksToBounds = true
        musicImg.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
