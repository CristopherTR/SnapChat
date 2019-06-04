//
//  iniciarSesionViewController.swift
//  Snapchat_Cristopher
//
//  Created by Cristopher Torres on 31/05/19.
//  Copyright © 2019 Cristopher Torres. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail:emailTextField.text!,password: passwordTextField.text!, completion: {(user, error) in
            print("Intentamos Iniciar Sesion")
            if error != nil {
                print("Tenemos el siguiente error:\(error)")
                Auth.auth().createUser(withEmail:self.emailTextField.text!,password: self.passwordTextField.text!, completion: {(user, error) in
                    print("Intentamos crear un usuario")
                    if error != nil{
                        print("Tenemos el siguiente error:\(error)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Inicio de Sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }

}

