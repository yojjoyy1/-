//
//  AppDelegate.swift
//  CodeReader
//
//  Created by perkinsung on 2016/12/1.
//  Copyright © 2016年 perkinsung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        //Version()
        return true
    }

    /*
    func Version()
    {
        let localVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        print("localVersion:\(localVersion)")
        let url = URL(string:"http://itunes.apple.com/cn/lookup?id=1235368643")
        let resquest = NSMutableURLRequest(url: url!)
        resquest.httpMethod = "POST"
        let session = URLSession.shared
        let task = session.dataTask(with: resquest as URLRequest) { (data, res, err) in
            if data != nil
            {
                do
                {
                    let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                    if let dic = json as? NSDictionary
                    {
                        if let results = dic["results"] as? NSArray
                        {
                            print("results:\(results)")
                            if let resultsDic = results[0] as? NSDictionary
                            {
                                if let version = resultsDic["version"] as? String
                                {
                                    if localVersion != version
                                    {
                                        if UserDefaults.standard.bool(forKey: "update") == false
                                        {
                                            let alertControler = UIAlertController(title: "版本訊息", message: "版本已更新是否前往app store更新？", preferredStyle: .alert)
                                            let alertAction = UIAlertAction(title: "前往", style: .default, handler: { (ok) in
                                                let url = URL(string: "https://appsto.re/tw/dRJOjb.i")
                                                UserDefaults.standard.set(false, forKey: "update")
                                                //self.window?.isHidden = true
                                                if #available(iOS 10.0, *) {
                                                    return UIApplication.shared.open(url!)
                                                } else {
                                                    UIApplication.shared.openURL(url!)
                                                }
                                            })
                                            let alertCancel = UIAlertAction(title: "取消", style: .cancel, handler: { (cancel) in
                                                let alertc = UIAlertController(title: "關閉訊息", message: "是否日後都關閉更新訊息", preferredStyle: .alert)
                                                let alertb = UIAlertAction(title: "確定", style: .default, handler: { (aa) in
                                                    //self.window?.isHidden = true
                                                    UserDefaults.standard.set(true, forKey: "update")
                                                })
                                                let alera = UIAlertAction(title: "下次開啟時提醒我", style: .cancel, handler: { (cc) in
                                                    //self.window?.isHidden = true
                                                    UserDefaults.standard.set(false, forKey: "update")
                                                })
                                                alertc.addAction(alertb)
                                                alertc.addAction(alera)
                                                self.window?.rootViewController?.present(alertc, animated: true, completion: nil)
                                            })
                                            alertControler.addAction(alertAction)
                                            alertControler.addAction(alertCancel)
                                            self.window?.rootViewController?.present(alertControler, animated: true, completion: nil)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                catch
                {
                    print("error:\(error.localizedDescription)")
                }
                
            }
            if err != nil
            {
                print("err:\(err?.localizedDescription)")
            }
        }
        task.resume()
    }
 */

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

