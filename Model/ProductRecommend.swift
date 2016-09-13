//
//  ProductRecommend.swift
//  swfit
//
//  Created by YHIOS002 on 16/9/13.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

import UIKit

class ProductRecommend: NSObject {
    var fileName = "app_JSON"
    let jsonNameArray = NSArray(objects: "app_JSON","json_Art","json_Gift","json_Guide","json_LoveBeauty","json_Design","json_Eater","json_Kitchen","json_WageEarners","json_Student","json_Party","json_Holiday","json_Dormitory")
    var productArr  = NSMutableArray()
    var categoryArr = NSMutableArray()
    var bannerArr   = NSMutableArray()
    var dict        = NSDictionary()
    
    override init() {
        super.init()
    }
    
    
    //从json中获取数据
    func getDataFromJSONFile(index:Int)
    {
        
        fileName = jsonNameArray[index] as! String
        //获取资源文件
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil)
        let data = NSData(contentsOfFile: path!)
        
        print("get data success")
        
        self.dict = ( try! NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) ) as! NSDictionary
    }
    
    //MARK:创建首页清单推荐模型 --各种分类下的model
    func createProductRecommendModel(categoryIndex:Int) ->NSMutableArray
    {
        
        self.getDataFromJSONFile(categoryIndex)
        //从json 中解析出 data 数组
        let dataArr = dict.objectForKey("data") as! NSDictionary
        
        //从data数组汇总解析出 topicArray
        let topicArr = dataArr.objectForKey("topic") as! NSArray
        
        self.productArr = NSMutableArray() //否则  切换频道的时候 数组会叠加
        for(var i:Int = 0;i < topicArr.count ; i++)
        {
            //从topicArray中解析出 model
            let obj = topicArr[i]
            //给model赋值
            let model = ProductRecommendModel.init()
            model.productID = ( obj.objectForKey("id") )as? String
            model.title = (obj.objectForKey("title")) as? String
            model.subTitle = obj.objectForKey("tags") as? String
            model.imageUrl = obj.objectForKey("pic") as? String
            model.likesNumber = obj.objectForKey("likes") as? String
            model.isLike = obj.objectForKey("islike") as? Bool
            model.updataTime = obj.objectForKey("update_time") as? Int
            model.type = obj.objectForKey("type") as? String
            
            self.productArr.addObject(model)
        }
        print("\(jsonNameArray[categoryIndex] as! String)个数 :\(self.productArr.count)")
        return self.productArr
    }
    
}

//MARK:Model
class ProductRecommendModel{
   
        /** 清单ID*/
        var productID:String?
        /** 一级标题*/
        var title:String?
        /** 二级标题*/
        var subTitle:String?
        /** 图片url*/
        var imageUrl:String?
        /** 喜欢人数*/
        var likesNumber:String?
        /** 是否已经喜欢*/
        var isLike:Bool?
        /** 更新时间*/
        var updataTime:Int?
        /** 清单类型*/
        var type:String?
    

}




public class QAModel{
    enum Status{
        case Status_WaitForAccept    //待采纳答案
        
        case Status_HasRefund        //已退款
        case Status_HasReply         //已回答
        
    }

    var avtarUrl:NSURL?
    var userName:String?
    var industry:String?
    var company:String?
    var job:String?
    var question:String?
    var publishTime:String?
    var isOpen:Bool?
    var answerCount:Int?
    var status:Status?

    //计算行高的属性
    var modelId:String?
}

public func randomModel(model:QAModel,totalCount:Int) {
    model.avtarUrl = NSURL.init(string: "")
    
    let nLength:UInt32 = arc4random() % 3 + 1
    var nStr = String()

    var index:UInt32 = 0
    while (index < nLength)  {
         nStr = nStr+"测试名字"
         index += 1
    }
    model.userName = nStr
 
    let iLength = arc4random() % 3 + 1
    var iStr = String()
    
    var index2:UInt32 = 0
    while (index2 < iLength)  {
        iStr = iStr + "测试行业"
        index2 += 1
    }
    model.industry = iStr
    
    let cLength = arc4random() % 8 + 1
    var cStr = String()
    
    var index3:UInt32 = 0
    while (index3 < cLength)  {
        cStr = cStr + "测试公司"
        index3 += 1
    }
    model.company = cStr
    
    let jLength = arc4random() % 8 + 1
    var jStr = String()
    
    var index4:UInt32 = 0
    while (index4 < jLength)  {
        jStr = jStr + "测试职位"
        index4 += 1
    }
    model.job = jStr
    
    let tLength = arc4random() % 8 + 1
    var tStr = String()
    
    var index5:UInt32 = 0
    while (index5 < tLength)  {
        tStr = tStr + "测试内容"
        index5 += 1
    }
    model.question = tStr
    
    model.publishTime = "2016-9-13"
    model.isOpen = true

}



