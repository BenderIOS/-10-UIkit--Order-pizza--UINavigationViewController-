//
//  SecondViewController.swift
//  #10 dz UINavigationViewController
//
//  Created by Andrew on 20/04/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var pepperoniImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "1": guard let destination = segue.destination as? ThirdVC else {return}
            destination.imageSend = UIImage(named: "peperoni")!
            destination.namePizza = "Pizza Peperoni"
            destination.total = 10

        case "2": guard let destination = segue.destination as? ThirdVC else {return}
            destination.imageSend = UIImage(named: "meet")!
            destination.namePizza = "Pizza Cheese with meet"
            destination.total = 15
        default: break
        }
    }
}
