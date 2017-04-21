//
//  ViewController.m
//  tableViewDelete
//
//  Created by shizhiang on 15/3/24.
//  Copyright (c) 2015年 shizhiang. All rights reserved.
//

#import "ViewController.h"
#import "ClerkManagementController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    BOOL _readed;
    NSInteger _count;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    /*
    // 下面两个属性可以实现多选
    tableView.editing = YES;
    tableView.allowsMultipleSelection = YES;
     */
    [self.view addSubview:tableView];
    _count = 50;
}

// 实现下面的方法，即可右滑删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}

/*
// tableVie.editing = YES的情况下，实现下面的方法，可以实现多选
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}
 */

/*
// 改变右滑出来的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"下载";
}
*/

// iOS8 新增加的方法，可以增加右滑出现的按钮
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction * action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"下载" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"下载");
        action.title = @"已下载";
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    if (_readed) {
        action1.title = @"已下载";
        _readed = NO;
    } else {
        action1.title = @"下载";
        _readed = YES;
    }
    
    
    UITableViewRowAction *action5 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"下载" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        _count--;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
    return @[action5];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClerkManagementController *con = [[ClerkManagementController alloc]init];
    [self presentViewController:con animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
