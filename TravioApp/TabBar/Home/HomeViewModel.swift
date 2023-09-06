//
//  HomeViewModel.swift
//  TravioApp
//
//  Created by imrahor on 30.08.2023.
//

import Foundation

class HomeViewModel {
    
    var pPlaces: PopularPlaces?
    var nPlaces: PopularPlaces?
    
    let params = [
        "limit": "5"
    ]
    
    func callPopularPlaces(complete: @escaping ([Place])->()) {
        APIService.call.objectRequestJSON(request: Router.getPopularPlaces(params: params)) { (result:Result<PopularPlaces,Error>) in
            switch result {
            case .success(let data):
                self.pPlaces = data
                complete(data.data.places)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func callNewPlaces(complete: @escaping ([Place])->()) {
        APIService.call.objectRequestJSON(request: Router.getLastPlaces(params: params)) { (result:Result<PopularPlaces,Error>) in
            switch result {
            case .success(let data):
                self.nPlaces = data
                complete(data.data.places)
            case .failure(let err):
                print(err)
            }
        }
    }
}
