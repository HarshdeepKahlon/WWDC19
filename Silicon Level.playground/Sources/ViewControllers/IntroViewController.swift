import Foundation
import UIKit

public class IntroViewController: UIViewController {
    var titleLabel: UILabel!
    var button: UIButton!
    var chipView: UIButton!
    var chipArray: [UIImage]!
    var helpLabel: UILabel!
    var currentChip = 0

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundWithBlur(view: view)
        
        // Get Started Button
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        button.layer.cornerRadius = 10
        button.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin]
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.5)
        button.addTarget(self, action: #selector(nextButtonPressed(sender:)), for: .touchUpInside)
        view.addSubview(button)
        
        // Title Label
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 220))
        let siliconText = NSMutableAttributedString(string: "Silicon\n", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 60)])
        siliconText.append(NSMutableAttributedString(string: "Level\n", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 60)]))
        siliconText.append(NSMutableAttributedString(string: "An Overview of the A12", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)]))
        titleLabel.attributedText = siliconText
        titleLabel.numberOfLines = 3
        titleLabel.textColor = UIColor(red:1.00, green:0.27, blue:0.27, alpha:1.0)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.5)
        titleLabel.layer.cornerRadius = 5
        titleLabel.clipsToBounds = true
        view.addSubview(titleLabel)
        
        // Help Label
        helpLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        helpLabel.text = "Tap to view the history of Apple's A-Series!"
        helpLabel.textColor = .white
        helpLabel.textAlignment = .center
        view.addSubview(helpLabel)
        
        // A-Series Chip Images
        chipArray = []
        for i in 4...12 {
            chipArray.append(UIImage(named: "A-Series Chips/A\(i)Chip.jpg")!)
        }
        chipView = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        chipView.setImage(UIImage(named: "A-Series Chips/A12Chip.jpg"), for: .normal)
        chipView.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        chipView.imageView?.layer.cornerRadius = 10
        chipView.imageView?.clipsToBounds = true;
        view.addSubview(chipView)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center.x = view.center.x
        button.center.y -= 15
        chipView.center.x = view.center.x
        chipView.center.y += 140
        helpLabel.center.x = view.center.x
        helpLabel.center.y += 240
        titleLabel.center.x = view.center.x
    }

    @objc func nextButtonPressed(sender: UIButton!) {
        let viewController = DirectionsViewController()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // Moves to the next A-Series Chip with an animation
    @objc func buttonPressed(sender: UIButton) {
        UIView.transition(with: sender, duration: 1.0, options: .transitionFlipFromBottom, animations: {
            sender.setImage(self.chipArray[self.currentChip], for: .normal)
            self.helpLabel.alpha = 0
        }, completion: nil)
        if currentChip >= 8 {
            currentChip = 0
        } else { currentChip += 1 }
    }

}


