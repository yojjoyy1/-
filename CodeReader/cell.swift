//
//  cell.swift
//  CodeReader
//
//  Created by Cxicl on 2017/4/28.
//  Copyright © 2017年 perkinsung. All rights reserved.
//

import UIKit

class cell: UITableViewCell
{
    var label:UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
    }

}
