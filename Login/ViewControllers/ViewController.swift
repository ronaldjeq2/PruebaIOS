//
//  ViewController.swift
//  Login
//
//  Created by Ronald Jhair Estela Quintana on 4/14/21.
//

import UIKit
struct ResponseModel: Codable {
    var username: String
    var password: String
}
class ViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginFunction(_ sender: UIButton) {
        let username = userTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let url =  "https://api-qa.kambista.com/login"
        let requestUrl = NSURL(string: url)
        var request = URLRequest(url: requestUrl as! URL)
        
        let body =  [
            "user":username,
            "password":password
        ]
        
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body
        )
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print("Error data:\n \(error)")
            } else if let data = data {
                print("Response data:\n \(data)")
            } else {
                print("Error")
            }
        }
        task.resume()
        
    }
    
}

