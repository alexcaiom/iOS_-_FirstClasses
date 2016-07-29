//
//  Contato.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 ios6233. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>

@interface Contato : NSManagedObject <MKAnnotation>

@property (strong) NSString* nome;
@property (strong) NSString* telefone;
@property (strong) NSString* email;
@property (strong) NSString* endereco;
@property (strong) NSString* site;

@property IBOutlet UIImage* foto;

@property NSNumber* latitude;
@property NSNumber* longitude;

@end
