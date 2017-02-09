//
//  RepositoryDetailsViewController.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/9/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerURL: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoUrlLabel: UILabel!
    @IBOutlet weak var isForkLabel: UILabel!
    @IBOutlet weak var isPrivateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repository: Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.image = repository.owner.avatarImage
        ownerLabel.text = repository.owner.name
        ownerURL.text = repository.owner.url
        repoNameLabel.text = repository.name
        repoUrlLabel.text = repository.repoURL
        isForkLabel.text = repository.isFork ? "Yes" : "No"
        isPrivateLabel.text = repository.isPrivate ? "Yes" : "No"
        descriptionLabel.text = repository.description
        
    }
    

}
