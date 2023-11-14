//
//  serviceHourMap.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/13/23.
//


/*
 // cannot delegate because ServiceHourMap is not a
 view controller class
 */

/*
import Foundation
import UIKit

class ServiceHourMap {
    
    // list all the options for the service hours
    let serviceTimeMap: [Int:String] = [
        0:"12am",
        1:"1am",
        2:"2am",
        3:"3am",
        4:"4am",
        5:"5am",
        6:"6am",
        7:"7am",
        8:"8am",
        9:"9am",
        10:"10am",
        11:"11am",
        12:"12pm",
        13:"1pm",
        14:"2pm",
        15:"3pm",
        16:"4pm",
        17:"5pm",
        18:"6pm",
        19:"7pm",
        20:"8pm",
        21:"9pm",
        22:"10pm",
        23:"11pm"
    ]
    
    // allow us to select specific time
    var select = [String]()
}

extension ServiceHourMap: UIPickerViewDelegate {
        func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.serviceTimeMap[component]
    }
}

extension ServiceHourMap: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return serviceTimeMap.count
    }
}
*/
