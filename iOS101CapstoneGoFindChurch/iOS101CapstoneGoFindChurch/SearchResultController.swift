//
//  SearchResultController.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/11/23.
//

import UIKit
// import Nuke // for loading images

// may consider using web scraping to gather information
// on different churches available
// and use Google Map API for precise location

class SearchResultController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChurchViewCell", for: indexPath) as? ChurchViewCell else { return UITableViewCell()}
        let church = dataset[indexPath.row]
        
        var allHours:String = (church["hours"]!)[0]
        for i in 1...(church["hours"]!).count-1 {
            allHours.append(", " + (church["hours"]!)[i])
        }
        
        cell.nameLabel.text = (church["name"]!)[0]
        cell.denominationLabel.text = (church["denomination"]!)[0]
        cell.locationLabel.text = (church["location"]!)[0]
        cell.hoursLabel.text = allHours
        
        return cell
    }
    
    
    @IBOutlet weak var pastorNameLabel: UILabel!
    @IBOutlet weak var denominationLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // should fetch from database as JSON using Church in Church.swift
    // but for now relying on static data
    let dataset: [[String:[String]]] =
    [
        [
            "name": ["Jonathan Edwards"],
            "denomination": ["Presbyterian"],
            "location": ["Los Angeles, CA"],
            "hours": ["9am", "10am", "11am"]
          ],
          [
            "name": ["John Digory"],
            "denomination": ["Lutheran"],
            "location": ["San Francisco, CA"],
            "hours": ["9pm", "10pm", "11pm"]
          ],
          [
            "name": ["Percy Jones"],
            "denomination": ["Catholic"],
            "location": ["San Diego, CA"],
            "hours": ["6am", "9am", "5pm"]
          ]
    ]
    
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
        tableView.dataSource = self
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
        
        if [defaultPastorString, ""].contains(pastorDisplayText)
        {
            pastorDisplayText = "---"
        }
        if [defaultDenominationString, ""].contains(denominationDisplayText) {
            denominationDisplayText = "---"
        }
        if [defaultLocationString, ""].contains(locationDisplayText) {
            locationDisplayText = "---"
        }
        
        pastorNameLabel.text = pastorDisplayText
        denominationLabel.text = denominationDisplayText
        locationLabel.text = locationDisplayText
        timeLabel.text = selectedTime ?? "error"
    }
}
