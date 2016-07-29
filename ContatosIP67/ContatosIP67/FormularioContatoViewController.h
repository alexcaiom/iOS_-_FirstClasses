//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 18/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Contato.h"
#import "ContatoDAO.h"
#import "FormularioContatoViewControllerDelegate.h"

@interface FormularioContatoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
    //tudo que esta aqui eh publico
 @property IBOutlet UITextField *nome;
 @property IBOutlet UITextField *telefone;
 @property IBOutlet UITextField *endereco;
 @property IBOutlet UITextField *email;
 @property IBOutlet UITextField *site;
 @property IBOutlet UIButton *botaoFoto;

 @property IBOutlet UITextField *latitude;
 @property IBOutlet UITextField *longitude;

 @property IBOutlet UIActivityIndicatorView *loading;

 @property ContatoDAO* contatoDAO;
 @property Contato* contato;


 - (void) imprimirContato : (Contato*) contato;


@end

