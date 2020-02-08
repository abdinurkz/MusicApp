import UIKit
import Alamofire
import AlamofireImage


class TrackDetailVC: UIViewController {
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var mood: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    var track: TrackDetailResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackName.text = track.trackName
        albumName.text = track.albumName
        duration.text = track.duration
        genre.text = track.genre
        mood.text = track.mood
        thumb.af_setImage(withURL: URL(string: track.thumb)!)
    }
}
