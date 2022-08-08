//
//  Bundel+Ext.swift
//  Laender
//
//  Created by Domenic Moran on 08.08.22.
//

import Foundation



extension Bundle {
    
    /// Diese Methode kann für das Laden einer JSON-Datei aus dem lokalen Bundle verwendet werden.
    ///
    /// Die Methode kann jede Art von JSON-Struktur in einen entsprechenden Swift-Datentypen dekodieren. Der gewünschteSwift-Datentyp wird dabei implizit aus dem Rückgabewert der Methode abgeleitet. Daraus folgt, dass beim Aufrufdieser Methode der Datentyp des Ausdruckes, welcher den Rückgabewert zugewiesen bekommt, eindeutig festgelegtsein muss.
    ///
    /// # Hinweis
    ///  Sollte es während dem Dekodieren der JSON-Datei zu einem unerwarteten Fehler kommen, so wird ein fatalErrorausgelöst. Somit ist eine weitere Programm-Ausführung nicht mehr möglich.
    ///
    /// # Verwendung
    ///  ```
    /// let countries: [Country] = Bundle.main.decode("countries.json")/Beispiel
    /// ```
    ///
    ///- Parameter fileName: Der Dateiname der JSON-Datei, die dekodiert werden soll. **Wichtig**: Die Endung.json muss mit angegeben werden.
    ///
    ///- Returns: Gibt die dekodierten JSON-Daten in dem angegebenen Swift-Datentyp zurück.
    func decode<T: Decodable>(fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError()
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        guard let objects = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError()
        }
        return objects
    }
}
