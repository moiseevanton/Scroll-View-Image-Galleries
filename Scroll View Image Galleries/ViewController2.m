//
//  ViewController2.m
//  Scroll View Image Galleries
//
//  Created by Anton Moiseev on 2016-05-16.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

- (void)setUpImage:(NSString *)name;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myScrollView.delegate = self;
    
    [self setUpImage:self.name];
    
    self.myScrollView.minimumZoomScale = 0.5;
    self.myScrollView.maximumZoomScale = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpImage:(NSString *)name {
    
    [self.myImageView setImage:[UIImage imageNamed:name]];
    
    [self.myImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    if ([name isEqualToString:@"Lighthouse-in-Field"]) {
        
        self.myImageView.tag = 1;
        
    } else if ([name isEqualToString:@"Lighthouse-night"]) {
        
        self.myImageView.tag = 2;
        
    } else if ([name isEqualToString:@"Lighthouse-zoomed"]) {
        
        self.myImageView.tag = 3;
        
    }
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    UIImageView *view = [UIImageView new];
    
    if (self.myImageView.tag == 1) {
        
        view = [scrollView viewWithTag:1];
        
    } else if (self.myImageView.tag == 2) {
        
        view = [scrollView viewWithTag:2];
        
    } else if (self.myImageView.tag == 3) {
        
        view = [scrollView viewWithTag:3];
        
    }
    
    return view;
    
}
@end
