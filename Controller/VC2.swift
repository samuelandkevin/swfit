//
//  VC2.swift
//  swfit
//
//  Created by YHIOS002 on 16/9/13.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

import UIKit

class VC2: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    var dataSource:NSMutableArray = NSMutableArray()
    
    //MARK: - init
    func initUI() {
       
        self.tableView.delegate   = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .None
        self.tableView.frame      = self.view.bounds
        self.view.addSubview(tableView)
        
    }
    
    func loadData() {
        var index = 0
        while index < 10 {
            let model = QAModel()
            model.modelId = String(index+1)
            randomModel(model, totalCount: 10)
            self.dataSource.addObject(model)
            index += 1
        }
       
        tableView.reloadData()
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        self.loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = CellForCustom.cellWithTableView(tableView)
        cell.model = self.dataSource[indexPath.row] as? QAModel
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let model = self.dataSource[indexPath.row] as? QAModel
    
        return CellForCustom.hyb_cellHeight(forTableView: tableView, config: { (cell) in
            let itemCell = cell as? CellForCustom
            itemCell?.model = model!
            }, updateCacheIfNeeded: { () -> (key: String, stateKey: String, shouldUpdate: Bool) in
                return (String(model?.modelId), "", false)
        })

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
