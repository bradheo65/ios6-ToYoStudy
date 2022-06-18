//
//  CustomTableViewCell.swift
//  SampleTableView
//
//  Created by Derrick kim on 2022/06/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
