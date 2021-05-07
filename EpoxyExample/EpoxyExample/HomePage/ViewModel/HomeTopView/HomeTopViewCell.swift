//
//  HomeTopViewCell.swift
//  DiscoveryUI
//
//  Created by Dong Tuan Anh on 29/04/2021.
//

import UIKit

class HomeTopViewCell: BaseXibView {
    @IBOutlet weak var topImageView: UIImageView!
    
    var flowLayoutItemSize: CGSize? = HomeHeaderItemSize.size
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let image = VSBundle.getImage(named: "bg_home_top")
        topImageView.image = image?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    
}

extension HomeTopViewCell {
    override func fillColor() {
        super.fillColor()
        theme_backgroundColor = VSThemesColor.Home.primary
    }
}

extension HomeTopViewCell: EpoxyableView {
}
