//
//  IOSUtilsDispositivo.m
//  ContatosIP67
//
//  Created by ios6233 on 25/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//


#import "IOSUtilsDispositivo.h"

@implementation IOSUtilsDispositivo

+ (void) ligarPara : (NSString*) telefone {
    UIDevice* device = [UIDevice currentDevice];
    if ([device.model isEqualToString:@"iPhone"]) {
        NSString* numero = [NSString stringWithFormat:@"tel:%@", telefone];
        [self abrirAplicativoComUrl:numero];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Impossivel fazer ligacao"
                                    message:@"Seu dispositivo não é um iPhone"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

+ (void) navegarPara : (NSString*) url {
    if (![url hasPrefix:@"http://"] && ![url hasPrefix:@"https://"]) {
        url = [NSString stringWithFormat:@"http://%@", url];
    }
    [self abrirAplicativoComUrl:url];
}

+ (void) mostrarMapaComEndereco : (NSString*) endereco {
    NSString* url = [[NSString stringWithFormat:@"http://maps.apple.com/?q=%@", endereco] stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    [self abrirAplicativoComUrl:url];
}


+ (void) mostrarMapaComCoordenadas : (double*) latitude : (double*) longitude {
    
}

+ (void) abrirAplicativoComUrl : (NSString*) url {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString : url]];
}


@end
