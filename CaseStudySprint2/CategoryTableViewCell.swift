//
//  CategoryTableViewCell.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/21/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
