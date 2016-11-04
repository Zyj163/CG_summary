//
//  ViewController.swift
//  绘制PDF
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/myPDF.pdf"
        
        print(path)
        
        remove(path)
        
        let scrollView = UIScrollView.init(frame: view.bounds)
        let image = drawContentToPDF(path).drawPDFToView(path)
        print(image.size)
        let imageView = UIImageView.init(image: image)
        scrollView.contentSize = imageView.bounds.size
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }

    func drawContentToPDF(_ path : String) -> ViewController {
        
        //启用pdf图形上下文
        /**
         path:保存路径
         bounds:pdf文档大小，如果设置为CGRectZero则使用默认值：612*792
         pageInfo:页面设置,为nil则不设置任何信息
         */
        UIGraphicsBeginPDFContextToFile(path, CGRect.zero, [kCGPDFContextAuthor as AnyHashable : "zhangyj"])
        
        //由于pdf文档是分页的，所以首先要创建一页画布供我们绘制
        UIGraphicsBeginPDFPage()
        
        let title : NSString = "Welcome to Apple Support"
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        title.draw(in: CGRect(x: 26, y: 30, width: 300, height: 50), withAttributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 18), NSParagraphStyleAttributeName : style])
        
        let content : NSString = "Learn about Apple products, view online manuals, get the latest downloads, and more. Connect with other Apple users, or get service, support, and professional advice from Apple."
        let contentStyle = NSMutableParagraphStyle()
        contentStyle.alignment = .left
        content.draw(in: CGRect(x: 26, y: 56, width: 300, height: 255), withAttributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName:UIColor.gray, NSParagraphStyleAttributeName:contentStyle])
        
        let image = UIImage.init(named: "20120426103956263")
        image?.draw(in: CGRect(x: 6, y: 320, width: 600, height: 281))
        
        //新建一页
        UIGraphicsBeginPDFPage()
        let nextImage = UIImage.init(named: "20120426103956263")
        nextImage?.draw(in: UIGraphicsGetPDFContextBounds())
        
        //结束PDF上下文
        UIGraphicsEndPDFContext()
        
        return self
    }
    
    func drawPDFToView(_ path : String) -> UIImage {
        
        let sfMuni = CGPDFDocument(URL(fileURLWithPath: path) as CFURL)
        
        let pdfPageOne = sfMuni?.page(at: 1)
        let pdfPageTwo = sfMuni?.page(at: 2)
        
        UIGraphicsBeginImageContext(CGSize(width: 612, height: 792*2))
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.saveGState()
        
        ctx?.drawPDFPage(pdfPageTwo!)
        
        ctx?.translateBy(x: 0, y: 792)
        
        ctx?.drawPDFPage(pdfPageOne!)
        
        ctx?.restoreGState()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        
        UIGraphicsEndImageContext()
        
        return image!
    }
}




















