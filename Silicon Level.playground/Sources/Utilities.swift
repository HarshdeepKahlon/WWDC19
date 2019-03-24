import Foundation
import UIKit
import CoreImage

// Allows for the 360 degree rotations on the home screen.
public extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 2.0) {
        let rotateAnimation = CASpringAnimation(keyPath: "transform.rotation")
        rotateAnimation.damping = 30
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

// Scales images to any CGSize.
public func scaleUIImageToSize(image: UIImage, size: CGSize) -> UIImage {
    let hasAlpha = false
    let scale: CGFloat = 0.0
    
    UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
    image.draw(in: CGRect(origin: CGPoint.zero, size: size))
    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage!
}

public func addBackgroundWithBlur(view: UIView) {
    let background = UIImage(named: "SkylakeDie.jpg")
    let backgroundImageView = UIImageView(frame: view.bounds)
    backgroundImageView.clipsToBounds = true
    backgroundImageView.image = background
    backgroundImageView.center = view.center
    view.addSubview(backgroundImageView)
    view.sendSubviewToBack(backgroundImageView)
    
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview(blurEffectView)
}

// Enum for the parts of the A12 system on a chip.
public enum SOCComponents {
    case smallCPU, bigCPU, GPU, NPU, DDR, Node
}
