/*
 ProtocolOrientedUIKit
 testler içinde aktif edildi
 -maini sildik hem info.plistten hemde ana klasörde info sekmesi ordan Main yazan yeri sildik çalıştırınca aynı mainler tekrar gelebilir sil yine aç düzseliyor
 */

import UIKit

//UserViewModelOutput ekledik
class UserViewController: UIViewController, UserViewModelOutput {
    
    //burdada verileri alıp gönderdik viewlere
    func updateView(name: String, email: String, userName: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.userNameLabel.text = userName
    }
    
    
    private let viewModel : UserViewModel
    

    
    private let nameLabel : UILabel = {
        let label = UILabel()
        //consraints leride kod ile verilcek için
        label.translatesAutoresizingMaskIntoConstraints = false
        //ortalıcak
        label.textAlignment = .center
        return label
    }()
    
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        //UIViewController da ayriyetten bişeyler eklencek
        super.init(nibName: nil, bundle: nil)
        //UserViewModelOutput eklediğimiz için kendimizde artık bir UserViewModelOutput olduğumuz için kendimize eşitliyoruz
        self.viewModel.output = self
    }
    
    //UIViewController da ayriyetten bişeyler eklencek (bulamazsa hata çıkartacağı işine yarıyormuş)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        //fetchUsers()
        //çağırmış olduk
        viewModel.fetchUsers()
        
    }
    
    //view yüklemeleri için genelde böle yazılırmış
    private func setupViews(){
        view.backgroundColor = .yellow
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        view.addSubview(emailLabel)
        
//        nameLabel .text = "namelabel"
//        userNameLabel .text = "usernamelabel"
//        emailLabel .text = "emaillabel"
        
        //Constraints vermek için
        NSLayoutConstraint.activate(
        //dizi şeklinde tanımlıcaz öle istiyor çünkü
            [
                //Anchor çapa demek mesel topAnchor üstü çapala bir nevi hizaya getir
                //burda tam ortada olmasını sağlar
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                //nameLabel yüksekliği 60 olcak demek
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                //nameLabel genişliği 200 olsun demek
                nameLabel.widthAnchor.constraint(equalToConstant: 200),
                //nameLabel üstten viewin üstüne 100 mesafe koyarak eşitledi
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                
                emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailLabel.heightAnchor.constraint(equalToConstant: 60),
                emailLabel.widthAnchor.constraint(equalToConstant: 200),
                //nameLabel.bottomAnchor namelabelin altına hizalayıp 10 bırakıcak
                emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                
                userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                userNameLabel.heightAnchor.constraint(equalToConstant: 60),
                userNameLabel.widthAnchor.constraint(equalToConstant: 200),
                userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            
            ]
            
        
        )
        
        nameLabel .text = "namelabel"
        userNameLabel .text = "usernamelabel"
        emailLabel .text = "emaillabel"
        
    }
    
    /*
    private func fetchUsers(){
        APIManager.shared.fetchUser { result in
            switch result {
            case.success(let user):
                self.userNameLabel.text = user.username
                self.emailLabel.text = user.email
                self.nameLabel.text = user.name
                //böylede yazılabilir
            case.failure:
                self.nameLabel.text = "No user Found"
            }
        }
    }
     */


}

