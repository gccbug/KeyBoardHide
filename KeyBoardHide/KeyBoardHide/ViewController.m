//
//  ViewController.m
//  KeyBoardHide
//
//  Created by zhengbing on 16/7/4.
//  Copyright © 2016年 zhengbing. All rights reserved.
//

#import "ViewController.h"
#import "KeyBoradTableViewCell.h"

#define CELLID @"CELLID"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return self.view.bounds.size.height/2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    KeyBoradTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    
    cell.text.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    __weak typeof(self) weakSelf = self;
    cell.block = ^(KeyBoradTableViewCell *sender){
        NSIndexPath *ind = [tableView indexPathForCell:sender];
        [weakSelf.tableView scrollToRowAtIndexPath:ind atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    };
    
    cell.textLabel.text = @"输入项名称：";
    
    return cell;
}

-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[KeyBoradTableViewCell class] forCellReuseIdentifier:CELLID];
    }
    return _tableView;
}

@end
