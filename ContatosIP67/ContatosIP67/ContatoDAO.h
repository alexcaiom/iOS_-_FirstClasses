//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

    +(id) contatoDAOInstance;
    @property (strong) NSMutableArray<Contato*> *contatos;

    - (void) adiciona : (Contato*) contato ;
    - (Contato*) getContato : (NSInteger) id;
    - (void) removeContato : (NSInteger) id;

    -(NSInteger) buscaPosicaoDoContato : (Contato*) contato;

@end
