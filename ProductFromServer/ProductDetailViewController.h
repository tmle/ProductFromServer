//
//  ProductDetailViewController.h
//  ProductFromServer
//
//  Created by Thinh Le on 2017-05-07.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionLabel;


@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, strong) Product *selectedProduct;

@end
