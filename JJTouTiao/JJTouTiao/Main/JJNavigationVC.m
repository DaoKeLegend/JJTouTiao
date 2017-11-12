//
//  JJNavigationVC.m
//  JJTouTiao
//
//  Created by lucy on 2017/11/11.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJNavigationVC.h"
#import "JJSearchBar.h"

@interface JJNavigationVC ()

@property (nonatomic, strong) UITextField *searchBarTextField;

@end

@implementation JJNavigationVC

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Object Private Function

- (void)initHomeNavigationBar
{
    //红色背景
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, -20.0, self.navigationBar.bounds.size.width, 64.0)];
    view.backgroundColor = [UIColor redColor];
    [self.navigationBar addSubview:view];
    
    //今日头条几个文字
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:22];
    label.text = @"今日头条";
    [view addSubview:label];
    
    [label sizeToFit];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view).offset(5.0);
        make.left.equalTo(view).offset(20.0);
    }];
    
    //搜索框
    JJSearchBar *searchGroupBar = [[JJSearchBar alloc] init];
    searchGroupBar.showsCancelButton = YES;
    searchGroupBar.layer.cornerRadius = 8.0;
    searchGroupBar.layer.masksToBounds = YES;
//    searchGroupBar.delegate = self;
//    [searchGroupBar setValue:@"取消" forKeyPath:@"_cancelButtonText"];
//    [searchGroupBar setSearchBarStyle:UISearchBarStyleProminent];
    [searchGroupBar setBackgroundImage:[UIImage new]];
    [searchGroupBar setImage:[UIImage imageNamed:@"shortvideo_search_icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    UIButton *cancelBtn = [searchGroupBar valueForKeyPath:@"cancelButton"];
    cancelBtn.hidden = YES;
    [view addSubview:searchGroupBar];
    
    [searchGroupBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(15.0);
        make.right.equalTo(view).offset(-20.0);
        make.centerY.equalTo(label);
        make.height.equalTo(@28);
    }];
    
    self.searchBarTextField = [searchGroupBar valueForKey:@"_searchField"];
    [self.searchBarTextField setBackgroundColor:[UIColor whiteColor]];
    self.searchBarTextField.placeholder = @"输入任何你感兴趣的";
    self.searchBarTextField.rightViewMode = UITextFieldViewModeNever;
    [self.searchBarTextField setValue:[UIColor darkGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.searchBarTextField setValue:[UIFont fontWithName:@"PingFangSC-Light" size:14.0] forKeyPath:@"_placeholderLabel.font"];
    [self.searchBarTextField setClearButtonMode:UITextFieldViewModeNever];
    self.searchBarTextField.layer.cornerRadius = 8.0;
    self.searchBarTextField.layer.masksToBounds = YES;
}

#pragma mark - Getter && Setter

- (void)setStyle:(JJNavigationVCBarStyle)style
{
    switch (style) {
        case JJNavigationVCBarStyleHome:
        {
            [self initHomeNavigationBar];
        }
            break;
            
        default:
            break;
    }
}

@end
