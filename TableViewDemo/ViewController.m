//
//  ViewController.m
//  TableViewDemo
//
//  Created by Nick Martin on 1/21/14.
//  Copyright (c) 2014 RiverMoss. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *_myData;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self populateTableData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateTableData{
    _myData = @[@"Apple", @"Orange", @"Banana", @"Pear"];
}

#pragma mark - UITableViewDataSource delegate methods


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_myData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    cell.textLabel.text = [_myData objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDelegate delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selectedFruit = [_myData objectAtIndex:indexPath.row];
    NSString *myMessage = [NSString stringWithFormat:@"You selected: %@", selectedFruit];
    UIAlertView *message = [[UIAlertView alloc]initWithTitle:@"Selected Fruit" message: myMessage
                                           delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    [message show];
}

@end
