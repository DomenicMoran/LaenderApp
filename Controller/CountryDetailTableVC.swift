//
//  CountryDetailTableVC.swift
//  Laender
//
//  Created by Domenic Moran on 08.08.22.
//

import UIKit

class CountryDetailTableVC: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var einwohnerLabel: UILabel!
    @IBOutlet weak var stadtLabel: UILabel!
    @IBOutlet weak var waehrungLabel: UILabel!
    
    var country: CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Outlets werden mit den Daten verbunden
        countryLabel.text = country?.countryName
        countryImage.image = UIImage(named: country?.imageName ?? "DefaultImage")
        einwohnerLabel.text = country?.inhabitants
        stadtLabel.text = country?.capital
        waehrungLabel.text = country?.currency
        
        //Anpassung Image Border und Corner
        countryImage.layer.borderWidth = 1
        countryImage.layer.cornerRadius = 10
    }
}



