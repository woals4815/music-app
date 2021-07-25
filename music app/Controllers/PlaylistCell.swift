//
//  PlaylistCell.swift
//  music app
//
//  Created by 정재민 on 2021/07/25.
//

import UIKit

class PlaylistCell: UITableViewCell {
    @IBOutlet weak var listImg: UIImageView!
    @IBOutlet weak var listName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
