//
//  ViewController.swift
//  DirectoryApp
//
//  Created by Pradip on 21/10/22.
//

import UIKit

class EmployeeRecordsVC: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    private var employees: [Employee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        indicator.startAnimating()
        NetworkManager().fetchEmployeeRecords{
            (employees) in
            self.employees = employees
            DispatchQueue.main.async{
                self.indicator.stopAnimating()
              self.employeeTableView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.hidesBottomBarWhenPushed = false
    }

}

extension EmployeeRecordsVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "EmpCell", for: indexPath) as! EmpCell
        let empIndex = employees?[indexPath.row]
        cell.txtEmpID.text = empIndex?.id
        cell.txtEmpName.text = (empIndex?.firstName ?? "") + " " + (empIndex?.lastName ?? "")
        cell.txtJobTitle.text =  empIndex?.jobtitle
            return cell
    }
}
extension EmployeeRecordsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "EmployeeDetailVC") as! EmployeeDetailVC
        vc.emp = employees?[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
        //UITableView.automaticDimension
    }
}

