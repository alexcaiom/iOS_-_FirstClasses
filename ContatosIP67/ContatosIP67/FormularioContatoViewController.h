//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 18/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDAO.h"
#import "FormularioContatoViewControllerDelegate.h"

@interface FormularioContatoViewController : UIViewController <FormularioContatoViewControllerDelegate>
    //tudo que esta aqui eh publico
 @property IBOutlet UITextField *nome;
 @property IBOutlet UITextField *telefone;
 @property IBOutlet UITextField *endereco;
 @property IBOutlet UITextField *email;
 @property IBOutlet UITextField *site;
 //@property IBOutlet

 @property ContatoDAO* contatoDAO;
 @property Contato* contato;

 - (void) imprimirContato : (Contato*) contato;


@end
