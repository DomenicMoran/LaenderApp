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
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var country: CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Outlets werden mit den Daten verbunden
        countryLabel.text = country?.countryName
        countryImage.image = UIImage(named: country?.imageName ?? "DefaultImage")
        populationLabel.text = country?.inhabitants
        capitalLabel.text = country?.capital
        currencyLabel.text = country?.currency
        
        //Anpassung Image Border und Corner
        countryImage.layer.borderWidth = 1
        countryImage.layer.cornerRadius = 10
    }
}



