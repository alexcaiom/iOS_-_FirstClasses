//
//  Contato.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString*) description {
    return [NSString stringWithFormat:@"Nome: %@, \nTelefone: %@, \nE-mail: %@, \nEndereco: %@, \nSite: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
}

- (CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

- (NSString*) title {
    return self.nome;
}

- (NSString*) subtitle {
    return self.email;
}

@end
