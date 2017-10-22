//
//  DetailsViewCtrl.swift
//  lab1App
//
//  Created by Użytkownik Gość on 10.10.2017.
//  Copyright © 2017 Użytkownik Gość. All rights reserved.
//

import UIKit

class DetailsViewCtrl: UIViewController {
    var album: [String:AnyObject] = [:]
    var curIndex = 0
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var tableContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let g = String(describing: album["genre"])
        print("Album genre is: \(g)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toTable"){
            let tvc = segue.destination as! DetailsTableCtrl
            
            if let titleName = self.album["album"]{
                tvc.titleName = String(describing: titleName)
            } else {
                tvc.titleName = ""
            }
            if let artistName = self.album["artist"]{
                tvc.artistName = String(describing: artistName)
            } else {
                tvc.artistName = ""
            }
            if let yearName = self.album["year"]{
                tvc.yearName = String(describing: yearName)
            } else {
                tvc.yearName = ""
            }
            if let genreName = self.album["genre"]{
                tvc.genreName = String(describing: genreName)
            } else {
                tvc.genreName = ""
            }
            if let tracksName = self.album["tracks"]{
                tvc.tracksName = String(describing: tracksName)
            } else {
                tvc.tracksName = ""
            }
            
            tvc.tableView.reloadData()
        }
        
        
        // Pass the selected object to the new view controller.
    }
}

