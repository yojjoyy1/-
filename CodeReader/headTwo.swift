//
//  headTwo.swift
//  CodeReader
//
//  Created by Cxicl on 2017/9/20.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit

class headTwo: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{

    @IBOutlet weak var collV: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collV.delegate = self
        collV.dataSource = self
        collV.frame = view.frame
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 0
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headTwoCell", for: indexPath) as! headTwoCell
        return cell
    }
    

    
}
