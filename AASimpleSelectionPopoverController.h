//
//  AASimpleSelectionPopoverController.h
//  Atlantic-ARM
//
//  Created by iN on 29.10.13.
//  Copyright (c) 2013 Boloid. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AASelectionPopoverDelegate
- (void)didSelectIndex:(NSInteger)index fromPopover:(UIPopoverController *)popover;
- (void)closePopover;
@end

@interface AASimpleSelectionPopoverController : UIViewController
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, weak) id <AASelectionPopoverDelegate> delegate;
@end
