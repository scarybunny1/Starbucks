//
//  RewardsGraphicView.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 03/10/22.
//

import UIKit

class RewardsGraphicView: UIView {

    let imageView = UIImageView()
    
    let initialFrameWidth: CGFloat = 200
    var actualFrameWidth: CGFloat?
    
    let height: CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        drawRewardsGraphic()
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func drawRewardsGraphic(){
        let frameWidth = actualFrameWidth ?? initialFrameWidth
        
        let padding: CGFloat = 20
        let dotSize: CGFloat = 12
        let lineWidth: CGFloat = 2
        let numberOfDots: CGFloat = 5
        let numberOfSections = numberOfDots - 1
        
        let spacingBetweenDots = (frameWidth - 2 * padding) / (numberOfSections + 0.5)
        let shortSegmentLength = spacingBetweenDots * 0.25
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: frameWidth, height: height))
        
        var dots: [CGPoint] = []
        let labels = ["25", "50", "150", "250", "400"]
        
        let indicatorOffset: CGFloat = 34
        let yOffset = (dotSize + lineWidth) / 2 + indicatorOffset
        
        let image = renderer.image { ctx in
            
            //Define our dots
            for index in 0...Int(numberOfSections){
                let x = padding + shortSegmentLength + (spacingBetweenDots * CGFloat(index))
                dots.append(CGPoint(x: x, y: yOffset))
            }
            
            //Define lines between dots
            ctx.cgContext.setLineWidth(lineWidth)
            ctx.cgContext.setStrokeColor(UIColor.systemGray4.cgColor)
            
            //Draw starting segment
            let firstShortSegmentBegin = padding
            let firstShortSegmentEnd = firstShortSegmentBegin + shortSegmentLength - dotSize / 2
            
            ctx.cgContext.move(to: CGPoint(x: firstShortSegmentBegin, y: yOffset))
            ctx.cgContext.addLine(to: CGPoint(x: firstShortSegmentEnd, y: yOffset))
            ctx.cgContext.strokePath()
            
            //Draw ending segment
            let lastShortSegmentEnd = frameWidth - padding
            let lastShortSegmentBegin = lastShortSegmentEnd - shortSegmentLength
            
            ctx.cgContext.move(to: CGPoint(x: lastShortSegmentBegin, y: yOffset))
            ctx.cgContext.addLine(to: CGPoint(x: lastShortSegmentEnd, y: yOffset))
            ctx.cgContext.strokePath()
            
            ctx.cgContext.addLines(between: dots)
            ctx.cgContext.strokePath()
            
            ctx.cgContext.setFillColor(UIColor.white.cgColor)
            
            //Draw our dots
            for dot in dots{
                let dotBounds = CGRect(x: dot.x - (dotSize * 0.5), y: dot.y - (dotSize * 0.5), width: dotSize, height: dotSize)
                ctx.cgContext.addEllipse(in: dotBounds)
                ctx.cgContext.drawPath(using: CGPathDrawingMode.fillStroke)
            }
            
            //Draw points consumed
            let pointsConsumedStart = firstShortSegmentBegin
            let pointsConsumedEnd = padding + shortSegmentLength / 2
            
            ctx.cgContext.setStrokeColor(UIColor.starYellow.cgColor)
            
            ctx.cgContext.move(to: CGPoint(x: pointsConsumedStart, y: yOffset))
            ctx.cgContext.addLine(to: CGPoint(x: pointsConsumedEnd, y: yOffset))
            ctx.cgContext.strokePath()
            
            //Draw green indicator
            let indicatorX = pointsConsumedEnd - 8
            let indicatorY = yOffset - 36
            
            let indicator = UIImage(named: "green-indicator")
            indicator?.draw(at: CGPoint(x: indicatorX, y: indicatorY))
            
            //Draw labels
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.preferredFont(forTextStyle: .footnote),
                .paragraphStyle: paragraphStyle
            ]
            
            for (i, dot) in dots.enumerated(){
                let string = labels[i]
                
                let attributedString = NSAttributedString(string: string, attributes: attrs)
                attributedString.draw(with: CGRect(x: dot.x - 15, y: dot.y + 25, width: 30, height: 20), context: nil)
            }
        }
        
        imageView.image = image
    }

}
