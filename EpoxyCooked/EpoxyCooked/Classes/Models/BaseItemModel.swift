//
//  BaseItemModel.swift
//  DiscoveryUI
//
//  Created by Dong Tuan Anh on 29/04/2021.
//

import Foundation
import UIKit


public protocol BaseDataStore {
    associatedtype View: EpoxyableView
    
    func buildContent() -> View.Content
}

public protocol BaseItemModel {
    associatedtype DataStore: BaseDataStore
}

extension BaseItemModel {
    public static func view(dataId: AnyHashable, data: DataStore, style: DataStore.View.Style, behavior: DataStore.View.Behaviors? = nil) -> ItemModel<DataStore.View> {
        return DataStore.View.itemModel(dataID: dataId, content: data.buildContent(), behaviors: behavior, style: style)
    }
}

extension BaseItemModel where DataStore.View.Style == Never {
    public static func view(dataId: AnyHashable, data: DataStore, behavior: DataStore.View.Behaviors? = nil) -> ItemModel<DataStore.View> {
        return DataStore.View.itemModel(dataID: dataId, content: data.buildContent(), behaviors: behavior)
    }
}

extension BaseItemModel where DataStore.View.Content == Never {
    public static func view(dataId: AnyHashable, style: DataStore.View.Style, behavior: DataStore.View.Behaviors? = nil) -> ItemModel<DataStore.View> {
        return DataStore.View.itemModel(dataID: dataId, behaviors: behavior, style: style)
    }
}

extension BaseItemModel where DataStore.View.Content == Never, DataStore.View.Style == Never {
    public static func view(dataId: AnyHashable, behavior: DataStore.View.Behaviors? = nil) -> ItemModel<DataStore.View> {
        return DataStore.View.itemModel(dataID: dataId, behaviors: behavior)
    }
}
