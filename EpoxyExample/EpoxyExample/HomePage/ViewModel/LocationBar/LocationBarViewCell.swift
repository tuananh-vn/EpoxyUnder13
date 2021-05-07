//
//  LocationBarViewCell.swift
//  DiscoveryUI
//
//  Created by Dong Tuan Anh on 29/04/2021.
//

import UIKit

final class LocationBarViewCell: BaseXibView {
    
    @IBOutlet weak var shippingLocationLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var changeLocationButton: UIButton!
    
    private var didTap: (() -> Void)?
    var flowLayoutItemSize: CGSize? = LocationBarItemSize.size
    
    var containerShadowColor: UIColor = .uiNeutral {
        didSet {
            setupContainerView()
        }
    }
    
    // MARK: LifeStyle
    init(style: Style) {
        super.init(frame: .zero)
        containerShadowColor = style.shadowColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerView()
    }
    
    private func setupContainerView() {
        guard let view = containerView else { return }
        view.dropShadow(withCornerRadius: 8, color: containerShadowColor, alpha: 0.08, x: 0, y: 2, blur: 8, spread: 0)
        changeLocationButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
}

extension LocationBarViewCell: EpoxyableView {
    
    // MARK: Internal
    struct Style: Hashable {
        var shadowColor = UIColor.uiNeutral
    }
    
    struct Behaviors {
        var didTapChangeLocationButton: (() -> Void)?
    }
    
    struct Content: Equatable {
        var locationInfo: String?
    }
    
    
    func setContent(_ content: Content, animated: Bool) {
        shippingLocationLabel.text = content.locationInfo
    }
    
    func setBehaviors(_ behaviors: Behaviors?) {
        didTap = behaviors?.didTapChangeLocationButton
    }
    
    @objc
    private func handleTap() {
        didTap?()
    }
}

extension LocationBarViewCell.Style {
  static var uiNeutral: LocationBarViewCell.Style = .init(shadowColor: .uiNeutral)
}
