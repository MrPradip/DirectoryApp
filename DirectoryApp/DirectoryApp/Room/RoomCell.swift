//
//  RoomCell.swift
//  DirectoryApp
//
//  Created by SHG Technologies on 22/10/22.
//

import UIKit

class RoomCell: UITableViewCell {
    
    @IBOutlet weak var lblRoomID: UILabel!
    @IBOutlet weak var lblRoomOccupancy: UILabel!
    
    @IBOutlet weak var txtRoomID: UILabel!
    @IBOutlet weak var txtRoomOccupancy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
