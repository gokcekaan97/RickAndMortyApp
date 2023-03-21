//
//  CharacterListViewCell.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 18.03.2023.
//

import UIKit

class CharacterListViewCell: UICollectionViewCell {
  
  static let cellIdentifier = "CharacterCollectionViewCell"
  public var imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFill
    image.layer.masksToBounds = true
    image.layer.cornerRadius = 12
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  public var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 18,
                             weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  public var statusLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16,
                             weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .secondarySystemBackground
    contentView.layer.cornerRadius = 12
    setupViews()
    addConstraints()
  }
  required init?(coder:NSCoder) {
    fatalError("Unsupported")
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    nameLabel.text = nil
    statusLabel.text = nil
  }
  private func setupViews(){
    contentView.addSubview(imageView)
    contentView.addSubview(nameLabel)
    contentView.addSubview(statusLabel)
  }
  private func addConstraints(){
    NSLayoutConstraint.activate([
      nameLabel.heightAnchor.constraint(equalToConstant: 32),
      statusLabel.heightAnchor.constraint(equalToConstant: 32),
      statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
      statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
      nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
      nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
      statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
      nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -4),
      imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -4),
      imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
      imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4),
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4)
    ])
  }
}
