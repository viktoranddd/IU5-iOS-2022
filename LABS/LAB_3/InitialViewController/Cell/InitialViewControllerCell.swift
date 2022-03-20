//
//  InitialViewControllerCell.swift
//  lab3
//
//  Created by Viktor Andreev on 18.03.2022.
//

import Foundation
import UIKit

final class InitialViewControllerCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let nameLabel = UILabel()
    
    // MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 8,
                                 y: 8,
                                 width: frame.width - 16,
                                 height: frame.height - 16)
    }
    
    // MARK: - Private
    
    private func setupViews() {
        addSubview(nameLabel)
    }
    
    func configure(text: String) {
        textLabel?.text = text
    }
}
