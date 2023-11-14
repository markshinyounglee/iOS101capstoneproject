//
//  SearchResultController.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/11/23.
//

import UIKit

class SearchResultController: UIViewController {
    
    @IBOutlet weak var pastorNameLabel: UILabel!
    @IBOutlet weak var denominationLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedTime: String?
    var selectedPastor: String?
    var selectedDenomination: String?
    var selectedLocation: String?
    
    let defaultPastorString: String = "By Pastor..."
    let defaultDenominationString: String = "By Denomination..."
    let defaultLocationString: String = "By Location..."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.updateSearchFields()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func updateSearchFields()
    {
        var pastorDisplayText = selectedPastor ?? "error"
        var denominationDisplayText = selectedDenomination ?? "error"
        var locationDisplayText = selectedLocation ?? "error"
        
        if pastorDisplayText == defaultPastorString
        {
            pastorDisplayText = "---"
        }
        if denominationDisplayText == defaultDenominationString {
            denominationDisplayText = "---"
        }
        if locationDisplayText == defaultLocationString {
            locationDisplayText = "---"
        }
        
        pastorNameLabel.text = pastorDisplayText
        denominationLabel.text = denominationDisplayText
        locationLabel.text = locationDisplayText
        timeLabel.text = selectedTime ?? "error"
    }

}
