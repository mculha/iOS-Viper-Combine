//
//  SectionDetailViewController.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import UIKit
import Combine

class SectionDetailViewController: UIViewController, ViewProtocol {    

    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: SectionDetailPresenter!
    private var store: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.setupUI()
        self.setupBindings()
    }
    
    private func setupBindings() {
        self.presenter
            .sectionDetails
            .sink { [weak self] _ in self?.tableView.reloadData() }
            .store(in: &store)
        
        self.presenter
            .error
            .sink { [weak self] error in
                guard let self else { return }
                AlertHelper.showAlert(on: self, message: error) { _ in self.navigationController?.popViewController(animated: true) }
            }
            .store(in: &store)
    }
    
    private func setupUI() {
        self.tableView.registerCell(type: SectionDetailCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 90

    }
}

extension SectionDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.sectionDetails.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: SectionDetailCell.self, for: indexPath)
        cell.setupCell(model: self.presenter.sectionDetails.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
