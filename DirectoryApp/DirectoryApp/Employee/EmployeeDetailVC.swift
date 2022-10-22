//
//  EmployeeDetailVC.swift
//  DirectoryApp
//
//  Created by Pradip on 22/10/22.
//

import UIKit

class EmployeeDetailVC: UIViewController {
    
    @IBOutlet weak var empAvatorImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var empID: UILabel!
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empJobTitle: UILabel!
    @IBOutlet weak var empEmail: UILabel!
    @IBOutlet weak var empFavColor: UILabel!
    
    var emp: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 5.0
        guard let imageUrl = emp?.avatar else { return }
        empAvatorImageView.loadFrom(URLAddress: imageUrl)
        empID.text = emp?.id
        empName.text = (emp?.firstName ?? "") + " " + (emp?.lastName ?? "")
        empJobTitle.text = emp?.jobtitle
        empEmail.text = emp?.email
        empFavColor.text = emp?.favouriteColor
    }
    

}
