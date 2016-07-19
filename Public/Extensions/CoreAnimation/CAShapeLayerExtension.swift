//
//  CAShapeLayerExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/21.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension CAShapeLayer {
    // MARK: 链式设置
    override func makeBackgroundColor(color : UIColor?) -> CAShapeLayer {
        self.backgroundColor = color?.CGColor
        return self
    }
    override func makeFrame(frame : CGRect) -> CAShapeLayer {
        self.frame = frame
        return self
    }
    override func makeSize(size : CGSize) -> CAShapeLayer {
        self.frame.size = size
        return self
    }
    override func makeAnchorPoint(point : CGPoint) -> CAShapeLayer {
        self.anchorPoint = point
        return self
    }
    override func makePosition(position : CGPoint) -> CAShapeLayer {
        self.position = position
        return self
    }
    func makePath(path : UIBezierPath) -> CAShapeLayer {
        self.path = path.CGPath
        return self
    }
    func makeFillColor(color : UIColor?) -> CAShapeLayer {
        self.fillColor = color?.CGColor
        return self
    }
    func makeStrokeColor(color : UIColor?) -> CAShapeLayer {
        self.strokeColor = color?.CGColor
        return self
    }
    func makeLineWidth(width : CGFloat) -> CAShapeLayer {
        self.lineWidth = width
        return self
    }
    func makeTransform(transfrom : CATransform3D) -> CAShapeLayer {
        self.transform = transform
        return self
    }
    func makeLineJoin(string : String) -> CAShapeLayer {
        self.lineJoin = string
        return self
    }
    func makeLineDashPattern(pattern : [NSNumber]?) -> CAShapeLayer {
        self.lineDashPattern = pattern
        return self
    }
    func makeLineDashPhase(phase : CGFloat) -> CAShapeLayer {
        self.lineDashPhase = phase
        return self
    }
    func makeStrokeEnd(end : CGFloat) -> CAShapeLayer {
        self.strokeEnd = end
        return self
    }
}
