//
//  WhatDayController.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/11/23.
//

import UIKit


class WhatDayController: UIViewController {

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var CelebrationLabel: UILabel!
    @IBOutlet weak var whatMonthPicker: UIPickerView!
    @IBOutlet weak var whatDayPicker: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    
    let monthNames: [String] = [
        "January", "February", "March", "April", "May",
        "June", "July", "August", "September", "October",
        "November", "December"
    ]
    
    let dayName: [Int] = Array(1...31)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchDay()
    }
    
    func fetchDay() {
        /* sine http is an insecure connection, we
        should specifically add the domain to
         App Transport Security (ATS) Exception at
         info.plist
         
         ATS is a security feature offered by Apple
        */
        let url = URL(string: "http://calapi.inadiutorium.cz/api/v0/en/calendars/general-en/today")!
        
        // https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory
        let session = URLSession.shared.dataTask(with: url)
        {
            data, response, error in
            if let error = error {
                self.handleClientError( error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response as Any)
                return
            }
            guard let data = data, httpResponse.statusCode == 200 else
            {
                assertionFailure("🍍Invalid response status")
                return
            }
            
            do {
                let info = try JSONDecoder().decode(WhatDay.self, from: data)

                DispatchQueue.main.async { [weak self] in
                    self?.DateLabel.text = info.date
                    self?.CelebrationLabel.text = info.celebrations[0].title
                    // self?.view.backgroundColor = info.celebrations[0].colour as? UIColor
                    print("💧text update Done!")
                    print("\(info.date)")
                }
                
            } catch {
                print("❌ Error decoding JSON: \(error.localizedDescription)")
            }
        }
        session.resume()
    }
    
    func handleClientError(_ error: Any)
    {
        print("🍅Failed: \(error)")
    }
    
    func handleServerError(_ response: Any)
    {
        print("🍑Failed: \(response)")
    }
    
    
    // Decode this URL: http://calapi.inadiutorium.cz/api/v0/en/calendars/general-en/today

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
