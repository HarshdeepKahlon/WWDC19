import Foundation
import UIKit

public var selectedChip: SOCComponents = .bigCPU

public class ChipMapViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var GPUButton: UIButton!
    var smallCPUButton: UIButton!
    var bigCPUButton: UIButton!
    var NPUButton: UIButton!
    var L3Button: UIButton!
    var DDRButton: UIButton!
    var processButton: UIButton!
    
    public override func viewDidLoad() {
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 851))
        var image = UIImage(named: "A12EmptyDie.png")!
        imageView = UIImageView(image: image)
        contentView.addSubview(imageView)
        
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.contentSize = contentView.frame.size
        scrollView.addSubview(contentView)
        scrollView.flashScrollIndicators()
        scrollView.backgroundColor = .black
        scrollView.indicatorStyle = .white
        scrollView.contentOffset = CGPoint(x: 100, y: 100)
        self.view = scrollView
        
        
        GPUButton = UIButton(frame: CGRect(x: 760, y: 430, width: 160, height: 160))
        GPUButton.backgroundColor = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.0)
        GPUButton.setTitle("GPU Cores", for: .normal)
        
        smallCPUButton = UIButton(frame: CGRect(x: 550, y: 700, width: 150, height: 150))
        smallCPUButton.backgroundColor = UIColor(red:0.16, green:0.87, blue:0.50, alpha:1.0)
        smallCPUButton.setTitle("Small CPU Cores", for: .normal)
        
        bigCPUButton = UIButton(frame: CGRect(x: 300, y: 630, width: 150, height: 150))
        bigCPUButton.backgroundColor = UIColor(red:0.15, green:0.65, blue:0.34, alpha:1.0)
        bigCPUButton.setTitle("Big CPU Cores", for: .normal)
        
        NPUButton = UIButton(frame: CGRect(x: 60, y: 600, width: 140, height: 140))
        NPUButton.backgroundColor = UIColor(red:0.51, green:0.39, blue:1.00, alpha:1.0)
        NPUButton.setTitle("Neural Engine", for: .normal)
        
        L3Button = UIButton(frame: CGRect(x: 550, y: 400, width: 100, height: 100))
        L3Button.backgroundColor = UIColor.magenta
        L3Button.setTitle("Cache", for: .normal)

        DDRButton = UIButton(frame: CGRect(x: 100, y: 25, width: 140, height: 50))
        DDRButton.backgroundColor = .gray
        DDRButton.setTitle("DDR Controller", for: .normal)

        processButton = UIButton(frame: CGRect(x: 100, y: 250, width: 140, height: 140))
        processButton.backgroundColor = UIColor(red:1.00, green:0.52, blue:0.07, alpha:1.0)
        processButton.setTitle("Process Node", for: .normal)

        let buttons: [UIButton] = [smallCPUButton, GPUButton, bigCPUButton, NPUButton, L3Button, DDRButton, processButton]

        for button in buttons {
            button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 17)
            button.layer.cornerRadius = 15
            //button.layer.borderWidth = 0.5
            //button.addBlurEffect()
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 10, height: 10)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 1.5
            button.layer.masksToBounds = false

            button.addTarget(self, action: #selector(componentButtonSelected(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
        
        
        UIView.animate(withDuration: 3.0) {
            self.scrollView.contentOffset = CGPoint(x: 300, y: 300)
        }
        
        self.navigationItem.title = "Drag to Navigate"
    }
    
    
    @objc func componentButtonSelected(sender: UIButton!) {
        let viewController = ChipDetailViewController()
        switch sender {
        case bigCPUButton:
            selectedChip = .bigCPU
        case smallCPUButton:
            selectedChip = .smallCPU
        case GPUButton:
            selectedChip = .GPU
        case NPUButton:
            selectedChip = .NPU
        case DDRButton:
            selectedChip = .DDR
        case processButton:
            selectedChip = .Node
        default:
            break
        }
        sender.alpha = 0.8
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = self.scrollView.contentOffset.y * 0.1
        let xOffset = self.scrollView.contentOffset.x * 0.1
        imageView.center.y = yOffset + 450
        imageView.center.x = xOffset + 450
    }
}

