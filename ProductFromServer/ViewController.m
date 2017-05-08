//
//  ViewController.m
//  ProductFromServer
//
//  Created by Thinh Le on 2017-05-07.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *proTextView;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://thinhmle.com/api/ProductList_Supplements.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        // array of dictionary
        NSArray *arr = [responseObject objectForKey:@"products"];
        //NSLog(@"arr: %@", arr);
        NSMutableArray *tempProducts = [NSMutableArray array];
        
        for (NSDictionary *item in arr) {
            Product *prod = [[Product alloc] init];
            
            prod.productName = [item objectForKey:@"productName"];
            prod.productId = [item objectForKey:@"productId"];
            //NSLog(@"%@, %@", prod.productName, prod.productId);
            [tempProducts addObject:prod];
            prod = nil;
        }

        self.products = tempProducts;
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
