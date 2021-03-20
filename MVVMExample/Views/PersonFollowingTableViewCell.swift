//
//  PersonFollowingTableViewCell.swift
//  MVVMExample
//
//  Created by Oscar Martinez on 16/3/21.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel)
}

class PersonFollowingTableViewCell: UITableViewCell {
    
    static let identifier = "PersonFollowingTableViewCell"
    
    weak var delegate: PersonFollowingTableViewCellDelegate?
    private var viewModel: PersonFollowingTableViewCellViewModel?
        
    let userImageView: UIImageView = {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUIElements()
        contentView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        userNameLabel.text = nil
        userImageView.image = nil
        
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with  viewModel: PersonFollowingTableViewCellViewModel) {
        self.viewModel = viewModel
        
        nameLabel.text = viewModel.name
        userNameLabel.text = viewModel.username
        userImageView.image = viewModel.image
        
        button.setTitle( viewModel.currentlyFollowing ? "Unfollow" : "Follow", for:  .normal)
        button.setTitleColor( viewModel.currentlyFollowing ? .black : .white, for: .normal)
        button.layer.borderWidth = viewModel.currentlyFollowing ? 1 : 0
        button.layer.borderColor = viewModel.currentlyFollowing ? UIColor.black.cgColor : UIColor.blue.cgColor
        
        if !viewModel.currentlyFollowing { button.backgroundColor = .link }
    }
    
    private func addSubViews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(button)
    }
    
    
    private func configureUIElements() {
        let imageWith = contentView.frame.size.height - 10
        userImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: imageWith,
            height: imageWith)
        
        nameLabel.frame = CGRect(
            x: imageWith + 10,
            y: 0,
            width: contentView.frame.size.width - imageWith,
            height: contentView.frame.size.height / 2)
        
        userNameLabel.frame = CGRect(
            x: imageWith + 10,
            y: contentView.frame.size.height / 2,
            width: contentView.frame.size.width - imageWith,
            height: contentView.frame.size.height / 2)
        
        button.frame = CGRect(
            x: contentView.frame.size.width - 120,
            y: 10,
            width: 110,
            height: contentView.frame.size.height - 20)
    }
    
    
    @objc private func didTapButton() {
        guard let viewModel = viewModel else { return }
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        delegate?.personFollowingTableViewCell(self, didTapWith: newViewModel)
        
        prepareForReuse()
        configure(with: newViewModel)
    }

}
