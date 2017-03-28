//
//  ViewController.m
//  JSBadgeViewDemo
//
//  Created by admin on 17/3/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "JSBadgeView.h"

#define kSquareSideLength 64.0f
#define kSquareCornerRadius 10.0f
#define kMarginBetweenSquares 10.0f

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(90, 200);
    
    CGRect rectangleBounds = CGRectMake(0.0f,
                                        0.0f,
                                        kSquareSideLength,
                                        kSquareSideLength);
    CGPathRef rectangleShadowPath = [UIBezierPath bezierPathWithRoundedRect:rectangleBounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(kSquareCornerRadius, kSquareCornerRadius)].CGPath;
    
    UIView *rectangle = [[UIView alloc] initWithFrame:CGRectIntegral(CGRectMake(100,
                                                                                100,
                                                                                50,//rectangleBounds.size.width
                                                                                50))];
    rectangle.backgroundColor = [UIColor greenColor];
    rectangle.layer.cornerRadius = kSquareCornerRadius;
    rectangle.layer.shadowColor = [UIColor blackColor].CGColor;
    rectangle.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    rectangle.layer.shadowOpacity = 0.2;
    rectangle.layer.shadowRadius = 1.0;
    rectangle.layer.shadowPath = rectangleShadowPath;
    
    JSBadgeView *badgeView = [[JSBadgeView alloc] initWithParentView:rectangle alignment:JSBadgeViewAlignmentTopRight];
    badgeView.badgeText = [NSString stringWithFormat:@"%d", 3];
    
    [self.view addSubview:rectangle];
    [self.view sendSubviewToBack:rectangle];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollView.contentOffset.x--%f scrollView.contentOffset.y--%f",scrollView.contentOffset.x,scrollView.contentOffset.x);
}



@end
