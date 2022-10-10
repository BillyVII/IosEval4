//
//  ViewController.swift
//  IosEval4
//
//  Created by Student09 on 10/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var depenseTableView: UITableView! {
        didSet {
            depenseTableView.register(UINib(nibName: "DepenseTableViewCell", bundle: .main), forCellReuseIdentifier: "DepenseTableViewCell")
            
        }
    }
    
    var depenseTab = [Expense]()
    
    var manageObjectContext = AppDelegate.shared.persistentContainer.viewContext
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadExpenseFromCoreData()
    }

    func loadExpenseFromCoreData() {
        let request = Expense.fetchRequest()
        
        let orderByName = NSSortDescriptor(key: name, ascending: true)
        let orderByDate = NSSortDescriptor(key: date, ascending: true)
        
        do {
            depenseTab = try manageObjectContext.fetch(request)
        } catch {
            print("can't access Core Data")
        }
        
        depenseTableView.reloadData()
    
    }
    
    func saveData() {
        do {
            try manageObjectContext.save()
        }catch {
            fatalError("oops")
        }
    }

    @IBAction func addDepense(_ sender: Any) {
    }
}

