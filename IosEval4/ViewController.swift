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
        
        let orderByName = NSSortDescriptor(key: "name", ascending: true)
        let orderByDate = NSSortDescriptor(key: "date", ascending: true)
        
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
        
        // a transformer en push 
        let loginViewController =
        storyboard?.instantiateViewController(identifier: "depenseNavigationController")
        
        loginViewController?.modalPresentationStyle = .fullScreen
        present(loginViewController!, animated:true, completion: nil )
    }
}

extension ViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return depenseTab.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DepenseTableViewCell", for: indexPath) as? DepenseTableViewCell else {
            fatalError("no cell called")
        }
        
        let depense = depenseTab[indexPath.row]
       // cell.name
        //cell.value
        // cell.date
        
        return cell
    }
    
    
}
