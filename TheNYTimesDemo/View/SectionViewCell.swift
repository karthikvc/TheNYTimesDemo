//
//  SectionViewCellTableViewCell.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SectionViewCell: UITableViewCell {

    @IBOutlet weak var sectionimage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak internal var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
