//
//  ViewController.swift
//  weatherTest
//
//  Created by Ndel on 7/22/19.
//  Copyright © 2019 Ndel. All rights reserved.
//

import UIKit

struct WeatherInfo: Codable {
    let currently: ApparentTemperature
}

struct ApparentTemperature: Codable {
    let temperature: Double
}



class ViewController: UIViewController {
    
    
   
    
    
    @IBOutlet weak var liveWeatherYo: UITextField!
    
        var actualTempYo: Double = -0.1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeather(_ sender: Any) {
        
        actuallyGetThaData()
        
        liveWeatherYo.text = "\(actualTempYo)"
        
        print(actualTempYo)
    
    }
        
    
        
    func actuallyGetThaData() {
        
        print("Trying to get Data")
        
      
            
        guard let weatherUrl = URL(string: "https://api.darksky.net/forecast/1b1d092b30c843119e15cb6033186506/35.2271,80.8431") else { return }
        URLSession.shared.dataTask(with: weatherUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherInfo.self, from: data)
                
             
                
                print(weatherData.currently.temperature)
                
                self.actualTempYo = weatherData.currently.temperature
                
                
                
                print("got Data")
                
                
                print("Actual data is \(self.actualTempYo)")
                
                
                
            } catch let error {
                print("Err", error)
            }
            }.resume()
    
         liveWeatherYo.text = "\(actualTempYo)"
    }
    

}
    
    
    
    
   

