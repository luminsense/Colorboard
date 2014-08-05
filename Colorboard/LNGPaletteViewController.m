//
//  LNGPaletteViewController.m
//  Colorboard
//
//  Created by Lumi on 14-8-5.
//  Copyright (c) 2014年 LumiNg. All rights reserved.
//

#import "LNGPaletteViewController.h"
#import "LNGColorViewController.h"
#import "LNGColorDescription.h"

@interface LNGPaletteViewController ()
@property (nonatomic) NSMutableArray *colors;
@end

@implementation LNGPaletteViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [NSMutableArray array];
        
        LNGColorDescription *cd = [[LNGColorDescription alloc] init];
        [_colors addObject:cd];
    }
    return _colors;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    LNGColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        
        LNGColorDescription *color = [[LNGColorDescription alloc] init];
        [self.colors addObject:color];
        
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        LNGColorViewController *mvc = (LNGColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
        
    } else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        LNGColorDescription *color = self.colors[ip.row];
        
        LNGColorViewController *cvc = (LNGColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
        
    }
}


@end
