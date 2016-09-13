//
//  CellForCustom.swift
//  swfit
//
//  Created by YHIOS002 on 16/9/13.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

import UIKit

class CellForCustom: UITableViewCell {

    var imgvAvatar = UIImageView()
    var lbName     = UILabel()
    var lbIndustry = UILabel()
    var lbRight    = UILabel()
    var lbCompany  = UILabel()
    var lbJob      = UILabel()
    var lbContent  = UILabel()
    var lbPTime    = UILabel()
    var lbIsOpen   = UILabel()
    var lbStatus   = UILabel()
    var viewSeparator = UIView()
    var model:QAModel?{
        didSet{
            imgvAvatar.kf_setImageWithURL(model?.avtarUrl, placeholderImage: UIImage.init(named: "common_avatar_120px"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            lbName.text     = model?.userName
            lbIndustry.text = model?.industry
            lbRight.text    = "\(model?.answerCount)个回答"
            lbCompany.text  = model?.company
            lbJob .text     = model?.job
            lbContent.text  = model?.question
            lbPTime.text    = model?.publishTime
            lbIsOpen.text   = (model?.isOpen == true ? "开发放式":"指定式")
            lbStatus.text   = "Status"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        self.selectionStyle = .None
        
        contentView.addSubview(imgvAvatar)
        contentView.addSubview(lbName)
        contentView.addSubview(lbIndustry)
        contentView.addSubview(lbRight)
        contentView.addSubview(lbCompany)
        contentView.addSubview(lbJob)
        contentView.addSubview(lbContent)
        contentView.addSubview(lbPTime)
        contentView.addSubview(lbIsOpen)
        contentView.addSubview(viewSeparator)
        
        lbContent.numberOfLines = 0
        viewSeparator.backgroundColor = UIColor.grayColor()
        self.layoutUI()
    }
    
    func layoutUI() {
        imgvAvatar.snp_makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15)
            make.top.equalTo(contentView).offset(15)
            make.width.height.equalTo(45)
        }
        

       lbName.snp_makeConstraints{(make) in
            make.top.equalTo(contentView).offset(15);
            make.left.equalTo(imgvAvatar.snp_right).offset(10);
            make.right.equalTo(lbIndustry.snp_left).offset(-10);
            }
        
        
         lbIndustry.snp_makeConstraints{(make) in
            make.bottom.equalTo(lbName.snp_bottom);
            make.left.equalTo(lbName.snp_right).offset(10);
            make.right.equalTo(  lbRight.snp_left).offset(-10);
            make.width.greaterThanOrEqualTo(60);
            }
        
        lbIndustry.setContentHuggingPriority(249, forAxis: UILayoutConstraintAxis.Horizontal)
        lbIndustry.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
       
        lbRight.snp_makeConstraints{(make) in
            make.bottom.equalTo(lbName.snp_bottom)
            make.right.equalTo(contentView).offset(-15);
            }
        
        lbRight.setContentHuggingPriority(251, forAxis: UILayoutConstraintAxis.Horizontal)
        lbRight.setContentCompressionResistancePriority(751, forAxis: UILayoutConstraintAxis.Horizontal)

    
        lbCompany.snp_makeConstraints{(make) in
            make.top.equalTo(lbName.snp_bottom).offset(9)
                make.left.equalTo(lbName.snp_left)
                make.right.equalTo(lbJob.snp_left).offset(-10)
            }
        
        lbJob.snp_makeConstraints{(make) in              make.bottom.equalTo(lbCompany.snp_bottom);
                make.left.equalTo( lbCompany.snp_right).offset(10);
            make.right.equalTo( contentView).offset(-10);
                make.width.greaterThanOrEqualTo(80);
            }
        
        lbJob.setContentHuggingPriority(249, forAxis: UILayoutConstraintAxis.Horizontal)
        lbJob.setContentCompressionResistancePriority(749, forAxis: UILayoutConstraintAxis.Horizontal)
        
        
        lbContent.snp_makeConstraints{(make) in
            make.top.equalTo(imgvAvatar.snp_bottom).offset(11);
            make.left.equalTo(contentView).offset(15);
            make.right.equalTo(contentView).offset(-15);
        make.bottom.equalTo(lbPTime.snp_top).offset(-11);
            }
        
        // 不然在6/6plus上就不准确了
        lbContent.preferredMaxLayoutWidth = SCREEN_WIDTH - 30;
        
        lbPTime.snp_makeConstraints{(make) in
            make.top.equalTo(lbContent.snp_bottom).offset(11);
            make.left.equalTo(contentView).offset(15);
            make.right.equalTo(lbIsOpen.snp_left).offset(-10);
            }
        
        lbIsOpen.snp_makeConstraints{(make) in
            make.centerY.equalTo(lbPTime.snp_centerY);
        make.left.equalTo(lbPTime.snp_right).offset(10);
            }
        
//        lbStatus.snp_makeConstraints{(make) in
//        make.right.equalTo( contentView).offset(-10);
//            make.centerY.equalTo( lbIsOpen);
//            }
        
        viewSeparator.snp_makeConstraints{(make) in
            make.top.equalTo(lbPTime.snp_bottom).offset(15);
            make.left.right.equalTo(0);
            make.height.equalTo(0.5);
//            make.bottom.equalTo( contentView);
            }

        self.hyb_lastViewInCell = viewSeparator
        self.hyb_bottomOffsetToCell = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    class func cellWithTableView(tableView:UITableView) -> CellForCustom {

        var cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(CellForCustom)) as? CellForCustom
        if (cell == nil) {
            cell = CellForCustom(style: UITableViewCellStyle.Default, reuseIdentifier: NSStringFromClass(CellForCustom))
        }
        return cell!
        
    }

}
