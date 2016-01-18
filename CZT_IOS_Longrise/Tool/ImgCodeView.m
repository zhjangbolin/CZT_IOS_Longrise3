//
//  ImgCodeView.m
//  CZT_IOS_Longrise
//
//  Created by OSch on 16/1/14.
//  Copyright © 2016年 程三. All rights reserved.
//

#import "ImgCodeView.h"
#import "UIImageView+WebCache.h"

@implementation ImgCodeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
           [self loadImgCodeView];
//        });
        
        
        [self requestCodeView:0];
    }
    return self;
}

-(void)loadImgCodeView
{
    imgCodeView = [[UIImageView alloc]initWithFrame:self.frame];
    imgCodeView.userInteractionEnabled = YES;
    imgCodeView.tag = 1;
    imgCodeView.hidden = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(imgCodeViewClick)];
    [imgCodeView addGestureRecognizer:tap];
    [self addSubview:imgCodeView];
    
    //获取中
    loadCodeView = [[UIImageView alloc]initWithFrame:self.frame];
    loadCodeView.image = [UIImage imageNamed:@"load_codeView"];
    loadCodeView.tag = 2;
    loadCodeView.userInteractionEnabled = YES;
    loadCodeView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loadCodeView.layer.borderWidth = 1;
    loadCodeView.layer.masksToBounds = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]init];
    [tap1 addTarget:self action:@selector(loadCodeViewClick)];
    [loadCodeView addGestureRecognizer:tap1];
    [self addSubview:loadCodeView];
    
}

#pragma mark - 图片验证码
-(void)imgCodeViewClick
{
    [self requestCodeView:1];
}

#pragma mark - 图片验证码获取中
-(void)loadCodeViewClick
{
    [self requestCodeView:2];
}

-(void)requestCodeView:(int)codeIndex
{
    
    if (codeIndex == 1)
    {
        imgCodeView.hidden = YES;
        loadCodeView.hidden = NO;
    }
    [[Globle getInstance].service requestWithServiceIP:@"http://202.43.147.36:71/restservices/" ServiceName:[appbase stringByAppendingString:@"/appcodecreater"] params:nil httpMethod:@"POST"resultIsDictionary:YES completeBlock:^(id result)
     {
         if (result != nil)
         {
             if ([result[@"restate"]isEqualToString:@"1"])
             {
                 [imgCodeView sd_setImageWithURL:[NSURL URLWithString:result[@"data"][@"img"]] placeholderImage:[UIImage imageNamed:@"unload_codeView"]];
                 imgCodeView.hidden = NO;
                 loadCodeView.hidden = YES;
                 
                 if (self.delegate != nil)
                 {
                     [self.delegate requestImgCodeViewID:result[@"data"][@"imgid"]];
                 }
             }
             else
             {
                 imgCodeView.image = [UIImage imageNamed:@"unload_codeView"];
             }
         }
         else
         {
             imgCodeView.image = [UIImage imageNamed:@"unload_codeView"];
             NSLog(@"服务器异常");
         }
     }];
}

@end
