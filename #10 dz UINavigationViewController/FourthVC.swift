//
//  FourthVC.swift
//  #10 dz UINavigationViewController
//
//  Created by Andrew on 20/04/23.
//

import UIKit

class FourthVC: UIViewController {
    var compositionArray: Array = [String]()
    var totalString: String?
    
    @IBOutlet weak var payButton: UIButton!
    
    @IBOutlet weak var payOnlineSwitch: UISwitch!
    @IBOutlet weak var payCashSwitch: UISwitch!
    @IBOutlet private weak var orderLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Добавляет 10 строк в лэйбле
        orderLabel.numberOfLines = 10
        
        orderLabel.text = ""
        
        for (index, value) in compositionArray.enumerated() {
            orderLabel.text = orderLabel.text! + "\n\(index+1). \(value)"
        }

        orderLabel.sizeToFit()
        totalLabel.text = totalString
        payButton.addTarget(self, action: #selector(payButtonPress(param: )), for: .touchUpInside)

    }
    @IBAction func payOnlineAction(_ sender: Any) {
        if payOnlineSwitch.isOn {
            payCashSwitch.isOn = false
            payButton.setTitle("PAY", for: .normal)
        } else { payCashSwitch.isOn = true
            payButton.setTitle("ORDER", for: .normal)
        }
    }
    
    @IBAction func payCashAction(_ sender: Any) {
        if payCashSwitch.isOn { payOnlineSwitch.isOn = false
            payButton.setTitle("ORDER", for: .normal)
        } else {
            payOnlineSwitch.isOn = true
            payButton.setTitle("PAY", for: .normal)
        }
    }
    
    @objc func payButtonPress(param: UIButton) {
        if payCashSwitch.isOn {
            let alert = UIAlertController(title: "Thank's for order", message: "Courier leaving soon", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Order has been paid", message: "Courier leaving soon", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    @IBAction func feedbackButton(_ sender: Any) {
        let alert = UIAlertController(title: "Problems?", message: "Leave messege below. We will cintact", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        alert.addTextField()
        present(alert, animated: true)
    }
}
