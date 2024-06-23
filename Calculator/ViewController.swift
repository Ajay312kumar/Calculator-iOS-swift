
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishTypingNumber: Bool = true
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("con't convert")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
      isFinishTypingNumber = true

        if let calcMethod = sender.currentTitle{
            if calcMethod == "+/-"{
                 displayValue *= -1
            }else if calcMethod == "AC"{
                displayLabel.text = "0"
            }else if calcMethod == "%"{
                displayValue *= 0.01
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            
            if isFinishTypingNumber{
                displayLabel.text = numValue
                isFinishTypingNumber = false
            }else{
                
                if numValue == "."{
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else{
                        fatalError("can't convert Display label text to Double!")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt{
                        return
                    }
                    
                }
                displayLabel.text = (displayLabel.text ?? "") + numValue
            }
            
        }
    
    }
}

