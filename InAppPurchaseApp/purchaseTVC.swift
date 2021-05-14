//
//  purchaseTVC.swift
//  InAppPurchaseApp
//
//  Created by Mahmut MERCAN on 14.05.2021.
//

import UIKit

class purchaseTVC: UITableViewCell {
    
    static let identifier: String = "purchaseTVC"

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var confirmImageView: UIImageView!
    @IBOutlet weak var purchaseType: UILabel!
    @IBOutlet weak var purchasePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.container.layer.cornerRadius = 12

        if selected {
            self.container.layer.borderWidth = 2
            self.container.layer.borderColor = UIColor.systemPurple.cgColor
            confirmImageView.image = UIImage(systemName: "checkmark.circle.fill")
            confirmImageView.image?.withTintColor(UIColor(red: 143, green: 103, blue: 255, alpha: 100))
        } else {
            self.container.layer.borderWidth = 0
            confirmImageView.image = UIImage(systemName: "circle")
        }
    }

    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    func configureCell(type: String, price: String) {
        purchaseType.text = type
        purchasePrice.text = price
    }

}
