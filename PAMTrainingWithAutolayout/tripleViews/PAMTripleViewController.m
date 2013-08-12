//
//  PAMTripleViewController.m
//  PAMTrainingWithAutolayout
//
//  Created by Takafumi Tamura on 2013/08/12.
//  Copyright (c) 2013年 田村 孝文. All rights reserved.
//

#import "PAMTripleViewController.h"


@interface UIView(Swap)
-(void)removeAllGestures;
@end
@implementation UIView(Swap)
-(void)removeAllGestures
{
    for (UITapGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
}
@end


@implementation PAMTripleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setupGesture];

}

-(void)setupGesture
{
    [self.mainView removeAllGestures];
    [self.subView1 removeAllGestures];
    [self.subView2 removeAllGestures];
    UITapGestureRecognizer *tapView1 =
    [[UITapGestureRecognizer alloc]initWithTarget:self
                                           action:@selector(swapMainToSub:)];
    [self.subView1 addGestureRecognizer:tapView1];
    
    UITapGestureRecognizer *tapView2 =
    [[UITapGestureRecognizer alloc]initWithTarget:self
                                           action:@selector(swapMainToSub:)];
    [self.subView2 addGestureRecognizer:tapView2];
}

-(void)swapMainToSub:(id)sender
{
    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *)sender;
    [self swapAnimationView:self.mainView toView:gesture.view];
    if( self.subView1 == gesture.view ){
        UIView *subView = self.subView1;
        self.subView1 = self.mainView;
        self.mainView = subView;
    }else if( self.subView2 == gesture.view ){
        UIView *subView = self.subView2;
        self.subView2 = self.mainView;
        self.mainView = subView;
    }
    [self setupGesture];
}
-(void)swapAnimationView:(UIView *)view1 toView:(UIView *)view2
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect view1Frame = view1.frame;
                         view1.frame = view2.frame;
                         view2.frame = view1Frame;
                         // autolayoutの影響か、↓したら元の場所に戻る。
                         // 制約が効いてるから当然ちゃあ当然。
                         // autolayoutの制約を動かしたりするのまでは大変なのでやらない。
//                         [view1 layoutIfNeeded];
//                         [view2 layoutIfNeeded];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
