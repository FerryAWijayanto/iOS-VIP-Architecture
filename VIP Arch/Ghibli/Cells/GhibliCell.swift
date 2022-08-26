//
//  GhibliCell.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 17/08/22.
//

import UIKit

class GhibliCell: UICollectionViewCell {
    
    static let reuseId = "GhibliCell"
    
    private let movieImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Title"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Release Date"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(dataSource: GhibliResponse) {
        movieImageView.load(image: dataSource.image)
        titleLabel.text = dataSource.title
        releaseDateLabel.text = dataSource.releaseDate
    }
    
    private func configure() {
        [movieImageView, stackView].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(v)
        }
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(releaseDateLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: padding),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            movieImageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -padding),
            
            stackView.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
}
