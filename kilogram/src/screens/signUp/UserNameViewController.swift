//
//  UserNameViewController.swift
//  kilogram
//
//  Created by Apple on 27/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class UserNameViewController: UIViewController {
    
    var name: String = ""
    
    @IBOutlet weak var errorLabel: ErrorLabel!
    @IBAction func onNameChange(_ sender: UITextField) {
        if(errorLabel.isVisible){
            errorLabel.clearError()
        }
        name = sender.text!
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        if(name.count > 0){
            performSegue(withIdentifier: "createPassword", sender: self)
        } else {
            errorLabel.displayError(error: "Name cant be empty")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let secondViewController = segue.destination as! createPasswordViewController
        
        // set a variable in the second view controller with the String to pass
        secondViewController.userName = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
