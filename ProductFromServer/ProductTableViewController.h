//
//  ProductTableViewController.h
//  ProductFromServer
//
//  Created by Thinh Le on 2017-05-07.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "Product.h"

@interface ProductTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, strong) Product *selectedProduct;

@end
