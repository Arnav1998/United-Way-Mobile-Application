//
//  ViewController.swift
//  United Way Mobile Application
//
//  Created by ARNAV SINGHANIA on 11/10/19.
//  Copyright © 2019 ARNAV SINGHANIA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countyPickerView: UIPickerView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    //@IBOutlet weak var outputTextField: UITextView!
    private var selectedCountyCode:String?
    
    
    private let countyPickerDataSource = [("Alameda County","94501"),("Alpine County","95646"),("Amador County","95601"),("Butte County","95965"),("Calaveras County","95221"),("Colusa County","95912"),("Contra Costa County","94506"),("Del Norte County","95531"),("El Dorado County","95613"),("Fresno County","93210"),("Glenn County","95913"),("Humboldt County","95501"),("Imperial County","92222"),("Inyo County","92328"),("Kern County","93203"),("Kings County","93202"),("Lake County","95422"),("Lassen County","96009"),("Los Angeles County","90001"),("Madera County","93601"),("Marin County","94901"),("Mariposa County","93623"),("Mendocino County","95410"),("Merced County","93620"),("Modoc County","96006"),("Mono County","93512"),("Monterey County","93426"),("Napa County","94503"),("Nevada County","95713"),("Orange County","92864"),("Placer County","95602"),("Plumas County","95915"),("Riverside County","91752"),("Sacramento County","94203"),("San Benito County","95023"),("San Bernardino County","91701"),("San Diego County","91901"),("San Francisco County","94101"),("San Joaquin County","95201"),("San Luis Obispo County","93401"),("San Mateo County","94002"),("Santa Barbara County","93013"),("Santa Clara County","94022"),("Santa Cruz County","95001"),("Shasta County","96001"),("Sierra County","95910"),("Siskiyou County","95568"),("Solano County","94510"),("Sonoma County","94922"),("Stanislaus County","95307"),("Sutter County","95659"),("Tehama County","96021"),("Trinity County","95527"),("Tulare County","93201"),("Tuolumne County","95305"),("Ventura County","91319"),("Yolo County","95605"),("Yuba County","95692")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountyPickerView()
    }

    private func setupCountyPickerView() {
        self.countyPickerView.dataSource = self
        self.countyPickerView.delegate = self
        self.countyPickerView.selectRow(3, inComponent: 0, animated: true)
    }
    
    @IBAction func addPersonButtonPressed(_ sender: UIButton) {
        let label = UILabel(frame: self.ageLabel.frame)
        label.text = "Age:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        //incomplete
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        //perform query
        
        if let countyCode = self.selectedCountyCode {
            
            let url = URL(string: "https://bing.benefitkitchen.com/api/bing?address=\(countyCode)&persons[0][age]=\(ageTextField.text ?? "0")")!
            //create the session object
            let session = URLSession.shared
            
            //now create the URLRequest object using the url object
            let request = URLRequest(url: url)
            
            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    //create json object from data
                    //print(String(data:data, encoding: .utf8)!)

                    let expenses = try JSONDecoder().decode(ExpensesModel.self, from: data)
                    print(expenses)
                    
                    
//                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//
//                        //print(json)
//
//                        var jsonString = ""
//
//                        for (key, value) in json {
//                            jsonString.append(contentsOf: key)
//                            jsonString.append("=")
//                            jsonString.append(String(describing: value))
//                            jsonString.append(contentsOf: ", ")
//                        }
//
//                        DispatchQueue.main.async {
//                            //self.outputTextField.text = jsonString
//                        }
//
//                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            
            task.resume()
            
        }

    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countyPickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCountyCode = self.countyPickerDataSource[row].1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countyPickerDataSource[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: self.countyPickerDataSource[row].0, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
}
    

