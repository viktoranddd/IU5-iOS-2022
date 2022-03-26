//
//  CodedSecondViewControllerCell.swift
//  lab3
//
//  Created by Viktor Andreev on 20.03.2022.
//

import Foundation
import UIKit

final class CodedSecondViewControllerCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let testImage = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        testImage.frame = CGRect(x: 10,
                                 y: 10,
                                 width: frame.height - 20,
                                 height: frame.height - 20)
        
        
        titleLabel.frame = CGRect(x: 80,
                                  y: 10,
                                  width: Int(frame.width) - 90,
                                  height: Int(testImage.frame.height)/2)
        
        subtitleLabel.frame = CGRect(x: 80,
                                     y: 10 + Int(testImage.frame.height)/2,
                                     width: Int(frame.width) - 90,
                                     height: Int(testImage.frame.height)/2)
        
        
    }
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(testImage)
    }
    
    func configure(with: String, image: UIImage) {
        testImage.image = image
        testImage.contentMode = .scaleAspectFit
        titleLabel.text = with
        titleLabel.font = .boldSystemFont(ofSize: 20)
        subtitleLabel.text = "P.S. нажмите на ячейку"
    }
}
