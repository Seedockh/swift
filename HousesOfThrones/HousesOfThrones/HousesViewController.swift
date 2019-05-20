import UIKit

class HousesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var houseList: [House] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        fetchHouses()
    }
    
    func fetchHouses() {
        RequestManager.getHouses(success: { datas in
            let decoder = JSONDecoder()
            self.houseList = (try? decoder.decode([House].self, from: datas)) ?? []
            self.tableView.reloadData()
        }) { error in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let houseCell = tableView.dequeueReusableCell(withIdentifier: "HouseCell",for:indexPath) as? HouseViewCell {
            houseCell.displayInfos(withHouse: houseList[indexPath.row])
            return houseCell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharactersSegue" {
            if let charactersVC = segue.destination as? CharactersViewController, let indexPath = tableView.indexPathForSelectedRow {
                charactersVC.houseName = houseList[indexPath.row].name
            }
        }
    }
}
