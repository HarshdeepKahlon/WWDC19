import Foundation
import UIKit


public class ChipDetailViewController: UIViewController {
    var chipView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Apple A12"
        navigationItem.backBarButtonItem?.title = "Chip Map"
        addBackgroundWithBlur(view: view)
        var mainString = ""
        var secondString = ""
        switch selectedChip {
        case .bigCPU:
            mainString = "Vortex Cores"
            secondString = "Custom Designed CPU"
        case .GPU:
            mainString = "4-Core GPU"
            secondString = "Custom Designed GPU"
        default:
            break
        }
        
        let siliconText = NSMutableAttributedString(string: "\(secondString)\n", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)])
        siliconText.append(NSMutableAttributedString(string: mainString, attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 60)]))
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 170))
        titleLabel.attributedText = siliconText
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor(red:1.00, green:0.27, blue:0.27, alpha:1.0)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.5)
        titleLabel.layer.cornerRadius = 5
        titleLabel.clipsToBounds = true
        view.addSubview(titleLabel)
        
        descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 500))
        descriptionLabel.text = """
        • Apple's Own Custom Design
        
        
        • Contains 4 GPU Cores
        
        
        • 50% faster performance compared to the A11's GPU
        """
        descriptionLabel.font = UIFont(name: "Helvetica", size: 25)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 10
        view.addSubview(descriptionLabel)
        
        var chipImage = UIImage(named: "A-Series Chips/A4Chip.jpg")
        chipImage = scaleUIImageToSize(image: chipImage!, size: CGSize(width: 180, height: 180))
        chipView = UIImageView(image: chipImage)
        chipView.layer.cornerRadius = 20
        chipView.clipsToBounds = true
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chipView.center.x = view.center.x
        chipView.center.y += 190
        titleLabel.center.x = view.center.x
        titleLabel.center.y += 20
        descriptionLabel.center.y = view.center.y + 10
        descriptionLabel.center.x += 11
    }
    
}
