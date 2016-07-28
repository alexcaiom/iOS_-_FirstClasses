//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 26/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContatosNoMapaViewController : UIViewController

    //Mapa deve ser um Outlet, pois mapa ira interagir com a tela.
 @property IBOutlet MKMapView* mapa;
 @property CLLocationManager* manager;

@end
