//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "GerenciadorDeAcoes.h"

@implementation ListaContatosViewController

- (id) init {
    self = [super init];
    
    if (self) {
        /**
         * Adiciona botao de Add na Barra
         */
        UIBarButtonItem* btnAdd = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                   target:self
                                   action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = btnAdd;
        
        /**
         * Adiciona botao de Edit na Barra
         */
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        self.contatoDAO = [ContatoDAO contatoDAOInstance];
        [self.contatoDAO listar];
        self.posicao = -1;
        self.numeroDeSessoes = 1;
        
        [self iniciarTab];
    }
    
    return self;
}

- (void) iniciarTab {
    UIImage* icone = [UIImage imageNamed:@"lista-contatos.png"];
    UITabBarItem* tab = [[UITabBarItem alloc]
                         initWithTitle:@"Contatos"
                         image:icone
                         tag:1];
    self.tabBarItem = tab;
}

-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController* form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    if (self.delegate) {
        [self.delegate contatoAdicionado:self.contatoSelecionado];
    }
    [self.navigationController pushViewController:form animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)table {
    return self.numeroDeSessoes;
}


-(NSInteger) tableView:(UITableView *) table numberOfRowsInSection:(NSInteger)section {
    return [self.contatoDAO.contatos count];
}

-(UITableViewCell*) tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)index {
    NSString* nomeDoIdentificador = @"Linha";
    UITableViewCell* linha = [table dequeueReusableCellWithIdentifier: nomeDoIdentificador];
    
    //Verifica se tem linha disponivel para ser reciclada
    //Se tiver, apenas reutilizo a linha
    if (!linha) {
        linha = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:nomeDoIdentificador];
    }
    
    Contato* contato = self.contatoDAO.contatos[index.row];
    linha.textLabel.text = contato.nome;
    return linha;
}

-(void) tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle) editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatoDAO removeContato : indexPath.row];
        [tableView reloadData];
    }
}

-(void) tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.contatoDAO getContato: indexPath.row];
    [self exibeFormulario];
}

-(void) contatoAdicionado:(Contato *)contato {
    if (self.delegate) {
        [self.delegate contatoAdicionado:contato];
        self.posicao = [self.contatoDAO buscaPosicaoDoContato:contato];
    }
    
    
}

-(void) contatoAtualizado:(Contato *)contato {
    if (self.delegate) {
        [self.delegate contatoAtualizado:contato];
        self.posicao = [self.contatoDAO buscaPosicaoDoContato:contato];
    }
}


-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void) viewDidAppear:(BOOL)animated {
    if (self.posicao >=0) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.posicao
                                                    inSection:0];
        [self.tableView selectRowAtIndexPath: indexPath
                                    animated:animated
                              scrollPosition:UITableViewScrollPositionMiddle];
    }
    
    [self alocarEscutadorDeCliqueLongo];
}

-(void) alocarEscutadorDeCliqueLongo {
    UILongPressGestureRecognizer* cliqueLongo = [[UILongPressGestureRecognizer alloc]
                                                 initWithTarget:self
                                                 action:@selector(exibeMenu:)];
    [self.tableView addGestureRecognizer:cliqueLongo];
}

- (void) exibeMenu : (UIGestureRecognizer*) gesto {
    if (gesto.state == 1) {
        CGPoint ponto = [gesto locationInView:self.tableView];
        NSIndexPath* index = [self.tableView indexPathForRowAtPoint:ponto];
        
        if (index) {
            self.contatoSelecionado = [self.contatoDAO getContato:index.row];
            _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:self.contatoSelecionado];
            [self.gerenciador acoesDoController:self];
        }
        
        /*UIActionSheet* menu = [[UIActionSheet alloc]
                               initWithTitle: self.contatoSelecionado.nome
                               delegate:self
                               cancelButtonTitle:@"Cancelar"
                               destructiveButtonTitle:nil
                               otherButtonTitles: @"Ligar", @"Site", nil];*/
        
        
    }
}



@end