//
//  SectionViewController.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import UIKit
import Combine

class SectionViewController: UIViewController, ViewProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: SectionPresenter!
    private var store: Set<AnyCancellable> = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.setupUI()
        self.setupBindings()
    }
    
    private func setupBindings() {
        self.presenter
            .sections
            .sink { [weak self] _ in self?.tableView.reloadData() }
            .store(in: &store)
    }
    
    private func setupUI() {
        self.tableView.registerCell(type: SectionCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension SectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.sections.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: SectionCell.self, for: indexPath)
        cell.setupCell(model: self.presenter.sections.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelectItemAt(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
