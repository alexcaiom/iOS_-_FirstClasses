//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 18/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (NSObject*) initWithCoder : (NSCoder*) coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.contatoDAO = [ContatoDAO contatoDAOInstance];
        [self addBotaoSalvarABarra];
        
    }
    return self;
}

- (void) addBotaoSalvarABarra {
    UIBarButtonItem* btnAdd = [[UIBarButtonItem alloc]
                               initWithTitle: @"Salvar"
                               style : UIBarButtonItemStylePlain
                               target: self
                               action: @selector(alterarContato)];
    self.navigationItem.rightBarButtonItem = btnAdd;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) pegaDadosDoFormulario {
    //NSMutableArray<Contato*> *array = [NSMutableArray new];
    NSString *nome = [self.nome text];
    NSString *telefone = [self.telefone text];
    NSString *endereco = [self.endereco text];
    NSString *email = [self.email text];
    NSString *site = [self.site text];
    
    if (!self.contato) {
        self.contato = [Contato new];
    }
    self.contato.nome = nome;
    self.contato.telefone = telefone;
    self.contato.endereco = endereco;
    self.contato.email = email;
    self.contato.site = site;
    
    //[array addObject : contato];
    [self.contatoDAO adiciona:self.contato];
    //[self limpaFormulario ];
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (void) alterarContato {
    [self pegaDadosDoFormulario];
    //mexer no DAO
    //passar
}

/*- (void) limpaFormulario {
    NSString* vazio = @"";
    self.nome.text = vazio;
    self.telefone.text = vazio;
    self.endereco.text = vazio;
    self.email.text = vazio;
    self.site.text = vazio;
}*/

- (IBAction)listarDadosSalvos {
    for (Contato *contato in self.contatoDAO.contatos) {
        [self imprimirContato:contato];
    }
}

- (void) imprimirContato : (Contato*) contato {
    NSLog(@"Contato: \n%@", contato);
}

- (void) preencheFormularioComContatoParametrizado {
    if (self.contato) {
        self.navigationItem.title = @"Alterar";
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc]
                                      initWithTitle: @"Confirmar"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(alterarContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
        
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self preencheFormularioComContatoParametrizado];
}
@end
