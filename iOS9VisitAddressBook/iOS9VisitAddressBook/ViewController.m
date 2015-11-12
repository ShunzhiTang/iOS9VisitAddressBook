//
//  ViewController.m
//  iOS9VisitAddressBook
//
//  Created by Tsz on 15/11/12.
//  Copyright © 2015年 Tsz. All rights reserved.

#import "ViewController.h"
#import <ContactsUI/ContactsUI.h>

@interface ViewController ()<CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //1、创建控制器
    CNContactPickerViewController *contactVC = [[CNContactPickerViewController alloc] init];
    
    contactVC.delegate = self;
    
    //弹出
    [self presentViewController:contactVC animated:YES completion:nil];
}

#pragma mark: 选择联系人的时间调用

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
    
    // 1.获取姓名
    // givenName = firstName
    // familyName = lastName
    NSLog(@"givenName:%@, familyName:%@", contact.givenName, contact.familyName);
    
    //2、获取电话
    
    for(CNLabeledValue *labValue  in contact.phoneNumbers ){
            NSLog(@"label:%@", labValue.label);
            
            CNPhoneNumber *phoneNumber = labValue.value;
            NSLog(@"phoneNumber:%@", phoneNumber.stringValue);
    }
}

// 选择多个联系人的时候调用，实现此方法可以实现多选，但是会覆盖单选的方法
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact *> *)contacts {
    // contacts - contact
}

// 选择联系人属性的时候调用
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    
}

// 选择多个联系人属性的时候调用，实现此方法可以实现多选，但是会覆盖单选的方法
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperties:(NSArray<CNContactProperty *> *)contactProperties {
    
}

// 点击取消的时候调用
- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    
}

@end
