import Foundation
import UIKit


public class ChipDetailViewController: UIViewController {
    var chipView: ImageZoomView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var helpLabel: UILabel!

    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Apple A12"
        addBackgroundWithBlur(view: view)
        var mainString = ""
        var secondString = ""
        var firstBullet = ""
        var secondBullet = ""
        var thirdBullet = ""
        var chipImage = UIImage(named: "A12EmptyDie.jpg")
        
        // Sets up the view's labels and image
        switch selectedChip {
        case .bigCPU:
            mainString = "2 Vortex Cores"
            secondString = "Powerful Cores"
            chipImage = UIImage(named: "Die Components/BigCores.jpg")
            firstBullet = "2 cores clocked at 2.4 GHz"
            secondBullet = "15% faster than the A11"
            thirdBullet = "40% more efficient than the A11"
        case.smallCPU:
            mainString = "4 Tempest Cores"
            secondString = "High Efficiency Cores"
            chipImage = UIImage(named: "Die Components/SmallCores.jpg")
            firstBullet = "4 cores clocked at 1.58 GHz"
            secondBullet = "Able to run concurrently with Vortex Cores"
            thirdBullet = "50% lower power than the A11"
        case .GPU:
            mainString = "4-Core GPU"
            secondString = "Custom Designed GPU"
            chipImage = UIImage(named: "Die Components/GPU.jpg")
            firstBullet = "4 cores compared to the A11's 3 cores"
            secondBullet = "50% faster than the A11's GPU"
            thirdBullet = "Around 0.5 - 1.0 teraFLOPS"
        case.cache:
            mainString = "SRAM Cache"
            secondString = "System Cache"
            chipImage = UIImage(named: "Die Components/Cache.jpg")
            firstBullet = "SoC-wide cache layer"
            secondBullet = "Double the size of the A11's Cache"
            thirdBullet = "Saves power by not accessing DRAM"
        case.NPU:
            mainString = "8-Core NPU"
            secondString = "Dedicated Neural Engine"
            chipImage = UIImage(named: "Die Components/NPU.jpg")
            firstBullet = "6 more cores than the A11's NPU"
            secondBullet = "5 TOPS - 8x increase over A11"
            thirdBullet = "Enables Smart HDR"
        case.DDR:
            mainString = "DDR4 Controller"
            secondString = "RAM Logic"
            chipImage = UIImage(named: "Die Components/DDR.jpg")
            firstBullet = "Supports 4 GB LPDDR4X"
            secondBullet = "Communicates between DRAM and SoC"
            thirdBullet = "RAM is layered over the SoC"
        case.node:
            mainString = "7nm Process"
            secondString = "Low Power and High Density"
            chipImage = UIImage(named: "Die Components/7nm.jpeg")
            firstBullet = "World's first 7 nanometer chip"
            secondBullet = "60% denser compared to 10nm"
            thirdBullet = "20% faster + 40% lower power"
        }
        
        let siliconText = NSMutableAttributedString(string: "\(secondString)\n", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!])
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
        • \(firstBullet)
        
        
        • \(secondBullet)
        
        
        • \(thirdBullet)
        """
        descriptionLabel.font = UIFont(name: "Helvetica", size: 25)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 10
        view.addSubview(descriptionLabel)
        
        chipImage = scaleUIImageToSize(image: chipImage!, size: CGSize(width: chipImage!.size.width * 4, height: chipImage!.size.height * 4))
        chipView = ImageZoomView(frame: CGRect(x: 0, y: 0, width: 200, height: 150), image: chipImage!)
        chipView.layer.cornerRadius = 5
        view.addSubview(chipView)
        
        helpLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        helpLabel.text = "Double tap to zoom in!"
        helpLabel.textColor = .white
        helpLabel.textAlignment = .center
        view.addSubview(helpLabel)

    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chipView.center.x = view.center.x
        chipView.center.y += 510
        helpLabel.center.x = view.center.x
        helpLabel.center.y += 630
        titleLabel.center.x = view.center.x
        titleLabel.center.y += 20
        descriptionLabel.center.y = view.center.y + 5
        descriptionLabel.center.x += 11
    }
    
}
