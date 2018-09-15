//
//  ViewController.swift
//  UICollectionView_Test
//
//  Created by AAA on 2018/9/14.
//  Copyright © 2018年 auger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    fileprivate let arrayTitle = ["我是文字", "我是长文字", "我是长长文字", "我是长长长文字", "我是长长长长文字", "我是长长长长长文字", "我是长长长长长长文字", "我是长长长长长长长文字", "我是长长长长长长长长文字", "我是长长长长长长长长长文字", "我是长长长长长长长长长长文字", "我是长长长长长长长长长长长文字", "我是短文字了", "恢复正常短文字", "恢复正常文字"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionView自动布局"
        
//        let flowLayout = EqualCellSpaceFlowLayout.init()
//        collectionView.collectionViewLayout = flowLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let specificationName: NSString = arrayTitle[indexPath.row] as NSString
        /// 动态计算高度
        let options : NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading, .truncatesLastVisibleLine]
        /// 字体要对应
        let boundingRect = specificationName.boundingRect(with: CGSize(width: 0.0, height: 0.0), options:options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0)], context: nil)
        return CGSize(width: boundingRect.width, height: 26.0)
    }
    
    /// 设置间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCell
        cell.labTitle.text = arrayTitle[indexPath.row]
        return cell
    }
}

class TestCell: UICollectionViewCell {
    
    @IBOutlet weak var labTitle: UILabel!
    
    override func awakeFromNib() {
        
    }
}

