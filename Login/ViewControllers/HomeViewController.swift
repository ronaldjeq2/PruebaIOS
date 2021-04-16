//
//  HomeViewController.swift
//  Login
//
//  Created by Ronald Jhair Estela Quintana on 4/14/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var emailString: String?
    
    
    @IBOutlet weak var emialReceived: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let strings = emailString{
            emialReceived.text = strings
        }
        // Do any additional setup after loading the view.
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
