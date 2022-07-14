//
//  ViewModel.swift
//  VKSirius
//
//  Created by developer on 14.07.2022.
//

import Foundation
import Alamofire
import UIKit

final class ViewModel{
    
    private var apps: [App] = []
    
    var didReceiveError: (() -> Void)?
    var didUpdate: (() -> Void)?
    
    func loadApps(){
        
        if let path = Bundle.main.path(forResource: "result", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try? JSONDecoder().decode(AppsRespons.self, from: data){
                    self.apps = jsonResult.body.services
                    self.didUpdate?()
                }
              } catch {
                  self.didReceiveError?()
              }
        }

    }
    
    func app(at indexPath: IndexPath) -> App{
        return apps[indexPath.row]
    }
    
    func numberOfRows() -> Int{
        return apps.count
    }
    
    func didSelectRow(at indexPath: IndexPath){
        if let url = URL(string:apps[indexPath.row].link){
            UIApplication.shared.open(url)
        }else {
            self.didReceiveError?()
        }
    }
    
}
