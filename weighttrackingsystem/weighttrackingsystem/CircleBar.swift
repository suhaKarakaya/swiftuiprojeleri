//
//  CircleBar.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import UIKit

class CircleBar: UIView {
    // First create two layer properties
    
    public var lineColor: UIColor = .white
    public var value: Double = 0
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var strokeColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: frame.size.width/2, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 6
        circleLayer.strokeColor = strokeColor.cgColor
//        circleLayer.strokeColor = UIColor.red.cgColor
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 6
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = lineColor.cgColor
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, stroke: UIColor? = nil) {
        progressLayer.strokeColor = lineColor.cgColor
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
//        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        if stroke != nil {
            circleLayer.strokeColor = stroke!.cgColor
        }
        
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}

