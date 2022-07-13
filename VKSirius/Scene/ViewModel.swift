//
//  ViewModel.swift
//  VKSirius
//
//  Created by developer on 14.07.2022.
//

import Foundation
import Alamofire
import UIKit

protocol ViewModelDelegate: AnyObject{
    func ViewModelDidRequestOpenApp(with indexPath: IndexPath)
}

final class ViewModel{
    
    weak var delegate: ViewModelDelegate?
    
    private var apps: [App] = []
    
    var didReceiveError: ((Error) -> Void)?
    var didUpdate: (() -> Void)?
    
    func loadApps(){
        
        //тут запрос
        
        apps.append(App(name: "ВКонтакте", desctiption: "Самая популярная соцсеть и первое суперприложение в России", link: "https://vk.com/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/vk.png"))
        
        apps.append(App(name: "My.Games", desctiption: "Игры для ПК, консолей и смартфонов, в которые играют сотни миллионов геймеров", link: "https://my.games/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/mygames.png"))
        
        apps.append(App(name: "Сферум", desctiption: "Онлайн-платформа для обучения и образовательных коммуникаций", link: "https://sferum.ru/?p=start", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/sferum.png"))
        apps.append(App(name: "Юла", desctiption: "Сервис объявлений на основе геолокации и интересов", link: "https://youla.ru/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/youla.png"))
        apps.append(App(name: "Самокат", desctiption: "Онлайн-ретейлер с доставкой товаров за 15 минут", link: "https://samokat.ru/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/samokat.png"))
        apps.append(App(name: "Ситидрайв", desctiption: "Каршеринг-сервис в крупнейших российских городах", link: "https://citydrive.ru/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/citydrive.png"))
        apps.append(App(name: "Облако", desctiption: "Сервис для хранения файлов и совместной работы с ними", link: "https://cloud.mail.ru/home/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/cloud.png"))
        apps.append(App(name: "Все аптеки", desctiption: "Онлайн-сервис для поиска и щзаказа лекарств по лучшей цене", link: "https://vseapteki.ru/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/apteki.png"))
        apps.append(App(name: "Календарь", desctiption: "Планирование дня и эффективное управление временем", link: "https://calendar.mail.ru/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/calendar.png"))

    }
    
    func app(at indexPath: IndexPath) -> App{
        return apps[indexPath.row]
    }
    
    func numberOfRows() -> Int{
        return apps.count
    }
    
    func selectRow(at indexPath: IndexPath){
        UIApplication.shared.open((URL(string:apps[indexPath.row].link) ?? URL(string: "apple.com"))!)
    }
    
}
