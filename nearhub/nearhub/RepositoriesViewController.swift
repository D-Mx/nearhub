//
//  ViewController.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/4/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repositories = [Repository]()
    lazy var defaultAvatarImage = UIImage(named: "defaultAvatar")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRepositories()
    }
    
    func fetchRepositories() {
        
        RepositoryService.fetchAllRepositories { repositories, error in
            guard let repos = repositories else { return }
            
            self.repositories = repos
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RepositoryDetails", let destination = segue.destination as? RepositoryDetailsViewController {
            
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                destination.repository = repositories[indexPath.row]
            }
        }
    }
}

extension RepositoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = repositories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell")!
        cell.textLabel?.text = repo.name
        cell.detailTextLabel?.text = "by \(repo.owner.name!)"
        
        if let avatar = repo.owner.avatarImage {
            cell.imageView?.image = avatar
            
        } else if let imageURL = repo.owner.avatarURL {
            cell.imageView?.image = defaultAvatarImage
            cell.imageView?.downloadedFrom(imageURL) { image in                
                self.repositories[indexPath.row].owner.avatarImage = image
            }
            
        }
        
        return cell
    }
}


