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
    
    let bag = DisposeBag()
    let repositories = BehaviorRelay<[RepoDetails]>(value: [])
    var keyWord: String
    var totalRepos = 0
    var currentPage = 0
    
    
    init(keyWord: String) {
        self.keyWord = keyWord
        getRepositories()
    }
    
    func getRepositories() {
        NetworkClient.shared.sendRequest(endPoint: .repositories(keyword: keyWord, page: currentPage),
                                          decodingType: AllReposResponse.self).subscribe(onNext: { [weak self] (result) in
                guard let data = result.items else { return }
                self?.repositories.accept(data)
                self?.totalRepos = result.totalCount ?? 0
                if self?.repositories.value.count ?? 0 < self?.totalRepos ?? 0 {
                    self?.currentPage += 1
                } else {
                    return
                }
            }).disposed(by: bag)
    }
    
}
