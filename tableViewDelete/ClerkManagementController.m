//
//  ClerkManagementController.m
//  tableViewDelete
//
//  Created by shiwei on 2016/12/19.
//  Copyright © 2016年 shizhiang. All rights reserved.
//

#import "ClerkManagementController.h"
#import "ClerkCell.h"

@interface ClerkManagementController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ClerkManagementController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        NSArray *array = @[@"胡歌",@"把那",@"好烦呀",@"天天",@"都是",@"假数据",@"宝宝",@"心里苦",@"宝宝",@"是",@"不会",@"说出来",@"的"];
        _dataArray = [[NSMutableArray alloc]initWithArray:array];
        
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"ClerkCell" bundle:nil] forCellReuseIdentifier:@"ClerkCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClerkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClerkCell" forIndexPath:indexPath];
    cell.name.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


// iOS8 新增加的方法，可以增加右滑出现的按钮
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction * action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        
        
        
        NSIndexPath *firstIndexPath =[NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        [tableView moveRowAtIndexPath:indexPath toIndexPath:firstIndexPath];
        [self.dataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
        [tableView reloadData];
        
    }];
    
    
    UITableViewRowAction *action5 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    action5.backgroundColor = [UIColor orangeColor];
    
    
    return @[action1, action5];
}


@end
