//
//  PlacesViewController.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI
import GKViper
import GKRepresentable

protocol PlacesViewInput: ViperViewInput {
    func updateSections(_ sections: [TableSectionModel])
}

protocol PlacesViewOutput: ViperViewOutput {
    func selectedCell(_ place: PlaceModel)
}

class PlacesViewController: ViperViewController, PlacesViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    fileprivate var output: PlacesViewOutput? {
        guard let output = self._output as? PlacesViewOutput else { return nil }
        return output
    }
    
    let refreshControl = UIRefreshControl()
    var sections: [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCellNib(PlaceCell.self)
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.asBackground())
        self.tableView.apply(.standart())
    }
    
    // MARK: - PlacesViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    func updateSections(_ section: [TableSectionModel]) {
        self.sections = section
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
            strongSelf.refreshControl.endRefreshing()
        }
    }
}

// MARK: - Actions
extension PlacesViewController { }

// MARK: - Module functions
extension PlacesViewController { }

// MARK: - UITableViewDataSource
extension PlacesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let sections = self.sections.count
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = self.sections[section].rows.count
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is PlaceCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? PlaceCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = self.sections[indexPath.section].rows[indexPath.row] as? PlaceCellModel {
            self.output?.selectedCell(model.place)
        }
    }
}
