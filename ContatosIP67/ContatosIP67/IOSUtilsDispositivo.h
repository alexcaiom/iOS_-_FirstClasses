//
//  IOSUtilsDispositivo.h
//  ContatosIP67
//
//  Created by ios6233 on 25/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface IOSUtilsDispositivo : NSObject
+ (void) ligarPara : (NSString*) telefone;
+ (void) navegarPara : (NSString*) url;
//+ (void) enviarEmail : (NSString*) email : (UIViewController*) tela : (MFMailComposeViewControllerDelegate*) delegate;
+ (void) mostrarMapaComEndereco : (NSString*) endereco;
+ (void) mostrarMapaComCoordenadas : (double*) latitude : (double*) longitude;

@end
