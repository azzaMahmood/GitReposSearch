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
    let clientAPI: ApiRequest
    let repositories = BehaviorRelay<[RepoDetails]>(value: [])
    var keyWord: String
    var totalRepos = 0
    var currentPage = 0
    
    
    init(clientAPI: ApiRequest, keyWord: String) {
        self.clientAPI = clientAPI
        self.keyWord = keyWord
        getRepositories()
    }
    
    func getRepositories() {
        clientAPI.getRepositories(keyword: keyWord, page: currentPage)
            .map({ [weak self] (result) in
                guard let data = result.items else { return }
                self?.repositories.accept(data)
                self?.totalRepos = result.totalCount ?? 0
                if self?.repositories.value.count ?? 0 < self?.totalRepos ?? 0 {
                    self?.currentPage += 1
                } else {
                    return
                }
            }).subscribe().disposed(by: bag)
    }
    
}
