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
    
    var albums : [[String: String]] = [[:]]
    var curIdx = 0
    
    func updateView(){
        artistField.text = String (describing: albums[curIdx]["artist"])
        titleField.text = String (describing: albums[curIdx]["title"])
        genreField.text = String (describing: albums[curIdx]["genre"])
        yearField.text = String (describing: albums[curIdx]["year"])
        tracksField.text = String (describing: albums[curIdx]["tracks"])
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
                    print(data!)
                    print("Sroman")
//                    self.albums
                    var json = try JSONSerialization.jsonObject(with: data!, options: []) //as! [[String:String]]
                    print(json)
//                    print(self.albums)
                    
//                    DispatchQueue.main.async {
//                        self.updateView()
//                    }
                }catch {
                    print("Sth wrong happend")
                }
            }
        })
        
        dataTask.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

