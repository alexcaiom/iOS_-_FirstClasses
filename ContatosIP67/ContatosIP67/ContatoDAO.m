//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "ContatoDAO.h"
#import "CoreDataInfra.h"

@implementation ContatoDAO

static ContatoDAO* instancia = nil;

- (NSObject*) init {
    self = [super init];
    if (self) {
        self.contatos = [NSMutableArray new];
        self.infra = [CoreDataInfra new];
        self.nomeDaEntidade = @"Contato";
    }
    return self;
}

+ (ContatoDAO*) contatoDAOInstance {
    if (!instancia) {
        instancia = [ContatoDAO new];
    }
    return instancia;
}

- (void) adiciona : (Contato*) contato {
    [self.contatos addObject:contato];
}


- (Contato*) getContato : (NSInteger) posicao {
    if ([self.contatos count] > posicao && posicao >= 0) {
        return self.contatos[posicao];
    }
    return nil;
}

- (Contato*) criaNovoContato {
    Contato* contato = [NSEntityDescription insertNewObjectForEntityForName:self.nomeDaEntidade
                                  inManagedObjectContext:self.infra.managedObjectContext];
    return contato;
}

- (void) salva {
    [self.infra saveContext];
}

- (void) removeContato : (NSInteger) posicao {
    [self.contatos removeObjectAtIndex : posicao];
}

- (void) listar {
    NSFetchRequest* query = [NSFetchRequest fetchRequestWithEntityName:self.nomeDaEntidade];
    NSSortDescriptor* ordemAlfabetica = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    query.sortDescriptors = @[ordemAlfabetica];
    NSArray<Contato*>* retornoDaQuery = [self.infra.managedObjectContext executeFetchRequest:query error:nil];
    self.contatos = [retornoDaQuery mutableCopy];
}

- (NSInteger) buscaPosicaoDoContato : (Contato*) contato {
    return [self.contatos indexOfObject:contato];
}

@end
