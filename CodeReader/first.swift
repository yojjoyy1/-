//
//  first.swift
//  CodeReader
//
//  Created by Cxicl on 2017/5/10.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit
import VpadnSDKAdKit
class first: UIViewController,VpadnBannerDelegate,VpadnInterstitialDelegate
{
    
    @IBOutlet weak var bannerView: UIView!
    var add:VpadnBanner!
    var inter:VpadnInterstitial!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let uuid = CFUUIDCreate(nil)
        let uuidString = CFUUIDCreateString(nil, uuid)
        let result = CFStringCreateCopy(nil, uuidString)
        let origin = CGPoint(x:0,y:0)
        //bannerView.frame.size = CGSize(width: view.bounds.size.width, height: 50)
        add = VpadnBanner(adSize: VpadnAdSizeFromCGSize(bannerView.bounds.size), origin: origin)
        add.strBannerId = "8a8081825ef015e3015f241e1aec38c4"
        
        add.delegate = self
 
        add.platform = "TW"
    
        add.rootViewController = self
     
        add.setAdAutoRefresh(true)

        add.showTestLog(true)
        
        bannerView.addSubview(add.getVpadnAdView())
     
        add.startGetAd([result!])
        //VponAppConfig.setVponLogLevel(VpadnLogLevelOfDefault)
        //add.startGetAd(["D2040B3B-7437-4CFC-8A54-72F2201EC0E9"])
//        let url = URL(string: "http://www.eticabattery.com/")
//        if #available(iOS 10.0, *) {
//            return UIApplication.shared.open(url!)
//        } else {
//            // Fallback on earlier versions
//        }
        //bannerView.backgroundColor = UIColor.red
     
        
        let viewX = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        viewX.center = bannerView.center
        viewX.backgroundColor = UIColor.white
        viewX.setTitle("X", for: .normal)
        viewX.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50.0)
        viewX.setTitleColor(UIColor.red, for: .normal)
        viewX.layer.cornerRadius = 50.0
        viewX.layer.masksToBounds = true
        viewX.addTarget(self, action: #selector(go), for: .touchUpInside)
        bannerView.addSubview(viewX)
 
    }
    func onVpadnAdReceived(_ bannerView: UIView!)
    {
        print("抓到廣告")
    }
    func onVpadnAdFailed(_ bannerView: UIView!, didFailToReceiveAdWithError error: Error!)
    {
        print("廣告抓取失敗錯誤=\(error.localizedDescription)")
    }
    func go()
    {
        let VC = storyboard?.instantiateViewController(withIdentifier: "nav")
        self.present(VC!, animated: true, completion: nil)
    }

}
