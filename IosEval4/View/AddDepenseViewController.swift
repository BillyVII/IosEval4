//
//  AddDepenseViewController.swift
//  IosEval4
//
//  Created by Student09 on 10/10/2022.
//

import UIKit

class AddDepenseViewController: UIViewController {
    let manageObjectContext = AppDelegate.shared.persistentContainer.viewContext
    let context = ViewController()

    @IBOutlet weak var expenseEditText: UITextField!
    @IBOutlet weak var expenseValue: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func AddExpense(_ sender: Any) {
        let newExpense = Expense(context:manageObjectContext)
        newExpense.name = expenseEditText.text
        if let floatValue = Float(expenseValue.text!) {
            newExpense.value = floatValue
        } else {
            print("no text find")
        }
//        do {
//            try manageObjectContext.save()
//        } catch {
//            print("no object")
//        }
        
        context.saveData()
        context.loadExpenseFromCoreData()
        
        
    }
    
}
