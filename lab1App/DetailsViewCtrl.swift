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
    var albumsCount = 0
    var tvc: TableViewController = TableViewController()
    var dtc: DetailsTableCtrl = DetailsTableCtrl()
    var wasDeleted = false
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var tableContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if(curIndex==albumsCount){
            self.navigationItem.prompt = "Nowy album"
        }else{
            let index = curIndex+1
            self.navigationItem.prompt = "Edycja rekordu \(index) z \(albumsCount)"
        }
    }
    
    override func willMove(toParentViewController: UIViewController?)
    {
        if !wasDeleted  {
            if toParentViewController == nil
            {
                tvc.albums[curIndex]["album"] = (dtc.albumField?.text)! as AnyObject
                tvc.albums[curIndex]["artist"] = (dtc.artistField.text)! as AnyObject
                tvc.albums[curIndex]["year"] = (dtc.yearField.text)! as AnyObject
                tvc.albums[curIndex]["genre"] = (dtc.genreField.text)! as AnyObject
                tvc.albums[curIndex]["tracks"] = (dtc.tracksField.text)! as AnyObject
                tvc.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteAlbum(_ sender: UIButton){
        tvc.albums.remove(at: curIndex)
        wasDeleted = true
        navigationController?.popToRootViewController(animated: true)
        tvc.tableView.reloadData()
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
            
            self.dtc = tvc
            tvc.tableView.reloadData()
        }
        
    }
}

