//
//  RoomDetailVC.swift
//  DirectoryApp
//
//  Created by Pradip on 22/10/22.
//

import UIKit

class RoomDetailVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var roomID: UILabel!
    @IBOutlet weak var roomMaxOccupancy: UILabel!
    @IBOutlet weak var roomOccupancy: UILabel!
    
    var room : Room?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 5.0
        roomID.text = room?.id
        roomOccupancy.text = room?.isOccupied ?? true ? "Full" : "Available"
        guard let maxVal = room?.maxOccupancy else {return}
        roomMaxOccupancy.text = "\(maxVal)"
        
        if room?.isOccupied ?? true {
            roomOccupancy.textColor = UIColor("C40202")
        }else{
            roomOccupancy.textColor = .green
        }

    }
    

}
