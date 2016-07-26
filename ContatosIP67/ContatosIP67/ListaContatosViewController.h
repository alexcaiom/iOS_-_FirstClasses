//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FormularioContatoViewController.h"
#import "FormularioContatoViewControllerDelegate.h"
#import "ContatoDAO.h"
#import "Contato.h"
#import "GerenciadorDeAcoes.h"

@interface ListaContatosViewController  : UITableViewController <FormularioContatoViewControllerDelegate,  UIActionSheetDelegate>

@property (weak) id<FormularioContatoViewControllerDelegate> delegate;
@property Contato* contatoSelecionado;
@property ContatoDAO* contatoDAO;
@property NSInteger numeroDeSessoes;
@property NSInteger posicao;
@property (readonly) GerenciadorDeAcoes* gerenciador;

@end
