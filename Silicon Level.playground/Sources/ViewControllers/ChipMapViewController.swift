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
        // Sets up the scroll view with the A12 Die
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 851))
        let image = UIImage(named: "A12EmptyDie.png")!
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
        
        // GPU Button
        GPUButton = UIButton(frame: CGRect(x: 760, y: 430, width: 160, height: 160))
        GPUButton.backgroundColor = UIColor(red:1.00, green:0.36, blue:0.36, alpha:1.0)
        GPUButton.setTitle("GPU Cores", for: .normal)
        
        // Small CPU Button
        smallCPUButton = UIButton(frame: CGRect(x: 550, y: 700, width: 150, height: 150))
        smallCPUButton.backgroundColor = UIColor(red:0.36, green:0.57, blue:0.30, alpha:1.0)
        smallCPUButton.setTitle("Small CPU Cores", for: .normal)
        
        // Big CPU Button
        bigCPUButton = UIButton(frame: CGRect(x: 300, y: 630, width: 150, height: 150))
        bigCPUButton.backgroundColor = UIColor(red:0.00, green:0.90, blue:0.64, alpha:1.0)
        bigCPUButton.setTitle("Big CPU Cores", for: .normal)
        
        // NPU Button
        NPUButton = UIButton(frame: CGRect(x: 60, y: 600, width: 140, height: 140))
        NPUButton.backgroundColor = UIColor(red:0.51, green:0.39, blue:1.00, alpha:1.0)
        NPUButton.setTitle("Neural Engine", for: .normal)
        
        // Cache Button
        L3Button = UIButton(frame: CGRect(x: 550, y: 400, width: 100, height: 100))
        L3Button.backgroundColor = UIColor.magenta
        L3Button.setTitle("Cache", for: .normal)

        // DDR Controller Button
        DDRButton = UIButton(frame: CGRect(x: 100, y: 25, width: 140, height: 50))
        DDRButton.backgroundColor = .gray
        DDRButton.setTitle("RAM Logic", for: .normal)

        // Process Node Button
        processButton = UIButton(frame: CGRect(x: 100, y: 250, width: 140, height: 140))
        processButton.backgroundColor = UIColor(red:1.00, green:0.52, blue:0.07, alpha:1.0)
        processButton.setTitle("Process Node", for: .normal)

        let buttons: [UIButton] = [smallCPUButton, GPUButton, bigCPUButton, NPUButton, L3Button, DDRButton, processButton]

        // Adjusts the appearance of the buttons
        for button in buttons {
            button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 17)
            button.layer.cornerRadius = 10
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 10, height: 10)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 1.5
            button.layer.masksToBounds = false
            button.addTarget(self, action: #selector(componentButtonSelected(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
        
        // Animation
        UIView.animate(withDuration: 3.0) {
            self.scrollView.contentOffset = CGPoint(x: 300, y: 300)
        }
        
        self.navigationItem.title = "Chip Floorplan"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(finishAction(sender:)))
    }
    
    
    
    @objc func componentButtonSelected(sender: UIButton!) {
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
            selectedChip = .node
        case L3Button:
            selectedChip = .cache
        default:
            break
        }
        // Tells the user if the given button was already viewed
        if sender.titleLabel!.numberOfLines < 2 {
            let buttonText = NSMutableAttributedString(string: "\(sender.titleLabel!.text!)\n")
            buttonText.append(NSMutableAttributedString(string: "Viewed", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 10)]))
            sender.titleLabel?.numberOfLines = 2
            sender.titleLabel?.textAlignment = .center
            sender.setAttributedTitle(buttonText, for: .normal)
        }
        let viewController = ChipDetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func finishAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Are you finished viewing the A12?", message: "It's recommended that you view each component.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "I'm Done", style: .default, handler: { (_) in
            let viewController = FinalViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Not Yet", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

    }
    
    // Allows for the parallax effect when the view is scrolling
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = self.scrollView.contentOffset.y * 0.15
        let xOffset = self.scrollView.contentOffset.x * 0.15
        imageView.center.y = yOffset + 450
        imageView.center.x = xOffset + 450
    }
}

