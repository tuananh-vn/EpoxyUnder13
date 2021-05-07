// Created by Tyler Hedrick on 1/20/21.
// Copyright © 2021 Airbnb Inc. All rights reserved.

import UIKit
import EpoxyCooked

final class FlowLayoutViewController: CollectionViewController {

  // MARK: Lifecycle

  public init() {
    super.init(layout: HomeStickyLayout())
    setSections([redSection, orangeSection], animated: false)
  }

  // MARK: Internal

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.alwaysBounceVertical = true
  }

  // MARK: Private

  private enum DataID {
    enum Section {
      case red, orange, blue
    }

    enum Red {
      case red1, red2
    }

    enum Orange {
      case orange1
    }

    enum Blue {
      case header, item, footer
    }
  }

  private var redSection: SectionModel {
    // Example of setting insets, item spacing, and line spacing for the section
    SectionModel(
      dataID: DataID.Section.red,
        items: [
            HomeTopViewItemModel.view(dataId: DataID.Red.red1)
        ]).flowLayoutItemSize(HomeFirstItemSize.size)
  }

  private var orangeSection: SectionModel {
    // Example of setting an item size for the entire section
    SectionModel(
      dataID: DataID.Section.orange,
      items: [
        LocationBarItemModel.view(dataId: DataID.Orange.orange1, data: LocationBarDataStore(from: .HAN), style: LocationBarViewCell.Style(shadowColor: .uiNeutral), behavior: LocationBarViewCell.Behaviors(didTapChangeLocationButton: {
            
        })).flowLayoutItemSize(LocationBarItemSize.size)
      ])
  }

  private var blueSection: SectionModel {
    // Example of setting an item size for the entire section
    SectionModel(
      dataID: DataID.Section.blue,
      items: [
        ColorView.itemModel(
          dataID: DataID.Blue.item,
          style: .green)
          .flowLayoutItemSize(.init(width: 200, height: 50))
      ])
      .supplementaryItems(ofKind: UICollectionView.elementKindSectionHeader, [
        ColorView.supplementaryItemModel(
          dataID: DataID.Blue.header,
          style: .yellow),
      ])
      // Width is ignored for headers
      .flowLayoutHeaderReferenceSize(.init(width: 0, height: 30))
      .supplementaryItems(ofKind: UICollectionView.elementKindSectionFooter, [
        ColorView.supplementaryItemModel(
          dataID: DataID.Blue.footer,
          style: .blue),
      ])
      // Width is ignored for footers
      .flowLayoutFooterReferenceSize(.init(width: 0, height: 60))
  }

}
