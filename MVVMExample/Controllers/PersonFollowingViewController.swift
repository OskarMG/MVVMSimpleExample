//
//  PersonFollowingViewController.swift
//  MVVMExample
//
//  Created by Oscar Martinez on 16/3/21.
//

import UIKit

class PersonFollowingViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchModels()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.clipsToBounds = true
    }
    
    private func fetchModels() {
        let names = ["Oscar", "Zabdi", "Lynn", "German", "Laia", "Katiusca"]
        for name in names { models.append( Person(name: name) )}
    }


}


extension PersonFollowingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonFollowingTableViewCell.identifier, for: indexPath) as! PersonFollowingTableViewCell
        cell.delegate = self
        cell.configure(with: PersonFollowingTableViewCellViewModel(with: model))
        return cell
    }
    
}


extension PersonFollowingViewController: PersonFollowingTableViewCellDelegate {
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel) {
        
        
    }
}
