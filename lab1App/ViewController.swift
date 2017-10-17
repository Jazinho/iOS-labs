//
//  ViewController.swift
//  lab1App
//
//  Created by Użytkownik Gość on 10.10.2017.
//  Copyright © 2017 Użytkownik Gość. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var tracksField: UITextField!
    @IBOutlet weak var albumNumberLabel: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var albums : [[String: Any]] = [[:]]
    var curIdx = 0
    
    func updateView(){
        if albums.count == 0 {
            artistField.text = ""
            titleField.text = ""
            genreField.text = ""
            yearField.text = ""
            tracksField.text = ""
            albumNumberLabel.text = "No tracks"
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        } else {
            artistField.text = String (describing: (albums[curIdx]["artist"])!)
            titleField.text = String (describing: (albums[curIdx]["album"])!)
            genreField.text = String (describing: (albums[curIdx]["genre"])!)
            yearField.text = String (describing: (albums[curIdx]["year"])!)
            tracksField.text = String (describing: (albums[curIdx]["tracks"])!)
            
            albumNumberLabel.text = "Album \(curIdx+1) z \(albums.count)"
            
            switch curIdx {
            case albums.count-1:
                nextButton.isEnabled = false
            case 0:
                prevButton.isEnabled = false
            default:
                nextButton.isEnabled = true
                prevButton.isEnabled = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://isebi.net/albums.php")
        let urlSession = URLSession.shared
        let request : URLRequest = URLRequest(url: url!)
        let dataTask = urlSession.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if(error == nil){
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]{
                            self.albums = json
                    }
                    print(self.albums)
                    DispatchQueue.main.async {
                        self.updateView()
                    }
                }catch {
                    print("Sth wrong happend")
                }
            }
        })
        dataTask.resume()
        saveButton.isEnabled=false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextAlbum(_ sender: UIButton) {
        curIdx = curIdx + 1
        updateView()
    }
    
    @IBAction func prevAlbum(_ sender: UIButton) {
        curIdx = curIdx - 1
        updateView()
    }
    
    @IBAction func updateAlbum(_ sender: UIButton) {
        albums[curIdx]["album"] = titleField.text!
        albums[curIdx]["artist"] = artistField.text!
        albums[curIdx]["genre"] = genreField.text!
        albums[curIdx]["year"] = yearField.text!
        albums[curIdx]["tracks"] = tracksField.text!
        saveButton.isEnabled = false
    }
    
    @IBAction func editedField(_ sender: UITextField) {
        saveButton.isEnabled=true
    }
    
    @IBAction func deleteAlbum(_ sender: UIButton) {
        albums.remove(at: curIdx)
        if(curIdx==albums.count){
            curIdx = curIdx-1
        }
        if albums.count == 0 {
            deleteButton.isEnabled = false
        }
        updateView()
    }
    
    
}

