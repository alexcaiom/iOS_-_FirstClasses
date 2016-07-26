//
//  FormularioContatoViewControllerDelegate.h
//  ContatosIP67
//
//  Created by ios6233 on 22/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@protocol FormularioContatoViewControllerDelegate <NSObject>

-(void) contatoAdicionado : (Contato*) contato;
-(void) contatoAtualizado : (Contato*) contato;

@end
