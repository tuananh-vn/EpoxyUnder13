//
//  HomeTopItemModel.swift
//  DiscoveryCoreUI
//
//  Created by Dong Tuan Anh on 04/05/2021.
//

import Foundation

class HomeTopViewDataStore: BaseDataStore {
    typealias View = HomeTopViewCell
    
    func buildContent() -> Never {
        fatalError()
    }
}

final class HomeTopViewItemModel: BaseItemModel {
    typealias DataStore = HomeTopViewDataStore
    
}
