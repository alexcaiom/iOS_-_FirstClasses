//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios6233 on 25/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

- (id) initWithContato:(Contato *)contato {
    self = [super init];
    if (self) {
        self.contato = contato;
    }
    return self;
}

- (void) acoesDoController : (UIViewController*) controller {
    self.controller = controller;
    
    UIActionSheet* opcoes = [[UIActionSheet alloc]
                             initWithTitle:self.contato.nome
                             delegate:self
                             cancelButtonTitle:@"Cancelar"
                             destructiveButtonTitle:nil
                             otherButtonTitles:@"Ligar", @"Enviar E-mail", @"Site", @"Mapa", nil];
    [opcoes showInView:controller.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self ligar : self.contato.telefone];
            break;
        case 1:
            [self enviarEmail : self.contato.email];
            break;
        case 2:
            [self abrirSite : self.contato.site];
            break;
        case 3:
            [self mostrarMapa : self.contato.endereco];
            break;
        default:
            break;
    }
}

- (void) ligar : (NSString*) telefone {
    NSLog(@"Ligar para %@", telefone);
    [IOSUtilsDispositivo ligarPara:telefone];
}

- (void) enviarEmail : (NSString*) email {
    NSLog(@"Enviar e-mail para %@", email);
    //[IOSUtilsDispositivo enviarEmail:email: self.controller, self];
    MFMailComposeViewController* enviador = [[MFMailComposeViewController alloc] init];
        [enviador setToRecipients:@[email]];
        [self.controller presentViewController:enviador
                           animated:YES
                         completion:nil];
        enviador.mailComposeDelegate = self;
}

- (void) abrirSite : (NSString*) url {
    NSLog(@"Abrir site de %@", url);
    [IOSUtilsDispositivo navegarPara:url];
}

- (void) mostrarMapa : (NSString*) endereco {
    NSLog(@"Mostrar Mapa para chegar a %@", endereco);
    [IOSUtilsDispositivo mostrarMapaComEndereco:endereco];
}

@end
