//
//  LoginController.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/20/23.
//

import UIKit
import AuthenticationServices

class LoginController: UIViewController {

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLogin()
    }
    
    
    func setupLogin() {
        
    }
    
    @IBAction func didLoginClick(_ sender: Any) {
        
    }
    
    @IBAction func didSignupClick(_ sender: Any) {
        
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
