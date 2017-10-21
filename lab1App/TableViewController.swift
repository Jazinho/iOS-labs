//
//  TableViewController.swift
//  lab1App
//
//  Created by Jan on 10/21/17.
//  Copyright © 2017 Użytkownik Gość. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var albums: [[String:AnyObject]] = [[:]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://isebi.net/albums.php")
        let urlSession = URLSession.shared
        let request : URLRequest = URLRequest(url: url!)
        let dataTask = urlSession.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if(error == nil){
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:AnyObject]]{
                        self.albums = json
                    }
                    print(self.albums)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch {
                    print("Sth wrong happend")
                }
            }
        })
        dataTask.resume()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let artistLabel = cell.viewWithTag(2) as! UILabel
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let yearLabel = cell.viewWithTag(3) as! UILabel
        
        if let albumName = albums[indexPath.row]["album"] {
            titleLabel.text = String (describing: albumName)
        } else {
            titleLabel.text = ""
        }
        if let artistName = albums[indexPath.row]["artist"] {
            artistLabel.text = String (describing: artistName)
        } else {
            artistLabel.text = ""
        }
        if let yearName = albums[indexPath.row]["year"] {
            yearLabel.text = String (describing: "(\(yearName))")
        } else {
            yearLabel.text = ""
        }
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */

}
