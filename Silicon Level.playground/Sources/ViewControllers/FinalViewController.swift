import Foundation
import UIKit

public class FinalViewController: UIViewController {
    var titleLabel: UILabel!
    var thoughtsLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundWithBlur(view: view)
        
        // Title Label
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 600, height: 160))
        let siliconText = (NSMutableAttributedString(string: "Thanks\n", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 60)]))
        siliconText.append(NSMutableAttributedString(string: "I hope you enjoyed the playground!", attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)]))
        titleLabel.attributedText = siliconText
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor(red:1.00, green:0.27, blue:0.27, alpha:1.0)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.5)
        titleLabel.layer.cornerRadius = 5
        titleLabel.clipsToBounds = true
        view.addSubview(titleLabel)
        
        // Thoughts Label
        thoughtsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 600))
        thoughtsLabel.font = UIFont(name: "Helvetica Bold", size: 20)
        thoughtsLabel.textColor = .white
        thoughtsLabel.numberOfLines = 20
        let attributedString = NSMutableAttributedString(string: """
        This playground was created by someone
        who is passionate about processors and
        graphics. The Apple A12 Bionic is one of
        the most advanced chips on the planet, and
        I hope that you discovered the true power
        that lies behind the latest iOS devices!

        I'm Harshdeep Kahlon and I live in a city
        called Scranton (from The Office). I hope
        to expand the tech outreach of this city
        since it has been underserved since the
        coal mining days. Winning this award wouldn't
        just mean the world to me, but it would also
        greatly help my family and university see
        the true potential of technology with
        computer science!
        """)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        thoughtsLabel.attributedText = attributedString
        thoughtsLabel.textAlignment = .center
        view.addSubview(thoughtsLabel)
    }
    
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.center.x = view.center.x
        titleLabel.center.y += 13
        thoughtsLabel.center = view.center
        thoughtsLabel.center.y += 60
    }
    
    
}


