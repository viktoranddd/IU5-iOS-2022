//
//  TestCell.swift
//  lab3
//
//  Created by Viktor Andreev on 11.03.2022.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet private weak var testImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with: String, image: UIImage) {
        testImage.image = image
        testImage.contentMode = .scaleAspectFit
        titleLabel.text = with
        subtitleLabel.text = "P.S. нажмите на ячейку"
    }

}
