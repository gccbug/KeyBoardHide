//
//  KeyBoradTableViewCell.h
//  KeyBoardHide
//
//  Created by zhengbing on 16/7/4.
//  Copyright © 2016年 zhengbing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeyBoradTableViewCell;

typedef void(^keyboardBlock)(KeyBoradTableViewCell * sender);

@interface KeyBoradTableViewCell : UITableViewCell<UITextFieldDelegate>


@property(nonatomic) keyboardBlock block;
@property(nonatomic) UITextField *text;


@end
