import UIKit

var artistList = [String]()

class ViewController: UIViewController {
    
    var details = [ArtistDetailResponse]()
    
    @IBOutlet weak var artistsTableView: UITableView!
    let textCellIdentifier = "cell"
    
    

    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    func getData() {
        let data = defaults?.object(forKey: "savedData") as? [String]
        if data != nil {
            artistList = data!
        } else {}
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (artistList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = artistList[indexPath.row]
        return(cell)
    }
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            artistList.remove(at: indexPath.row)
            artistsTableView.deleteRows(at: [indexPath], with: .fade)
            artistsTableView.reloadData()
        }
    } 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "ArtistToDetails2",
            let destination = segue.destination as? DetailsVC,
            let person = artistsTableView.indexPathForSelectedRow?.row
        {
            print(person)
            print(artistList.count)
            destination.person = details[person]
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           switch tableView {
           case artistsTableView:
            performSegue(withIdentifier: "ArtistToDetails2", sender: artistList[indexPath.row])
           default:
               print("Error")
           }
       }
}
