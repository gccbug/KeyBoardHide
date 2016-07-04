//
//  KeyBoradTableViewCell.m
//  KeyBoardHide
//
//  Created by zhengbing on 16/7/4.
//  Copyright © 2016年 zhengbing. All rights reserved.
//

#import "KeyBoradTableViewCell.h"

@implementation KeyBoradTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _text = [[UITextField alloc] initWithFrame:CGRectMake(120, 2,[UIScreen mainScreen].bounds.size.width- 160 , 40)];
        _text.delegate = self;
        _text.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_text];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
    if (self.block) {
        self.block(self);
    }
}

@end
