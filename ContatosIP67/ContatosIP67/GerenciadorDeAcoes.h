//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios6233 on 25/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Contato.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "IOSUtilsDispositivo.h"

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property Contato* contato;
@property UIViewController* controller;
- (id) initWithContato : (Contato*) contato;
- (void) acoesDoController : (UIViewController*) controller;

@end
