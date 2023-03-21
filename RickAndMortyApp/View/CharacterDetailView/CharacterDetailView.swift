//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 21.03.2023.
//

import Foundation
import UIKit

class CharacterDetailView:UIView{
  
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
  public var speciesLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16,
                             weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  public var originLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16,
                             weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  public var genderLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16,
                             weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  public var locationLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16,
                             weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  public var episodeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16,
                             weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .secondarySystemBackground
    layer.cornerRadius = 12
    setupViews()
    addConstraints()
  }
  required init?(coder:NSCoder) {
    fatalError("Unsupported")
  }

  private func setupViews(){
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(statusLabel)
  }
  private func addConstraints(){
    NSLayoutConstraint.activate([
      nameLabel.heightAnchor.constraint(equalToConstant: 32),
      statusLabel.heightAnchor.constraint(equalToConstant: 32),
      statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
      statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
      nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
      nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
      statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -4),
      imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -4),
      imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
      imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
      imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4)
    ])
  }
}
