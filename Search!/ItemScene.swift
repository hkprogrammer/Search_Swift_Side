//
//  ItemScene.swift
//  Search!
//
//  Created by Hitoki Kidahashi on 4/15/19.
//  Copyright © 2019 Hitoki Kidahashi. All rights reserved.
//

import UIKit

class ItemScene: UIViewController{

    
    @IBOutlet var TableView: UITableView!
    
    let baseURLS : String = "https://itemsearchapp.herokuapp.com/"
    
    var videos: [Video] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos = createArray()
        
        //TableView.delegate = self
        //TableView.dataSource = self
    }
    
    @IBAction func refresh(_ sender: Any) {
        videos = createArray()
        
    }
    func createArray() -> [Video]{
        var tempVideos : [Video] = []
        
        
        
        //let _ : Int = 2
        
        
        
        
        //var imageArr : [UIImage] = [UIImage(named: "Pen-Image")!,UIImage(named: "Pen-Image")!]
        
        
        //var titles : [String] = ["Red Pen", "Mechanical Pen"]
        var titles : [String] = []
        //var prices : [String] = ["4.99","5.99"]
        var prices : [String] = []
        
        //Title part starts
        //Title Literator Requestor(Main Requestors)
        var mainInterator : Int = 0
        var titleIterator : Int = 0
        let titleTUrl = URL(string: baseURLS + "titleNum")
        
        let session = URLSession(configuration: .default)
        
        let titleLiteratorRequests = session.dataTask(with: titleTUrl!){(data,response,error) in
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    guard let data = data else {return}
                    let stringed_data = String(data:data, encoding: .utf8) ?? "ERR"
                    mainInterator = Int(stringed_data)!
                    titleIterator = Int(stringed_data)!
                }
                else {
                    print("No response from server")
                    
                }
            }
            
            
            
            
        }
        titleLiteratorRequests.resume()
        
        
    
        //Title Requestor
        
        let titletUrl : String = baseURLS + "titleNum/"
        
        while titleIterator == 0{
            
            if(titleIterator > 0){
                break
            }
        }
        
        var s = 0
        for i in 1...titleIterator{
            s = s + 1
            let tURL = URL(string: titletUrl + String(i))
            let session = URLSession(configuration: .default)
            let titleRequestor = session.dataTask(with: tURL!){(data,response,error) in
                
                if let e = error {
                    print("ERROR", e)
                    
                }
                else{
                    if(response as? HTTPURLResponse) != nil {
                        
                        let data = data!
                        let stringed_data = String(data:data, encoding: .utf8)!
                        print(stringed_data)
                 
                        titles.append(stringed_data)
                        
                    }
                }
                
                
            }
            titleRequestor.resume()
            while(titles.count != s){
                if(titles.count >= s){
                    break
                }
            }
        }
        
        
        
        //Title part finishes
        
        //Prices part starts
        
        while titles.count != mainInterator{
            
            if(titles.count == mainInterator){
                break
            }
        }
        
        
        
        
        let pricesIterator : Int = titleIterator
        let pricestUrl : String = baseURLS + "priceNum/"
        s = 0
        for i in 1...pricesIterator{
            s = s + 1
            let tURL = URL(string: pricestUrl + String(i))
            let session = URLSession(configuration: .default)
            let priceRequestor = session.dataTask(with: tURL!){(data,response,error) in
                
                if let e = error {
                    print("ERROR", e)
                    
                }
                else{
                    if(response as? HTTPURLResponse) != nil {
                        
                        let data = data!
                        let stringed_data = String(data:data, encoding: .utf8)!
                        print(stringed_data)
                        
                        prices.append(stringed_data)
                        
                    }
                }
                
                
            }
            priceRequestor.resume()
            while(prices.count != s){
                if(prices.count >= s){
                    break
                }
            }
        }
        
        
        
        //Prices part finishes
        
        
        while prices.count != mainInterator{
            
            if(prices.count == mainInterator){
                break
            }
        }
        
        
        
        
        //Image part starts
        var imageArr : [UIImage] = []
        //let imageURLs : [String] = ["https://cdn.shopify.com/s/files/1/0275/6675/products/170517_Smile_More_Pens_WEB.jpg?","https://images-na.ssl-images-amazon.com/images/I/51X9oIx70kL._SX425_.jpg"]
        var imageURLs : [String] = []
        let ExpectedImageLiterations : Int = mainInterator
        
        let imageTUrl =  baseURLS + "thumbnails/"
        s = 0
        for i in 1...ExpectedImageLiterations{
            s = s + 1
            let tURL = URL(string: imageTUrl + String(i))
            let session = URLSession(configuration: .default)
            let imageIteratorSesh = session.dataTask(with: tURL!){(data,response,error) in
                
                if let e = error {
                    print("ERROR", e)
                    
                }
                else{
                    if(response as? HTTPURLResponse) != nil {
                        
                        let data = data!
                        let stringed_data = String(data:data, encoding: .utf8)!
                        print(stringed_data)
                        imageURLs.append(stringed_data)
                        
                    }
                }
                
                
            }
            imageIteratorSesh.resume()
            while(imageURLs.count != s){
                if(imageURLs.count >= s){
                    break
                }
            }
        }
       
        while imageURLs.count != mainInterator{
            
            if(imageURLs.count == mainInterator){
                break
            }
        }
        
        
        var ImageLiterations : Int = 0
        //Image requesters
        s = 0
        for CurrentURL in imageURLs {
            s = s + 1
            let tURL = URL(string: CurrentURL)
            
            let session = URLSession(configuration: .default)
            
            let getImageFromURL = session.dataTask(with: tURL!){(data,response,error) in
                
                if let e = error {
                    //displaying the message
                    print("Error Occurred: \(e)")
                    
                } else {
                    //in case of now error, checking wheather the response is nil or not
                    if (response as? HTTPURLResponse) != nil {
                        
                        //checking if the response contains an image
                        if let imageData = data {
                            
                            //getting the image
                            let image = UIImage(data: imageData)
                            print(image as Any)
                            //displaying the image
                            
                            imageArr.append(image!)
                            
                            
                        } else {
                            print("Image file is currupted")
                            
                        }
                    } else {
                        print("No response from server")
                        
                    }
                }
                
                
            }
            
            getImageFromURL.resume()
            while(imageArr.count != s){
                if(imageArr.count >= s){
                    break
                }
            }
            //sleep(1)
            ImageLiterations += 1
        }
        while imageArr.count != mainInterator{
            
            if(imageArr.count == mainInterator){
                break
            }
        }
        //Images Finished
        
        
        
       
        
        //let video = Video(image: UIImage(named: "Pen-Image")! , title: "Pen", price: "$" + "4.99")
        //var v : Int = 0
        
        //find the smallest number
        let allValues : [Int] = [imageArr.count, titles.count, prices.count]
        let finalIterator : Int = allValues.min()!
        
        
        if finalIterator <= 0{
            
        }
        else{
            for i in 0...finalIterator - 1{
                let tVid = Video(image: imageArr[i], title: titles[i], price: "$" + prices[i])
                tempVideos.append(tVid)
                
            }
        }
        
        
        
        
        //tempVideos.append(video)
        
        
        return tempVideos
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! DetailedViewController
            destVC.video = sender as? Video
            
        }
    }

}


extension ItemScene: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCells") as! ItemCells
        
        cell.setVideo(video: video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,  didSelectRowAt indexPath: IndexPath) {
        let video = videos[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: video)
    }
    
}
