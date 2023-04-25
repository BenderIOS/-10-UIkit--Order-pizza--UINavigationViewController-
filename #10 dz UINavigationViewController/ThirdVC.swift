//
//  ThirdVC.swift
//  #10 dz UINavigationViewController
//
//  Created by Andrew on 20/04/23.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var imageOrder: UIImageView!
    var imageSend = UIImage()
    var namePizza: String?
    
    @IBOutlet weak var oneSwitch: UISwitch!
    @IBOutlet weak var twoSwitch: UISwitch!
    @IBOutlet weak var threeSwitch: UISwitch!
    @IBOutlet weak var fourSwitch: UISwitch!
    
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TotalLabel.text = String(total) + "$"
        
        imageOrder.image = imageSend
      
        oneSwitch.addTarget(self, action: #selector(oneSwitchMethod(param: )), for: .valueChanged)
        twoSwitch.addTarget(self, action: #selector(twoSwitchMethod(param: )), for: .valueChanged)
        threeSwitch.addTarget(self, action: #selector(threeSwitchMethod(param: )), for: .valueChanged)
        fourSwitch.addTarget(self, action: #selector(fourSwitchMethod(param: )), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let distanation = segue.destination as? FourthVC else {return}
        distanation.compositionArray.append(namePizza ?? "Nil")
        distanation.totalString = "TOTAL: " + (TotalLabel.text ?? " ")
        
        if oneSwitch.isOn { distanation.compositionArray.append(" with Mozzarella Cheese")}
        if twoSwitch.isOn {distanation.compositionArray.append("with Mushrooms")}
        if threeSwitch.isOn {distanation.compositionArray.append("with Ham")}
        if fourSwitch.isOn {distanation.compositionArray.append("with Pepper Chilli")}
    }
    
    @objc func oneSwitchMethod (param: UISwitch) {
        choiceMethod(ingredient: .cheese)
    }
    @objc func twoSwitchMethod (param: UISwitch) {
        choiceMethod(ingredient: .mushrooms)
    }
    @objc func threeSwitchMethod (param: UISwitch) {
        choiceMethod(ingredient: .ham)
    }
    @objc func fourSwitchMethod (param: UISwitch) {
        choiceMethod(ingredient: .pepper)
    }
 
    enum ingredientsEnum {
        case cheese
        case mushrooms
        case ham
        case pepper
    }
    
    func choiceMethod(ingredient: ingredientsEnum) {
        switch ingredient {
        case .cheese: if oneSwitch.isOn { total += 2} else {total -= 2}
        case .mushrooms: if twoSwitch.isOn {total += 3} else {total -= 3}
        case .ham: if threeSwitch.isOn { total += 4 } else { total -= 4}
        case .pepper: if fourSwitch.isOn { total += 5 } else { total -= 5}
        }
        TotalLabel.text = String(total) + "$"
    }
}
