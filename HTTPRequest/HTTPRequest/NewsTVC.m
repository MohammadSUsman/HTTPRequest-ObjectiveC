//
//  NewsTVC.m
//  HTTPRequest
//
//  Created by Brianna Przybysz on 5/26/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

#import "NewsTVC.h"
#import "RestAPI.h"

@interface NewsTVC () <RestAPIDelegate>

@property(nonatomic, strong) RestAPI *restAPI;


@end

@implementation NewsTVC

- (RestAPI *)restAPI{
    if (!_restAPI) {
        _restAPI = [[RestAPI alloc]init];
    }
    return _restAPI;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self httpGETRequest];
}

-(void)httpGETRequest{
    NSString *string = @"http://content.guardianapis.com/search?api-key=test";
    string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url ];
    [request setHTTPMethod:GET];
    self.restAPI.delegate = self;
    [self.restAPI httpRequest:request];
    
}

-(void)httpPOSTRequest{
    NSString *postBody = @"api-key=test";
    
    NSString *string = @"http://content.guardianapis.com/search?";
    string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url ];
    [request setHTTPMethod:POST];
    postBody = [postBody stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.restAPI.delegate = self;
    
    [self.restAPI httpRequest:request];
    
}


- (void)getReceivedData:(NSMutableData *)data sender:(RestAPI *)sender
{
    NSError *error = nil;
    NSDictionary *responceData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSDictionary *responce = [[NSDictionary alloc]initWithDictionary:[responceData objectForKey:@"response"]];
    
    NSArray *result = [[NSArray alloc] initWithArray:[responce objectForKey:@"results"]];
    
    // On the console you have to type po and the dictionary name that you want to fetch the data.
    
    
    
   // NSLog(responce);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



@end
