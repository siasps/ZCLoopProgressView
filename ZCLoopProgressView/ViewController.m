//
//  ViewController.m
//  ZCLoopProgressView
//
//  Created by 彭爽 on 2021/5/13.
//

#import "ViewController.h"
#import "QLCycleProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) QLCycleProgressView *progressView;

@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"释放了控制器");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.progressView];
    _progressView.progress = .3;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _progressView.mainColor = [UIColor purpleColor];
        _progressView.progress = .6;
    });
    // Do any additional setup after loading the view.
    
    [self searchTest];
}

- (QLCycleProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[QLCycleProgressView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    }
    return _progressView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 查找方式(和圆环进度条无关)
-(void)searchTest{
    NSArray *array = @[@5,@8,@14,@20,@31,@55,@78,@81,@93,@97,@111];
    
    int jieguo = search(array,97);
    if(jieguo == -1){
        NSLog(@"没找到要查找的数字");
    }
}


int search(NSArray *array,int item){
    int x = 1;
    int low = 0;
    int high = (int)[array count] - 1;
    while (low <= high) {
        NSLog(@"第%d次比较",x);
        x++;
        int mid = (high+low)/2;
        if(item == [array[mid] intValue]){
            NSLog(@"%d找到了,在第%d个位置",item,mid);
            return mid;
        }else if(item < [array[mid] intValue]){
            NSLog(@"%d比%d大，继续查找",[array[mid] intValue],item);
            high = mid-1;
        }else{
            NSLog(@"%d比%d小，继续查找",[array[mid] intValue],item);
            low = mid+1;
        }
    }
    return -1;
}
@end
