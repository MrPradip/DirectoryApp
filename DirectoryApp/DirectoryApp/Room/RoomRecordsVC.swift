//
//  RoomRecordsVC.swift
//  DirectoryApp
//
//  Created by Pradip on 22/10/22.
//

import UIKit

class RoomRecordsVC: UIViewController {
    
    @IBOutlet weak var roomTableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    private var rooms: [Room]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomTableView.dataSource = self
        roomTableView.delegate = self
        indicator.startAnimating()
        NetworkManager().fetchRoomOccupancy{
            (rooms) in
            self.rooms = rooms
           
            DispatchQueue.main.async{
            self.indicator.stopAnimating()
              self.roomTableView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.hidesBottomBarWhenPushed = false
    }
    

}

extension RoomRecordsVC:  UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath) as! RoomCell
       let roomIndex = rooms?[indexPath.row]
        cell.txtRoomID.text = roomIndex?.id
        cell.txtRoomOccupancy.text = roomIndex?.isOccupied ?? false ? "Full" : "Available"
        if roomIndex?.isOccupied ?? true {
            cell.txtRoomOccupancy.textColor = UIColor("C40202")
        }else{
            cell.txtRoomOccupancy.textColor = .green
        }
           return cell
    }
}
extension RoomRecordsVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "RoomDetailVC") as! RoomDetailVC
        vc.room = rooms?[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
