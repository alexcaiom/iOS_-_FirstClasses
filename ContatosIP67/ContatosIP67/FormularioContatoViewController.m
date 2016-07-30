//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 18/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
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
    NSString *nome = [self.nome text];
    NSString *telefone = [self.telefone text];
    NSString *endereco = [self.endereco text];
    NSString *email = [self.email text];
    NSString *site = [self.site text];
    
    if (!self.contato) {
        self.contato = [self.contatoDAO criaNovoContato];
    }
    self.contato.nome = nome;
    self.contato.telefone = telefone;
    self.contato.endereco = endereco;
    self.contato.email = email;
    self.contato.site = site;
    
    if ([self.botaoFoto backgroundImageForState:UIControlStateNormal]) {
        self.contato.foto = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
    }
    self.contato.latitude = [NSNumber numberWithFloat:[self.latitude.text floatValue]];
    self.contato.longitude = [NSNumber numberWithFloat:[self.longitude.text floatValue]];
    
}

- (void) alterarContato {
    [self pegaDadosDoFormulario];
    [self.contatoDAO salva];
    
    [self.navigationController popViewControllerAnimated:true];
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
        
        if (self.contato.foto) {
            [self.botaoFoto setBackgroundImage:self.contato.foto
                                      forState:UIControlStateNormal];
        }
        
        self.latitude.text = [self.contato.latitude stringValue];
        self.longitude.text = [self.contato.longitude stringValue];
    }
}

- (IBAction)selecionaFoto:(id)sender {
    UIImagePickerController* picker = [UIImagePickerController new];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage* imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) buscarCoordenadas : (id)sender {
    UIButton* botao = (UIButton*) sender;
    CLGeocoder* geo = [CLGeocoder new];
    [geo geocodeAddressString:self.endereco.text
            completionHandler:^(NSArray<CLPlacemark *> * resultados, NSError * _Nullable error) {
                CLPlacemark* resultado = resultados[0];
                CLLocationCoordinate2D coordenada = resultado.location.coordinate;
                self.latitude.text = [NSString stringWithFormat:@"%f", coordenada.latitude];
                self.longitude.text = [NSString stringWithFormat:@"%f", coordenada.longitude];
                [self.loading stopAnimating];
                botao.hidden = NO;
                self.loading.hidden = YES;

            }];
    botao.hidden = YES;
    self.loading.hidden = NO;
    [self.loading startAnimating];
}

- (IBAction) verOTempo :(id)sender {
    AFHTTPSessionManager* gestor = [AFHTTPSessionManager manager];
    gestor.requestSerializer = [AFJSONRequestSerializer serializer];
    gestor.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSURL* url = [NSURL URLWithString:@"https://www.caelum.com.br/mobile"];
    NSDictionary* params =
    @{@"list" : @[
              @{
                  @"aluno" :
                  @[
                      @{
                          @"nome" : @"Felipe",
                          @"nota" : @10
                          },
                      @{
                      @"nome" : @"Felipe",
                      @"nota" : @5
                          }
                  ]
                  }
              ]
      };
    
    [gestor POST:url.absoluteString
      parameters:params
        progress: nil
         success:
        ^(NSURLSessionDataTask * _Nonnull operacao, id   resposta) {
            NSLog(@"JSON: %@", resposta);
         }
         failure:
        ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Erro: %@", error);
        }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self preencheFormularioComContatoParametrizado];
}
@end
