//
//  CellForProduct.swift
//  swfit
//
//  Created by YHIOS002 on 16/9/13.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

import UIKit
import Kingfisher

class CellForProduct: UITableViewCell {

    let lbTitle = UILabel()
    let lbLike  = UILabel()
    let imgvV   = UIImageView()
    var strID   = String()
    
    var model:ProductRecommendModel?{
        didSet{
            lbTitle.text = model?.title
            lbLike.text  = "喜欢:\(model?.likesNumber)"
            imgvV.kf_setImageWithURL(NSURL(string:  model!.imageUrl!), placeholderImage:UIImage(named: "placeHolder.jpg"))
            let pID = model?.productID
            if (pID != nil) {
                strID = pID!
            }
        }
    
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        lbTitle.tag = 110
        
        lbTitle.textColor = UIColor.blueColor()
        lbTitle.font = UIFont.systemFontOfSize(16.0)
        lbTitle.textAlignment = NSTextAlignment.Center
        lbTitle.frame = CGRectMake(0, 342/2, SCREEN_WIDTH, 63/2)
        contentView.addSubview(lbTitle)
        
        //已经喜欢的人数
        
        lbLike.tag = 111
        lbLike.frame = CGRectMake(0, 468/2-70/2, SCREEN_WIDTH, 63/2)
        lbLike.textAlignment = NSTextAlignment.Center
        lbLike.textColor = UIColor.greenColor()
        lbLike.font = UIFont.systemFontOfSize(14.0)
        contentView.addSubview(lbLike)
        
        imgvV.frame = CGRectMake(0, 0, SCREEN_WIDTH, 171)
        contentView.addSubview(imgvV)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
   class func cellWithTableView(tableView:UITableView) -> CellForProduct {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellForProduct") as? CellForProduct
        if (cell == nil) {
            cell = CellForProduct(style: UITableViewCellStyle.Default, reuseIdentifier: "CellForProduct")
        }
        return cell!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
