//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
#import "CoreDataInfra.h"

@interface ContatoDAO : NSObject

    +(id) contatoDAOInstance;
    @property NSString* nomeDaEntidade;
    @property (strong) NSMutableArray<Contato*> *contatos;

    - (void) adiciona : (Contato*) contato ;
    - (void) salva; 
    - (Contato*) getContato : (NSInteger) id;
    - (void) removeContato : (NSInteger) id;
    - (void) listar;

    - (NSInteger) buscaPosicaoDoContato : (Contato*) contato;


    - (Contato*) criaNovoContato;

    @property CoreDataInfra* infra;

@end
