import UIKit
import Alamofire
import AlamofireImage


class MusicVideoVC: UIViewController {
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    var video: MusicVideoResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackName.text = video.trackName
        thumb.af_setImage(withURL: URL(string: video.thumbnail)!)
    }
    @IBAction func onPlayVideo(_ sender: Any) {
        UIApplication.shared.open(URL(string: video.link)! as URL, options: [:], completionHandler: nil)
    }
}
