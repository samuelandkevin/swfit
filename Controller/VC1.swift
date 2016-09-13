//
//  ViewController.swift
//  swfit
//
//  Created by YHIOS002 on 16/8/30.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

import UIKit


class VC1: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var dataStr = ProductRecommend()
    var productArr:NSMutableArray?
    let tableView: UITableView = UITableView(frame: CGRectZero, style: .Plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       

        self.loadData()
        self.initUI()
        
    }

    func loadData() {
        //默认显示0行
        self.productArr = dataStr.createProductRecommendModel(0)
        print("product.count = \(self.productArr!.count)")
    }
    
    func initUI() {
       
        self.tableView.delegate   = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .None
        self.tableView.frame      = self.view.bounds
        self.view.addSubview(tableView)

    }
    
    //MARK:UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArr?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = CellForProduct.cellWithTableView(tableView)
        cell.model = self.productArr![indexPath.row] as? ProductRecommendModel
        return cell
    }
    
    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 171+63
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let vc = VC2.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    //MARK:Life
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



func swap1(inout a:Int ,inout  b:Int) {
    let  tempor = a
    a     = b
    b     = tempor
}

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

