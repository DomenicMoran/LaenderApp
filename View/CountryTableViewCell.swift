//
//  CountryTableViewCell.swift
//  Laender
//
//  Created by Domenic Moran on 08.08.22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
//MARK: - Outlets TableView
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //Image(Flagge) wird abgerundet und bekommt ein Border
        countryImage.layer.cornerRadius = countryImage.frame.width / 2
        countryImage.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
