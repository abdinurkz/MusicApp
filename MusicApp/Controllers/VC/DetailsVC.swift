import UIKit
import Alamofire
import AlamofireImage


class DetailsVC: UIViewController {
    var details = [ArtistDetailResponse]()
    
    @IBOutlet weak var musicView: UITableView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var bornYear: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    var person: ArtistDetailResponse!
    
    var musicVideos = [MusicVideoResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        musicView.delegate = self
        musicView.dataSource = self
        artistName.text = person.artistName
        bornYear.text = person.bornYear
        genre.text = person.genre
        website.text = person.website
        biography.text = person.biography
        thumb.af_setImage(withURL: URL(string: person.thumb)!)
        logo.af_setImage(withURL: URL(string: person.logo)!)
        
    }
    @IBAction func showVideos(_ sender: Any) {
        ApiManager.shared.getMusicVideos(artistID: person.artistID, success: { (response) in
            self.musicVideos = response.musicVideo
            self.musicView.reloadData()
        }) {
            print("Error")
        }
    }
    
    

}

extension DetailsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 1
        switch tableView {
        case musicView:
            row = musicVideos.count
        default:
            print("error")
        }
        return row
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch tableView {
        case musicView:
            cell.textLabel?.text = musicVideos[indexPath.row].trackName
        default:
            print("Error")
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "ShowMusicList",
            let destination = segue.destination as? MusicVideoVC,
            let video = musicView.indexPathForSelectedRow?.row
        {
            destination.video = musicVideos[video]
        }
    }
}
extension DetailsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case musicView:
            performSegue(withIdentifier: "ShowMusicList", sender: musicVideos[indexPath.row])
        default:
            print("Error")
        }
    }
}
