//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Скориков on 06.01.2025.
//

import UIKit

class ViewController: UIViewController {
    // Переменная для хранения текущего значения счетчика
    var counter = 0
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    @IBOutlet weak var resetCounter: UIButton!
    @IBOutlet weak var decreaseCounter: UIButton!
    @IBOutlet weak var increaseCounter: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "\(counter)"
        historyTextView.text = "Истотрия изменения:"
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        historyTextView.isSelectable = false
        
    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        addHistoryEntry(change: "+1")
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "\(counter)"
            addHistoryEntry(change: "-1")
        } else {
            addHistoryEntry(change: "Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
    counter = 0
        counterLabel.text = "\(counter)"
        addHistoryEntry(change: "Значение сброшено")
    }
    
    
    private func addHistoryEntry(change: String) {
        let currentDate = dateFormatter.string(from: Date())
        let newEntry = "\n[\(currentDate)]: \(change)"
        historyTextView.text += newEntry
        //Автопрокрутка к последней записи
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }


}
