//
//  ShowPresenter.swift
//  trainingmvp
//
//  Created by stag on 08/11/18.
//  Copyright © 2018 stag. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ShowView: class{
    func onError(error: String)
    func onShow(_ show: [ShowModel])
}


final class ShowPresenter{
    weak var view: ShowView?
    
    init(_ view: ShowView) {
        self.view = view
    }
    
    func getShow(){
    ServiceAPI.shared.getTest{ response in
            switch response.result{
            case .success:
                guard let data = response.result.value as? [[String: Any]]
                    else {return}
                print(data)
                
                var array = [ShowModel]()
                
                data.forEach({model in
                    if let objeto = Mapper<ShowModel>().map(JSON: model){
                        array.append(objeto)
                    }
                })
                
                self.view?.onShow(array)
                
            case .failure(let error):
                print(error)
                self.view?.onError(error: error.localizedDescription)
            }
        }
    }
}
