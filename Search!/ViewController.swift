//
//  ViewController.swift
//  Search!
//
//  Created by Hitoki Kidahashi on 4/2/19.
//  Copyright © 2019 Hitoki Kidahashi. All rights reserved.
//

import UIKit

struct Items {
   
    let name: String
    let time: String
   
}


class ViewController: UIViewController {

    
    //@IBOutlet var textInput: UITextField!
    
    @IBOutlet var textInput: UISearchBar!
    
   

    var dataAsString: String = ""

    
    @IBAction func searchButtonTapped(_ sender: Any) {

        let ComName = "iMacJosephBakken"
        let UDPURL = "https://itemsearchapp.herokuapp.com/CL/" + ComName

        guard let UDPurl = URL(string: UDPURL) else{
            return
        }
       
        URLSession.shared.dataTask(with: UDPurl){(data,response,err) in

            guard let data = data else {return}
            let stringed_data = String(data:data, encoding: .utf8) ?? "ERR"
            if(self.isStringEmpty(stringValue: stringed_data)){
                print("Error")
                
                return
            }
             else if(stringed_data.count < 20){
                print("Disconnection")
               
                return
            }
            else{
                print("Connected")
                
                return

            }


        }.resume()

        







        let jsonUrlString = "https://itemsearchapp.herokuapp.com/Search/0/" + textInput.text!
        //let jsonUrlString = "https://itemsearchapp.herokuapp.com/Search/0/Pen"
        guard let url = URL(string: jsonUrlString) else{
            return
        }
        print("going to URLSesh")
        var returnedDataFromSearch : String = ""
        let urlsesh = URLSession.shared.dataTask(with: url){(data,response,err) in

            print(err ?? "ERR")

            guard let data = data else {return}
            
           
            returnedDataFromSearch = String(data:data, encoding: .utf8) ?? "ERR"
            
        }
        urlsesh.resume()
        while returnedDataFromSearch.count != 10{
            if returnedDataFromSearch.count >= 10{
                break
            }
        }
        performSegue(withIdentifier: "SearchTransitition", sender: nil)
    }
    func isStringEmpty( stringValue:String) -> Bool
    {
        var returnValue = false
        
        if stringValue.isEmpty  == true
        {
            returnValue = true
            return returnValue
        }
        
        
        
        return returnValue
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

