//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO* instancia = nil;

- (NSObject*) init {
    self = [super init];
    if (self) {
        self.contatos = [NSMutableArray new];
    }
    return self;
}

- (void) adiciona : (Contato*) contato {
    [self.contatos addObject:contato];
}

+ (ContatoDAO*) contatoDAOInstance {
    if (!instancia) {
        instancia = [ContatoDAO new];
    }
    return instancia;
}

- (Contato*) getContato : (NSInteger) posicao {
    if ([self.contatos count] > posicao && posicao >= 0) {
        return self.contatos[posicao];
    }
    return nil;
}

- (void) removeContato : (NSInteger) posicao {
    [self.contatos removeObjectAtIndex : posicao];
}

- (NSInteger) buscaPosicaoDoContato : (Contato*) contato {
    return [self.contatos indexOfObject:contato];
}

@end
