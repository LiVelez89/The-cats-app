//
//  ViewController.swift
//  The cats app
//
//  Created by Lina on 27/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    let viewModel = CatsViewModel()
    
    
    // Components
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        viewModel.getCats()
        setupTableView()
        
        viewModel.reloadTable = { [unowned self] in
            tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        
        tableView.register(CatTableViewCell.self, forCellReuseIdentifier: CatTableViewCell.reuseID)
        tableView.rowHeight = CatTableViewCell.rowHeight
      
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])

    }
 

}

// MARK: - TableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        viewModel.buildCell(with: viewModel.cats[indexPath.row])
    }
    
    
}
