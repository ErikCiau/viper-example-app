//
//  ProfileListVC.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 23/11/22.
//

import UIKit

class ProfileListVC: UIViewController {
    var presenter: ProfileListPresenterProtocol?
    @IBOutlet var profileTableView: UITableView!

    private var profiles: [ProfileEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureNavbar()
        profileTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        profileTableView.delegate = self
        profileTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }

    private func configureNavbar() {
        title = "Perfiles"
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = true
        let addProfileButtonBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModalToAddProfile))
        navbar?.topItem?.setRightBarButton(addProfileButtonBar, animated: true)
    }

    @objc
    private func showModalToAddProfile() {
        presenter?.showProfileForm()
    }
}

extension ProfileListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileTableViewCell
        let profile = profiles[indexPath.row]
        cell.setData("\(profile.primerNombre) \(profile.segundoNombre)", "\(profile.apellidoPaterno) \(profile.apellidoMaterno)")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profile = profiles[indexPath.row]
        presenter?.showProfileDetail(profile: profile)
    }
}

extension ProfileListVC: ProfileListViewProtocol {
    func showProfiles(_ profiles: [ProfileEntity]) {
        self.profiles = profiles
        profileTableView.reloadData()
    }
}
