//
//  UIViewExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/18.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension UIView {
    ///左上角x坐标
    var viewX : CGFloat { get {return self.frame.origin.x} set(newX) {self.frame.origin.x = newX} }
    ///右上角x坐标
    var viewMaxX : CGFloat { get {return self.viewX + self.viewWidth} set(newMaxX) {self.viewX = newMaxX - self.viewWidth} }
    ///左上角y坐标
    var viewY : CGFloat { get {return self.self.frame.origin.y} set(newY) {self.frame.origin.y = newY} }
    ///左下角y坐标
    var viewMaxY : CGFloat { get {return self.viewY + self.viewHeight} set(newMaxY) {self.viewY = newMaxY - self.viewHeight} }
    
    ///宽度
    var viewWidth : CGFloat { get {return self.frame.size.width} set(newWidth) {self.frame.size.width = newWidth} }
    ///一半的宽度
    var viewHalfWidth : CGFloat { get { return self.viewWidth / 2 } }
    ///高度
    var viewHeight: CGFloat { get {return self.frame.size.height} set(newHeight) {self.frame.size.height = newHeight} }
    ///一半的高度
    var viewHalfHeight : CGFloat { get { return self.viewHeight / 2 } }
    
    ///左上角起点的坐标
    var viewOrigin : CGPoint { get {return self.frame.origin }
        set(newOrigin) {self.viewX = newOrigin.x; self.viewY = newOrigin.y} }
    ///右下角终点的坐标
    var viewEnd : CGPoint { get {return CGPoint(x: self.viewMaxX, y: self.viewMaxY)} set(newViewEnd) {self.viewMaxX = newViewEnd.x; self.viewMaxY = newViewEnd.y} }
    
    ///视图尺寸
    var viewSize : CGSize { get {return self.frame.size}
        set(newSize) {self.viewWidth = newSize.width; self.viewHeight = newSize.height}}
    ///视图中心点
    var viewCenter : CGPoint { get {return CGPoint(x: (self.viewWidth / 2) + self.viewX, y: (self.viewHeight / 2) + self.viewY)}
        set(newCenterPoint) { self.viewOrigin = CGPoint(x: newCenterPoint.x - (self.viewWidth / 2), y: newCenterPoint.y - (self.viewHeight / 2))} }
    ///竖直中央位置
    var viewCenterVertical: CGFloat { get {return (self.viewHeight / 2 + self.viewY) } set(newCenterVertical) { self.viewY = newCenterVertical - (self.viewHeight / 2)} }
    ///水平中央位置
    var viewCenterHorizontal: CGFloat { get {return (self.viewWidth / 2 + self.viewX) } set(newCenterHorizontal) { self.viewX = newCenterHorizontal - (self.viewWidth / 2)} }
    
    ///在父视图中居中显示
    func makeCenterInSuperView() -> UIView {
        guard self.superview != nil else {
            return self
        }
        return self.makeCenterInView(self.superview!)
    }
    ///在任意视图中居中显示
    func makeCenterInView(view : UIView) -> UIView {
        self.viewX = view.viewCenterHorizontal - self.viewHalfWidth
        self.viewY = view.viewCenterVertical - self.viewHalfHeight
        return self
    }
    ///在屏幕视图中居中显示
    func makeCenterInScreen(screen : UIScreen) -> UIView {
        return self.makeCenterInView(UIView(frame: screen.bounds))
    }
    
    // MARK: 链式设置
    func makeBackgroundColor(color : UIColor?) -> UIView {
        self.backgroundColor = color
        return self
    }
    func makeFrame(frame : CGRect) -> UIView {
        self.frame = frame
        return self
    }
    func makeLayerCornerRadius(cornerRadius : CGFloat) -> UIView {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    func makeLayerBorderUIColor(borderColor : UIColor?) -> UIView {
        self.layer.borderColor = borderColor?.CGColor
        return self
    }
    func makeLayerMasksToBounds(masksToBounds : Bool) -> UIView {
        self.layer.masksToBounds = masksToBounds
        return self
    }
    func makeTranslatesAutoresizingMaskIntoConstraints(translate : Bool) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = translate
        return self
    }
    func makeClipsToBOunds(clipsToBounds : Bool) -> UIView {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    class func loadFromNibNamed(name : String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(nibName: name, bundle: bundle).instantiateWithOwner(nil, options: nil).first as? UIView
    }
}