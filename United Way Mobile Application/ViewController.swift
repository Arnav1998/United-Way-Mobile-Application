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
    
    private let countyPickerDataSource = ["Alameda County","Alpine County","Amador County","Butte County","Calaveras County","Colusa County","Contra Costa County","Del Norte County","El Dorado County","Fresno County","Glenn County","Humboldt County","Imperial County","Inyo County","Kem County","Kings County","Lake County","Lassen County","Los Angeles County","Madera County","Marin County","Mariposa County","Mendocino County","Merced County","Modoc County","Mono County","Monterey County","Napa County","Nevada County","Orange County","Placer County","Plumas County","Riverside County","Sacramento County","San Benito County","San Bernardino County","San Diego County","San Francisco County","San Joaquin County","San Luis Obispo County","San Mateo County","Santa Barbara County","Santa Clara County","Santa Cruz County","Shasta County","Sierra County","Siskiyou County","Solano County","Sonoma County","Stanislaus County","Sutter County","Tehama County","Trinity County","Tulare County","Tuolumne County","Ventura County","Yolo County","Yuba County"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountyPickerView()
    }

    private func setupCountyPickerView() {
        self.countyPickerView.dataSource = self
        self.countyPickerView.delegate = self
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
        print(self.countyPickerDataSource[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countyPickerDataSource[row]
    }
    
}
