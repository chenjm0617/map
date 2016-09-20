//
//  MyAnnotationView.swift
//  aWeMap
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 SOLO. All rights reserved.
//

import UIKit

class MyAnnotationView: MAAnnotationView {

    var cView: CalloutView?
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        //如果已经选中了再选中就直接return，不走下面代码
        if self.selected == selected {
            return
        }
        if selected { //选中状态
            if cView == nil {   //如果cView不存在就创建
                cView = CalloutView.init(frame: CGRectMake(0, 0, 150, 70))
                cView?.center = CGPointMake(CGRectGetWidth(self.bounds) / 2 + self.calloutOffset.x,
                                            -CGRectGetHeight(cView!.bounds) / 2 + self.calloutOffset.y)
            }
            cView?.custom(UIImage.init(named: "111")!, nameStr: self.annotation.title!, ageStr: self.annotation.subtitle!)
            self.addSubview(cView!)
        }else{  //非选中状态
            //将气泡移出
            cView?.removeFromSuperview()
        }
        
        super.setSelected(selected, animated: animated)
    }
    
}
