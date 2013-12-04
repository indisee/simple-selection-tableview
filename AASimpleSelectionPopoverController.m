//
//  AASimpleSelectionPopoverController.m
//  Atlantic-ARM
//
//  Created by iN on 29.10.13.
//  Copyright (c) 2013 Boloid. All rights reserved.
//

#import "AASimpleSelectionPopoverController.h"

@interface AASimpleSelectionPopoverController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation AASimpleSelectionPopoverController {
    NSIndexPath *_selectedIndex;
}


#warning TO CONFIG

#pragma mark - Configuration

static NSString *cellId = @"SelectionCellID";
static NSString *accessoryImageName = @"IconSelect";

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = _titles[indexPath.row];
}

#pragma mark - View lifecircle

- (void)setTitles:(NSArray *)titles {
    if (_titles != titles) {
        _titles = titles;
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    [self configureCell:cell forIndexPath:indexPath];
    
    if (_selectedIndex && [_selectedIndex isEqual:indexPath]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:accessoryImageName]];
        cell.accessoryView = imageView;
    } else {
        cell.accessoryView = nil;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:_selectedIndex];
    cell.accessoryView = nil;
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:accessoryImageName]];
    
    [_delegate didSelectIndex:indexPath.row fromPopover:(UIPopoverController *)self.parentViewController];
    [_delegate closePopover];
}

@end
