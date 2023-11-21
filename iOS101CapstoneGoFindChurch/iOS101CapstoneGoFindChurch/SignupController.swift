//
//  SignupController.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/20/23.
//

import UIKit

class SignupController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var affiliationField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var prompt1: UILabel!
    @IBOutlet weak var prompt2: UILabel!
    @IBOutlet weak var prompt3: UILabel!
    @IBOutlet weak var prompt4: UILabel!
    @IBOutlet weak var prompt5: UILabel!
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        hidePrompts()
    }
    
    let defaults = UserDefaults.standard
    
    @IBAction func didSignupComplete(_ sender: AnyObject) {
        if !fieldsAllFull() {
            showPrompts()
            return
        }
        
        let inputText: String = " \(nameField.text!), \(ageField.text!), \(affiliationField.text!), \(idField.text!), \(passwordField.text!)"
        let info = LoginInfo(inputText)
        saveLoginInformation(newInfo: info)
        
        let backToLogin = storyboard?.instantiateViewController(identifier: "LoginController") as! LoginController
        self.present(backToLogin, animated: true, completion:nil)
    }
    
    func fieldsAllFull() -> Bool {
        return nameField.text != "" && ageField.text != "" && affiliationField.text != "" && idField.text != "" && passwordField.text != ""
    }
    
    func hidePrompts() {
        prompt1.isHidden = true
        prompt2.isHidden = true
        prompt3.isHidden = true
        prompt4.isHidden = true
        prompt5.isHidden = true
    }
    
    func showPrompts() {
        prompt1.isHidden = false
        prompt2.isHidden = false
        prompt3.isHidden = false
        prompt4.isHidden = false
        prompt5.isHidden = false
    }
    
    func saveLoginInformation(newInfo: LoginInfo) {
        var logins = getLoginInformation()
        logins.append(newInfo)
        LoginInfo.save(logins)
    }
    
    func getLoginInformation() -> [LoginInfo] {
        LoginInfo.get(forKey: LoginInfo.codingKey)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
