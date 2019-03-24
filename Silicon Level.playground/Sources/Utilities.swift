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

// Adds a blurred background to any view.
public func addBackgroundWithBlur(view: UIView) {
    let background = UIImage(named: "7980Die.jpg")
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
    case smallCPU, bigCPU, GPU, NPU, DDR, node, cache
}

// Allows for interactive image views.
public class ImageZoomView: UIScrollView, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var gestureRecognizer: UITapGestureRecognizer!
    
    public convenience init(frame: CGRect, image: UIImage?) {
        self.init(frame: frame)
        
        var imageToUse: UIImage
        
        if let image = image {
            imageToUse = image
        } else {
            imageToUse = UIImage(named: "A12EmptyDie.png")!
            imageToUse = scaleUIImageToSize(image: imageToUse, size: CGSize(width: imageToUse.size.width/3.6, height: imageToUse.size.height/3))
        }
        
        // Creates the image view and adds it as a subview to the scroll view
        imageView = UIImageView(image: imageToUse)
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        setupScrollView(image: imageToUse)
        setupGestureRecognizer()
    }
    
    // Sets the scroll view delegate and zoom scale limits.
    // Change the `maximumZoomScale` to allow zooming more than 2x.
    public func setupScrollView(image: UIImage) {
        delegate = self
        minimumZoomScale = 1.0
        maximumZoomScale = 2.0
    }
    
    // Sets up the gesture recognizer that receives double taps to auto-zoom
    public func setupGestureRecognizer() {
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        gestureRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(gestureRecognizer)
    }
    
    // Handles a double tap by either resetting the zoom or zooming to where was tapped
    @objc func handleDoubleTap() {
        if zoomScale == 1 {
            zoom(to: zoomRectForScale(maximumZoomScale, center: gestureRecognizer.location(in: gestureRecognizer.view)), animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }
    
    // Calculates the zoom rectangle for the scale
    public func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width = imageView.frame.size.width / scale
        let newCenter = convert(center, from: imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    // Tell the scroll view delegate which view to use for zooming and scrolling
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

