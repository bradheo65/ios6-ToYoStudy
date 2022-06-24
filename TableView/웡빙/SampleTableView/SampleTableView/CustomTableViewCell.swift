//
//  CustomTableViewCell.swift
//  SampleTableView
//
//  Created by 이원빈 on 2022/06/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var circleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
