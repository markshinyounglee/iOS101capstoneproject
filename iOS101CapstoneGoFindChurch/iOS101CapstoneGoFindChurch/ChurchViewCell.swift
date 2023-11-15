//
//  ChurchViewCell.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/14/23.
//

import UIKit


class ChurchViewCell: UITableViewCell {
    @IBOutlet weak var churchImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var denominationLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
