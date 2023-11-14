//
//  ViewController.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var WhatDayButton: UIButton!
    @IBOutlet weak var SearchButton: UIButton!
    
    @IBOutlet weak var pastorNameField: UITextField!
    @IBOutlet weak var denominationField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
    @IBOutlet weak var pickServiceHour: UIPickerView!
    
    let serviceTime: [String] = [
        "12am", "1am", "2am", "3am", "4am",
        "5am", "6am", "7am", "8am", "9am",
        "10am", "11am", "12pm", "1pm", "2pm",
        "3pm", "4pm", "5pm", "6pm", "7pm",
        "8pm", "9pm", "10pm", "11pm"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickServiceHour.delegate = self
        pickServiceHour.dataSource = self
    }
    
    // prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination  // access to destination view controller
        if let controller = destinationViewController as? SearchResultController {
            let selectedServiceTime = serviceTime[pickServiceHour.selectedRow(inComponent: 0)]
            
            controller.selectedTime = selectedServiceTime  // pass the desired service time
            print(selectedServiceTime)
            
            controller.selectedPastor = pastorNameField.text
            controller.selectedDenomination = denominationField.text
            controller.selectedLocation = locationField.text
        }
        else if segue.identifier == "DayIdentifier"  {
            destinationViewController.view.backgroundColor = .yellow
        }
            
        
    }
}

extension ViewController: UIPickerViewDelegate {
        func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.serviceTime[row]
    }
}

extension ViewController: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return serviceTime.count
    }
}

