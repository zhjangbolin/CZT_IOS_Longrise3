//
//  SecondViewController.m
//  CZT_IOS_Longrise
//
//  Created by 程三 on 15/12/29.
//  Copyright (c) 2015年 程三. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "UIViewExt.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide_title1"]];
    titleImage.width =(int)([Util getUIScreenWidth] * 0.8);
    titleImage.top = 40;
    titleImage.left = ([Util getUIScreenWidth] - titleImage.width)/2;
    titleImage.height =titleImage.width * 150 / 600;
    [self.view addSubview:titleImage];
    
    UIImageView *guideImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide_img1"]];
    guideImage.width =(int)([Util getUIScreenWidth] * 0.7);
    guideImage.top = 20 + titleImage.bottom;
    guideImage.left = ([Util getUIScreenWidth] - guideImage.width)/2;
    guideImage.height =guideImage.width;
    [self.view addSubview:guideImage];
    
    self.guideFinishBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    self.guideFinishBtn.width = titleImage.width;
    self.guideFinishBtn.left = titleImage.left;
    self.guideFinishBtn.height = 40;
    self.guideFinishBtn.top = [Util getUIScreenHeight] - self.guideFinishBtn.height - 80;
    [self.guideFinishBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [self.guideFinishBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:151/255.0 blue:241/255.0 alpha:1] forState:UIControlStateNormal];
    self.guideFinishBtn.layer.cornerRadius = 10;
    self.guideFinishBtn.layer.masksToBounds = YES;
    self.guideFinishBtn.layer.borderWidth = 1;
    self.guideFinishBtn.layer.borderColor = [UIColor colorWithRed:51/255.0 green:151/255.0 blue:241/255.0 alpha:1].CGColor;
    [self.guideFinishBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];


    [self.view addSubview:self.guideFinishBtn];

    [AppDelegate storyBoradAutoLay:self.view];

}

#pragma mark 点击回调
-(void)onClick:(UIButton *)btn
{
    if(self.guideFinishBtn == btn)
    {
        UIStoryboard *loginStoryboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.view.window.rootViewController=[loginStoryboard instantiateInitialViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
