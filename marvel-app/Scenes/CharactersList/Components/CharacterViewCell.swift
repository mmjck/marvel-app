//
//  CharacterViewCell.swift
//  marvel-app
//
//  Created by Jackson Matheus on 15/11/23.
//

import UIKit
import Kingfisher



class CharacterViewCell: UICollectionViewCell {
    
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            nameLabel.text = character.name
            imageView.kf.setImage(with: character.pictureURL)
            
        }
    }
    
    
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .cairo(.semibold, size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return imageView
    }()
    
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ imageView, nameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .blue
        stackView.layer.cornerRadius = 8
        
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CharacterViewCell: ViewCode {
    func addSubviews() {
        self.contentView.addSubview(containerStackView)
    }
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75)
        ])
    }
    
}
