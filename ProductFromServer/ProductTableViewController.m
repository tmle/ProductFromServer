//
//  ProductTableViewController.m
//  ProductFromServer
//
//  Created by Thinh Le on 2017-05-07.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import "ProductTableViewController.h"
#import "ProductDetailViewController.h"

@interface ProductTableViewController ()

@end

@implementation ProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Product List";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://thinhmle.com/api/ProductList_Supplements.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        // array of dictionary
        NSArray *tempArr = [responseObject objectForKey:@"products"];
        //NSLog(@"arr: %@", arr);
        NSMutableArray *tempProducts = [NSMutableArray array];
        
        for (NSDictionary *item in tempArr) {
            Product *prod = [[Product alloc] init];
            
            prod.productName = [item objectForKey:@"productName"];
            prod.productId = [item objectForKey:@"productId"];
            prod.productDescription = [item objectForKey:@"productDescription"];
            //NSLog(@"%@, %@", prod.productName, prod.productId);
            [tempProducts addObject:prod];
            prod = nil;
        }
        
        self.products = tempProducts;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell" forIndexPath:indexPath];
    
    Product *tmpProd = [self.products objectAtIndex:indexPath.row];
    
    cell.textLabel.text = tmpProd.productName;
    cell.detailTextLabel.text = tmpProd.productId;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedProduct = [self.products objectAtIndex:indexPath.row];
    //NSLog(@"selected product %@" , self.selectedProduct.productName);
    [self performSegueWithIdentifier:@"ShowProductDetail" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [self.products removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowProductDetail"]) {
        ProductDetailViewController *productDetailViewController = (ProductDetailViewController *)segue.destinationViewController;
        productDetailViewController.selectedProduct = self.selectedProduct;
    }
}

@end
