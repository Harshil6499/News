//
//  MyTableViewCell.swift
//  Pods
//
//  Created by Apple on 14/08/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var MyNewsLBL: UILabel!
    @IBOutlet weak var MyNewsDateLBL: UILabel!
    @IBOutlet weak var MyNewsContentLBL: UILabel!
    @IBOutlet weak var MyNewsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
