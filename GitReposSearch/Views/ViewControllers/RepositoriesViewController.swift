//
//  RepositoriesViewController.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoriesViewController: UIViewController, UIScrollViewDelegate {
    
    private let bag = DisposeBag()
    var viewModel: RepositoriesViewModel?

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "ReposiroryTableViewCell", bundle: Bundle.main),
                                  forCellReuseIdentifier: ReposiroryTableViewCell.reuseIdentifier)
        tableview.rowHeight = UITableView.automaticDimension
        viewModel?.repositories
            .bind(to: tableview
                .rx.items(cellIdentifier: ReposiroryTableViewCell.reuseIdentifier,
                       cellType: ReposiroryTableViewCell.self)) { _, repository, cell in
                cell.setupUiWithData(repoDetail: repository)
        }
        .disposed(by: bag)

        tableview.rx
            .setDelegate(self)
            .disposed(by: bag)
    }
    

}
