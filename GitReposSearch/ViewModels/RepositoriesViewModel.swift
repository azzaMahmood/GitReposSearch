//
//  RepositoriesViewModel.swift
//  GitReposSearch
//
//  Created by Azza on 24/05/2021.
//

import Foundation
import RxSwift
import RxRelay

class RepositoriesViewModel {
    
    let repositories = BehaviorRelay<[RepoDetails]>(value: [])
    let isLoadNext = BehaviorRelay<Bool>.init(value: false)
   

    private var keyWord: String
    private var currentPage = 0
    private(set) var items: [RepoDetails] = []
    private(set) var currentItemsCount: Int = 0
    private(set) var totalRepos = 0
    private let bag = DisposeBag()
    
    init(keyWord: String) {
        self.keyWord = keyWord
        configureBinding()
    }
    
    private func configureBinding() {
        isLoadNext.subscribe(onNext: { [weak self] loadNext in
            guard let self = self else { return }
            if loadNext {
                self.currentPage += 1
                self.getRepositories()
            }
        }).disposed(by: bag)
    }
    
    func getRepositories() {
        NetworkClient.shared.sendRequest(endPoint: .repositories(keyword: keyWord, page: currentPage),
                                          decodingType: AllReposResponse.self).subscribe(onNext: { [weak self] (result) in
                                            guard let self = self else { return }
                                            self.items.append(contentsOf: result.items ?? [])
                                            self.currentItemsCount = self.items.count
                                            self.repositories.accept(self.items)
                                            self.totalRepos = result.totalCount ?? 0
                                          }).disposed(by: bag)
    }
}
