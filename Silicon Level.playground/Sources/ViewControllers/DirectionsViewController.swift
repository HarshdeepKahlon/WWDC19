import Foundation
import UIKit

public class DirectionsViewController: UIViewController {
    var button: UIButton!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    public override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundWithBlur(view: view)
        
        // Next Button
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        button.layer.cornerRadius = 10
        button.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin]
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.5)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        view.addSubview(button)
        
        // Title Label
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 170))
        let siliconText = NSMutableAttributedString(string: "By Harshdeep in Scranton\n", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)])
        siliconText.append(NSMutableAttributedString(string: "Get Started", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 60)]))
        titleLabel.attributedText = siliconText
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor(red:1.00, green:0.27, blue:0.27, alpha:1.0)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.5)
        titleLabel.layer.cornerRadius = 5
        titleLabel.clipsToBounds = true
        view.addSubview(titleLabel)
        
        // Description Label
        descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 500))
        descriptionLabel.text = """
        • Explore Apple's A12 chip, which is used
          across their iPhone and iPad lines.
        
        
        • Navigate through the A12 silicon die
          by tapping each component.
        
        
        • Make sure to explore each component!
        """
        descriptionLabel.font = UIFont(name: "Helvetica", size: 25)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 10
        view.addSubview(descriptionLabel)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center.x = view.center.x
        button.center.y -= 30
        titleLabel.center.x = view.center.x
        titleLabel.center.y += 20
        descriptionLabel.center.y = view.center.y + 10
        descriptionLabel.center.x += 11
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let viewController = ChipMapViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}



