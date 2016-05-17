//
//  ViewController.m
//  Scroll View Image Galleries
//
//  Created by Anton Moiseev on 2016-05-16.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myScrollView1.delegate = self;
    
    UIImageView *lhInField = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    lhInField.tag = 1;
    UIImageView *lhNight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    lhNight.tag = 2;
    UIImageView *lhZoomed = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    lhZoomed.tag = 3;
    
    [lhInField setContentMode:UIViewContentModeScaleAspectFit];
    [lhNight setContentMode:UIViewContentModeScaleAspectFit];
    [lhZoomed setContentMode:UIViewContentModeScaleAspectFit];
    
    lhInField.frame = CGRectMake(0, 0, self.myScrollView1.frame.size.width, self.myScrollView1.frame.size.height);
    lhNight.frame = CGRectMake(lhInField.frame.size.width, 0, self.myScrollView1.frame.size.width, self.myScrollView1.frame.size.height);
    lhZoomed.frame = CGRectMake(lhInField.frame.size.width + lhNight.frame.size.width, 0, self.myScrollView1.frame.size.width, self.myScrollView1.frame.size.height);
    
    [self.myScrollView1 addSubview:lhInField];
    [self.myScrollView1 addSubview:lhNight];
    [self.myScrollView1 addSubview:lhZoomed];
    
    self.myScrollView1.contentSize = CGSizeMake(lhInField.frame.size.width + lhNight.frame.size.width + lhZoomed.frame.size.width, lhInField.frame.size.height);
    
    self.myScrollView1.pagingEnabled = YES;
    self.myScrollView1.maximumZoomScale = 2;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    lhInField.userInteractionEnabled = YES;
    lhNight.userInteractionEnabled = YES;
    lhZoomed.userInteractionEnabled = YES;
    
    [lhInField addGestureRecognizer:tap1];
    [lhNight addGestureRecognizer:tap2];
    [lhZoomed addGestureRecognizer:tap3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewTapped:(UITapGestureRecognizer *)sender {
    
    if (sender.view.tag == 1) {
        
        [self performSegueWithIdentifier:@"details" sender:@"Lighthouse-in-Field"];
        
    } else if (sender.view.tag == 2) {
        
        [self performSegueWithIdentifier:@"details" sender:@"Lighthouse-night"];
        
    } else if (sender.view.tag == 3) {
        
        [self performSegueWithIdentifier:@"details" sender:@"Lighthouse-zoomed"];
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ViewController2 *vc2 = segue.destinationViewController;
    
    vc2.name = sender;
    
}

@end
