//
//  nearByPlacesTableViewController.h
//  CollectionView
//
//  Created by student14 on 18/07/17.
//  Copyright © 2017 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface nearByPlacesTableViewController : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property(nonatomic,retain) NSMutableString *selectedPlace;

@property(nonatomic,retain)NSMutableArray *name,*address;
@property(nonatomic,retain)NSMutableData *data;

@end
