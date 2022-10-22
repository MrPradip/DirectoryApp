//
//  EmpCell.swift
//  DirectoryApp
//
//  Created by SHG Technologies on 22/10/22.
//

import UIKit

class EmpCell: UITableViewCell {
    
    @IBOutlet weak var lblEmpID: UILabel!
    @IBOutlet weak var lblEmpName: UILabel!
    @IBOutlet weak var lblEmpJobTitle: UILabel!
    
    @IBOutlet weak var txtEmpID: UILabel!
    @IBOutlet weak var txtEmpName: UILabel!
    @IBOutlet weak var txtJobTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
