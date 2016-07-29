//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios6233 on 26/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import "ContatosNoMapaViewController.h"
#import "ContatoDAO.h"

@interface ContatosNoMapaViewController ()

@end

@implementation ContatosNoMapaViewController

- (id) init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Localização";
        self.manager = [CLLocationManager new];
        [self.manager requestWhenInUseAuthorization];
        
        UIImage* icone = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem* tab = [[UITabBarItem alloc]
                             initWithTitle:@"Mapa"
                             image:icone
                             tag:0];
        self.tabBarItem = tab;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MKUserTrackingBarButtonItem* botaoGPS = [[MKUserTrackingBarButtonItem alloc]
                                             initWithMapView:self.mapa];
    self.navigationItem.rightBarButtonItem = botaoGPS;
    
       // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [self carregaContatosNoMapa];
    [super viewWillAppear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {
    [self.mapa removeAnnotations:_contatoDAO.contatos];
    [super viewDidDisappear:animated];
}

- (void) carregaContatosNoMapa {
    _contatoDAO = [ContatoDAO contatoDAOInstance];
    NSArray* contatos = _contatoDAO.contatos;
    [self.mapa addAnnotations:contatos];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
