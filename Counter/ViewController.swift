//
//  ViewController.swift
//  Counter
//
//  Created by Irina Gubina on 18.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var zeroingButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var historyOfChanges: UITextView!
    @IBOutlet private weak var resultCounter: UILabel!
    private var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultCounter.text = "\(counterValue)"
        historyOfChanges.text = "История изменений:\n\n"
        
    }
    
    @IBAction private func counterDecreaseButton(_ sender: Any) {
        if counterValue > 0  {
            counterValue -= 1
            resultCounter.text = "\(counterValue)"
            addToHistory("значение изменено на -1")
        }
        else {
            addToHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func counterIncreaseButton(_ sender: Any) {
        counterValue += 1
        resultCounter.text = "\(counterValue)"
        addToHistory("значение изменено на +1")
    }
    @IBAction private func zeroingCounterButton(_ sender: Any) {
        counterValue = 0
        resultCounter.text = "\(counterValue)"
        addToHistory("значение сброшено")
        
    }
    private func addToHistory(_ text: String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        let newEntry = "[\(timestamp)]: \(text)\n"
        historyOfChanges.text.append(newEntry)
    }
    
    
}

