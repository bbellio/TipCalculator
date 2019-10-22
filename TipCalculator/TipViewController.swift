//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Bethany Wride on 10/21/19.
//  Copyright © 2019 Bethany Bellio. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

// MARK: - Outlets

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipMonetaryAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var totalMonetaryAmountLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setUpViews()
    }
    
// MARK: - Actions
    @IBAction func darkModeSwitch(_ sender: Any) {
    }
    @IBAction func resetButton(_ sender: Any) {
        billAmountTextField.text = ""
        tipMonetaryAmountLabel.text = "$0.00"
        totalMonetaryAmountLabel.text = "$0.00"
        tipPercentSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let billAmountText = billAmountTextField.text,
            let billAmount = Double(billAmountText) else { return }
        calculateTipFrom(billAmount: billAmount)
    }
    
// MARK: - Custom Methods
    func setUpViews() {
        self.topView.backgroundColor = .topViewColor
        self.bottomView.backgroundColor = .bottomViewColor
    }
    
    func calculateTipFrom(billAmount: Double) {
        guard let billAmountText = billAmountTextField.text,
            let billAmount = Double(billAmountText) else { return }
        if tipPercentSegmentedControl.selectedSegmentIndex == 0 {
            let tipAmount = billAmount * 0.15
            let totalAmount = tipAmount + billAmount
            let roundedTip = (100 * tipAmount).rounded() / 100
            let roundedTotal = (100 * totalAmount).rounded() / 100
            tipMonetaryAmountLabel.text = "$\(roundedTip)"
            totalMonetaryAmountLabel.text = "$\(roundedTotal)"
        } else if tipPercentSegmentedControl.selectedSegmentIndex == 1 {
            let tipAmount = billAmount * 0.18
            let totalAmount = tipAmount + billAmount
            let roundedTip = (100 * tipAmount).rounded() / 100
            let roundedTotal = (100 * totalAmount).rounded() / 100
            tipMonetaryAmountLabel.text = "$\(roundedTip)"
            totalMonetaryAmountLabel.text = "$\(roundedTotal)"
        } else {
            let tipAmount = billAmount * 0.20
            let totalAmount = tipAmount + billAmount
            let roundedTip = (100 * tipAmount).rounded() / 100
            let roundedTotal = (100 * totalAmount).rounded() / 100
            tipMonetaryAmountLabel.text = "$\(roundedTip)"
            totalMonetaryAmountLabel.text = "$\(roundedTotal)"
        }
    }
}
