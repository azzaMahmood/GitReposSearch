//
//  ApiRequest.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import Foundation
import RxSwift

class ResultsRepository {
    func fetchResults(keyword: String, page: Int) -> Single<AllReposResponse> {
        return Single.create { (single) -> Disposable in
            RequestManager().request(for: ReposService.self,
                                     responseModel: AllReposResponse.self,
                                     service: .repositories(keyword: keyword,
                                                            page: page)) { (result, error)  in
                guard error == nil, let data = result else {
                    return
                }
                single(.success(data))
            }
            return Disposables.create()
        }
    }
}
