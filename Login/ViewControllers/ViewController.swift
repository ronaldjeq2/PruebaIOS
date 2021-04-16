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
        guard let url =  URL(string:"https://api-qa.kambista.com/login")
        else{
            return
        }
        
        //### This is a little bit simplified. You may need to escape `username` and `password` when they can contain some special characters...
        let body = "username=\(username)&password=\(password)"
        let finalBody = body.data(using: .utf8)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            print(response as Any)
            if let error = error {
                print(error)
                return
            }
            guard let data = data else{
                return
            }
            print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "segue", sender: self)
             }
        }.resume()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! HomeViewController
        
        destination.emailString = userTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

