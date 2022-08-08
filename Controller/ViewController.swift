//
//  ViewController.swift
//  Laender
//
//  Created by Domenic Moran on 08.08.22.
//

import UIKit

//Ausgelesene JSON-Datein zum struct hinzugefügt und in var countries eingebunden
var countries: [CountryModel] = Bundle.main.decode(fileName: "data.json")

var selectedCountry: CountryModel?

var filteredCountries = countries

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //keyboard beim scrollen ausschalten
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 100
    }
    
    //Segue zum TableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let zielTVC = segue.destination as! CountryDetailTableVC
            zielTVC.country = selectedCountry
        }
            
    }
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = filteredCountries[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        cell.countryLabel.text = filteredCountries[indexPath.row].countryName
        cell.countryImage.image = UIImage(named: filteredCountries[indexPath.row].imageName)
        return cell
    }
    
    //MARK: - SearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchText = searchText.lowercased()
        if searchText != "" {
        filteredCountries = countries.filter({ country in
            if country.countryName.lowercased().contains(searchText){
                return true
            }
            return false
        })
        }
        else {
            filteredCountries = countries
        }
        self.tableView.reloadData()
    }

}

