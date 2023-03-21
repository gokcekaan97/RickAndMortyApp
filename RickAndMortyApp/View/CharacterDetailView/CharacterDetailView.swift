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
  public var episodeLabel: UITextView = {
    let textView = UITextView()
    textView.backgroundColor = .secondarySystemBackground
    textView.textColor = .secondaryLabel
    textView.font = .systemFont(ofSize: 16,
                             weight: .regular)
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
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
    addSubview(episodeLabel)
    addSubview(originLabel)
    addSubview(speciesLabel)
    addSubview(genderLabel)
    addSubview(locationLabel)
  }
  private func addLabelConstraints(label:UILabel){
    NSLayoutConstraint.activate([
      label.heightAnchor.constraint(equalToConstant: 32),
      label.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
      label.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
    ])
    
  }
  private func addConstraints(){
    addLabelConstraints(label: nameLabel)
    addLabelConstraints(label: statusLabel)
    addLabelConstraints(label: originLabel)
    addLabelConstraints(label: speciesLabel)
    addLabelConstraints(label: genderLabel)
    addLabelConstraints(label: locationLabel)
    NSLayoutConstraint.activate([
      episodeLabel.heightAnchor.constraint(equalToConstant: 150),
      episodeLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 8),
      episodeLabel.rightAnchor.constraint(equalTo: rightAnchor,constant: -8),
      episodeLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0),
      statusLabel.bottomAnchor.constraint(equalTo: episodeLabel.topAnchor, constant: -4),
      nameLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -4),
      originLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -4),
      speciesLabel.bottomAnchor.constraint(equalTo: originLabel.topAnchor, constant: -4),
      genderLabel.bottomAnchor.constraint(equalTo: speciesLabel.topAnchor, constant: -4),
      locationLabel.bottomAnchor.constraint(equalTo: genderLabel.topAnchor, constant: -4),
      imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -4),
      imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
      imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4),
      imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4)
    ])
  }
  
}
