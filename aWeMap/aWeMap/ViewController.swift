//
//  ViewController.swift
//  aWeMap
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 SOLO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mapView = MAMapView.init(frame: UIScreen.mainScreen().bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(mapView)
        
        //地图类型：普通和卫星，默认是普通
        mapView.mapType = .Standard
        
        //路况信息
        mapView.showTraffic = false
        
        //logo中心点坐标，logo必须完整的展示在mapView里
        mapView.logoCenter = CGPointMake(0, 0)
        
        //指南针/罗盘
        //mapView.showsCompass = false
        mapView.compassOrigin = CGPointMake(350, 30)
        
        //比例尺
        //mapView.showsScale = false
        mapView.scaleOrigin = CGPointMake(10, 30)
        
        //用代码缩放地图，缩放级别3到19
        mapView.setZoomLevel(11, animated: true)
        
        //设置允许缩放的范围
        mapView.minZoomLevel = 3
        mapView.maxZoomLevel = 19
        
        //成为代理
        mapView.delegate = self
        
        //添加地图标记
        let annotation = MAPointAnnotation()
        //标记的经纬度                                        先纬度    后经度
        annotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018)
        annotation.title = "方恒国际"
        annotation.subtitle = "阜通东大街6号"
        mapView.addAnnotation(annotation)
        
        //定位
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.Follow, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        /*
        let iconView = UIImageView.init(frame: CGRectMake(0, 0, 200, 200))
        self.view.addSubview(iconView)
        
        //地图截屏：从mapView里截出一张图片
        iconView.image = mapView.takeSnapshotInRect(iconView.frame)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: MAMapViewDelegate {
    func mapView(mapView: MAMapView!, viewForAnnotation annotation: MAAnnotation!) -> MAAnnotationView! {
        //如果annotation不是MAPointAnnotation这个类就直接return
        if !annotation.isKindOfClass(MAPointAnnotation) {
            return nil
        }
        /*
    #if false
        //默认的大头针样式
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("qqq") as? MAPinAnnotationView
        if annotationView == nil {
            annotationView = MAPinAnnotationView.init(annotation: annotation, reuseIdentifier: "qqq")
        }
        
        //是否显示气泡
        annotationView?.canShowCallout = true
        //以动画形式
        annotationView?.animatesDrop = true
        //设置标注可以拖动
        annotationView?.draggable = true
        //设置大头针的颜色
        annotationView?.pinColor = .Purple

    #else
        //自定制大头针的图片
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("qqq")
        if annotationView == nil {
            annotationView = MAAnnotationView.init(annotation: annotation, reuseIdentifier: "qqq")
        }
        annotationView.image = UIImage.init(named: "111")
        annotationView.canShowCallout = true
        annotationView?.draggable = true
        //设置中心点的便宜
        annotationView.centerOffset = CGPointMake(0, 0)
        
    #endif
        */
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("qqq") as? MyAnnotationView
        if annotationView == nil {
            annotationView = MyAnnotationView(annotation: annotation, reuseIdentifier: "qqq")
        }
        
        annotationView?.image = UIImage.init(named: "111")
        
        annotationView?.canShowCallout = false
        annotationView?.draggable = true
        
        
        return annotationView!
    }
}

