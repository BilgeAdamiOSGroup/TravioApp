//
//  TermsOfUseVC.swift
//  TravioApp
//
//  Created by Elif Poyraz on 9.09.2023.
//

import UIKit
import TinyConstraints

class TermsOfUseVC: MainViewController {

    let termsOfUseVM = TermsOfUseVM()
    
    private lazy var lblPageTitle: UICustomLabel = {
        let lbl = UICustomLabel(labelType: .pageNameHeader(text: "Terms Of Use"))
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var btnBack: UICustomButtonBack = {
        let bt = UICustomButtonBack()
        bt.addTarget(self, action: #selector(goPopView), for: .touchUpInside)
        return bt
    }()
    private lazy var svNavigationBar: UIStackView = {
        let sv = UIStackView()
        sv.addArrangedSubview(btnBack)
        sv.addArrangedSubview(lblPageTitle)
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.spacing = 30
        sv.axis = .horizontal
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout(backGroundMultiplier: CGFloat = 0.82) {
        super.setupLayout(backGroundMultiplier: backGroundMultiplier)
        self.navigationController?.isNavigationBarHidden = true
        
        addSubviews()
        
        svNavigationBar.topToSuperview(offset: 19,usingSafeArea: true)
        svNavigationBar.edgesToSuperview(excluding: [.top,.bottom],insets: .left(20) + .right(20))
        
    }
    
    override func addSubviews() {
        super.addSubviews()
        self.view.addSubview(svNavigationBar)
    }
    
    @objc func goPopView(){
        self.navigationController?.popViewController(animated: true)
    }
    

}