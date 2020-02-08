import UIKit
import Alamofire
import AlamofireImage


class AlbumDetailVC: UIViewController{
    
    

    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var releasedYear: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var albumTextField: UITextField!
    @IBOutlet weak var trackView: UITableView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var biography: UITextView!
    var tracks = [TrackDetailResponse]()
    var abdi = [AlbumShortResponse]()
    var albums: AlbumShortResponse!
    @IBOutlet weak var thumb: UIImageView!
    
    var album: AlbumDetailResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackView.delegate = self
        trackView.dataSource = self
        albumName.text = album.albumName
        releasedYear.text = album.releasedYear
        genre.text = album.genre
    }
    
    @IBAction func onSearchAlbum(_ sender: Any) {
        ApiManager.shared.getAlbumTracks(albumID: album.albumID, success: { (response) in
            self.tracks = response.track
            self.trackView.reloadData()
        }) {
            print("Error")
        }
    }
    @IBAction func search(_ sender: Any) {
        ApiManager.shared.getAlbumByName(albumName: albumNameLabel.text!, success: { (response) in
            print(response)
        }) {
            print("Error")
        }
    }
    
    
}


extension AlbumDetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 1
        switch tableView {
        case trackView:
            row = tracks.count
        default:
            print("error")
        }
        return row
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch tableView {
        case trackView:
            cell.textLabel?.text = tracks[indexPath.row].trackName
        default:
            print("Error")
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "TrackToDetails",
            let destination = segue.destination as? TrackDetailVC,
            let track = trackView.indexPathForSelectedRow?.row
        {
            destination.track = tracks[track]
        }
    }
}

extension AlbumDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case trackView:
            performSegue(withIdentifier: "TrackToDetails", sender: tracks[indexPath.row])
        default:
            print("Error")
        }
    }
}


