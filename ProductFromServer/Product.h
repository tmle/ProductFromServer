//
//  Product.h
//  ProductFromServer
//
//  Created by Thinh Le on 2017-05-07.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *productDescription;

@end
