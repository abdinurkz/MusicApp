import UIKit


let defaults = UserDefaults(suiteName: "com.MusicApp")

class HomeViewController: UIViewController {
    
    @IBOutlet weak var artistView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tracksView: UITableView!
    @IBOutlet weak var albumView: UITableView!
    
    var details = [ArtistDetailResponse]()
    var tracks = [TrackDetailResponse]()
    var albums = [AlbumDetailResponse]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistView.delegate = self
        tracksView.delegate = self
        albumView.delegate = self
        artistView.dataSource = self
        tracksView.dataSource = self
        albumView.dataSource = self
    }
    

    @IBAction func onGetTapped() {
        ApiManager.shared.getArtists(artistName: searchTextField.text!, success: { (response) in
            self.details = response.artist
            self.artistView.reloadData()
        }) {
            print("Error")
        }
        ApiManager.shared.getTopTracks(artistName: searchTextField.text!, success: { (response) in
            self.tracks = response.track
            self.tracksView.reloadData()
        }) {
            print("Error")
        }
        ApiManager.shared.getAlbums(artistName: searchTextField.text!, success: { (response) in
            self.albums = response.album
            self.albumView.reloadData()
        }) {
            print("Error")
        }
    }
    
    @IBAction func addToFav(_ sender: Any) {
        if (searchTextField.text != "") {
            artistList.append(searchTextField.text!)
            defaults?.set(artistList, forKey: "savedData")
            defaults?.synchronize()
        }
    }
    

    
}





extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 1
        switch tableView {
        case artistView:
            row = details.count
        case tracksView:
            row = tracks.count
        case albumView:
            row = albums.count
        default:
            print("error")
        }
        return row
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch tableView {
        case artistView:
            cell.textLabel?.text = details[indexPath.row].artistName
        case tracksView:
            cell.textLabel?.text = tracks[indexPath.row].trackName
        case albumView:
            cell.textLabel?.text = albums[indexPath.row].albumName
        default:
            print("Error")
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "ArtistToDetails",
            let destination = segue.destination as? DetailsVC,
            let person = artistView.indexPathForSelectedRow?.row
        {
            destination.person = details[person]
        }
        if  segue.identifier == "TrackToDetails",
            let destination = segue.destination as? TrackDetailVC,
            let track = tracksView.indexPathForSelectedRow?.row
        {
            destination.track = tracks[track]
        }
        if  segue.identifier == "AlbumToDetails",
            let destination = segue.destination as? AlbumDetailVC,
            let album = albumView.indexPathForSelectedRow?.row
        {
            destination.album = albums[album]
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case artistView:
            performSegue(withIdentifier: "ArtistToDetails", sender: details[indexPath.row])
        case tracksView:
            performSegue(withIdentifier: "TrackToDetails", sender: tracks[indexPath.row])
        case albumView:
            performSegue(withIdentifier: "AlbumToDetails", sender: albums[indexPath.row])
        default:
            print("Error")
        }
    }
}
