//
//  FirstGuideViewController.m
//  CZT_IOS_Longrise
//
//  Created by 程三 on 15/12/28.
//  Copyright (c) 2015年 程三. All rights reserved.
//

#import "FirstGuideViewController.h"
#import "AppDelegate.h"
#import "UIViewExt.h"


@interface FirstGuideViewController ()

@end

@implementation FirstGuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [AppDelegate storyBoradAutoLay:self.view];

    
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
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
