//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Скориков on 06.01.2025.
//

import UIKit

final class ViewController: UIViewController {
    // Переменная для хранения текущего значения счетчика
    private var counter = 0
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "\(counter)"
        historyTextView.text = "Истотрия изменения:"
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        historyTextView.isSelectable = false
    }
    
    private func addHistoryEntry(change: String) {
        let currentDate = dateFormatter.string(from: Date())
        let newEntry = "\n[\(currentDate)]: \(change)"
        historyTextView.text += newEntry
        //Автопрокрутка к последней записи
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    @IBOutlet weak private var resetCounterButton: UIButton!
    @IBOutlet weak private var decreaseCounterButton: UIButton!
    @IBOutlet weak private var increaseCounterButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var counterLabel: UILabel!
    
    @IBAction private func increaseCounterButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        addHistoryEntry(change: "Значение изменено на +1")
    }
    
    @IBAction private func decreaseCounterButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "\(counter)"
            addHistoryEntry(change: "Значение изменено на -1")
        } else {
            addHistoryEntry(change: "Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction private func resetCounterButton(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        addHistoryEntry(change: "Значение сброшено")
    }
}
