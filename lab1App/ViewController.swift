//
//  ViewController.swift
//  lab1App
//
//  Created by Użytkownik Gość on 10.10.2017.
//  Copyright © 2017 Użytkownik Gość. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = URL(string: "http://borg.kis.agh.edu.pl/~sebi/albums.php")
        
        let urlSession = URLSession.shared
        
        var request : URLRequest = URLRequest(url: url!)
        
        let dataTask = urlSession.dataTask(with: request, completionHandler: handleData){
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleData(data: Data?, response: URLResponse?, error: Error?) -> Void{
        
        
    }
    

}

