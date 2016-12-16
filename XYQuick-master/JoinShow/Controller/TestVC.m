//
//  TestVC.m
//  JoinShow
//
//  Created by Heaven on 13-9-1.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "TestVC.h"
#import "XYQuick.h"

//#import "UIView+Test.h"
#import "TestView.h"
#import "Test2View.h"
#import "PaintCodeView.h"

#import <Social/SocialDefines.h>

#import "Test1Model.h"
#import "Test2Model.h"
#import "GirlEntity.h"
#import "XYBaseDao.h"
#import "CarEntity.h"
#import "AopTestM.h"
#import "AutoCodingEntity.h"

#define MultiPlatform( __xib ) \
(NSString *)^(void){ \
if (1) { \
    return __xib; \
}else { \
    return [__xib stringByAppendingString:@"_ipad"]; \
}   \
}();


uxy_def_notification_name(TestVC_aaa)
uxy_def_notification_name(TestVC_bbb)


@interface TestVC ()

@end

@implementation TestVC

ViewControllerDemoTitle(Something)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.array = [NSMutableArray array];
        _testKVO = 0;
        _testKVO2 = 0;
        self.testArrayKVO = [NSMutableArray array];
    }
    return self;
}
- (void)dealloc
{
    NSLogDD
  //  [self cancelTimer:nil];
}

- (void)someTest{
#pragma mark - others
    NSString *str2 = MultiPlatform(@"xib");
    NSLogD(@"%@", str2);
    
#pragma mark - next
    NSString *str3 = [NSString stringWithFormat:@"%p", self];
    NSLog(@"%@", str3);
    
    // PRINT_CALLSTACK(64);
    
#pragma mark - next
    NSString *strLen = @"a";
    NSLogD(@"%ld", (long)[strLen uxy_getLength2]);
    strLen = @"啊a";
    NSLogD(@"%ld", (long)[strLen uxy_getLength2]);
    strLen = @"你好,世界.";
    NSLogD(@"%ld", (long)[strLen uxy_getLength2]);
    
#pragma mark - next
    
    
#pragma mark - next
    self.array = [NSMutableArray arrayWithArray:@[@"a"]];
    NSMutableArray *array2 = self->_array;
    NSLogD(@"%@", array2);
    
    NSString *str = [NSString stringWithFormat:@"%d", 123123];
    [str uxy_erasure];
    NSLogD(@"%@", str);

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 66 , XY_SCREEN_WIDTH - 20, XY_SCREEN_HEIGHT - 86)];
    //scroll.contentSize = CGSizeMake(Screen_WIDTH - 60, 2000);
    scroll.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    [self.view addSubview:scroll];
    int btnOffsetY = 20;
    
    // 旋转
    UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.frame = CGRectMake(100, btnOffsetY, 100, 100);
    [tempBtn setBackgroundImage:[UIImage uxy_imageWithFileName:@"bg.jpg"] forState:UIControlStateNormal];
    // [tempBtn setImageEdgeInsets:UIEdgeInsetsMake(00,00,50,00)];
    [tempBtn setTitle:@"title" forState:UIControlStateNormal];
    [tempBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [tempBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [tempBtn setTitleEdgeInsets:UIEdgeInsetsMake(50, 00, 00, 00)];
    [tempBtn uxy_rotate:0.5];
    [scroll addSubview:tempBtn];
    btnOffsetY += 120;
    
    // 点击动画
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor redColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 100, 44);
    [tempBtn setTitle:@"muhud" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickBtnMuhud:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // block
    int i = 1;
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 100, 44);
    [tempBtn setTitle:@"block1" forState:UIControlStateNormal];
    [tempBtn uxy_handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        NSLogD(@"block1:%d", i);
    }];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    i = 2;
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 100, 44);
    [tempBtn setTitle:@"block2" forState:UIControlStateNormal];
    [tempBtn uxy_handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        NSLogD(@"block2:%d", i);
    }];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // kvo
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"kvo" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // ios7语音
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"AVSpeech" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickAVSpeech:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // 只执行一次
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"once1" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickOnce:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"once2" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickOnce2:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // 显示阴影
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"show shade" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickOnce2:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // Block ActionSheet
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"Block ActionSheet" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickBtnBlockActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    // SHOWMBProgressHUD
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"SHOWMBProgressHUD" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickBtnSHOWMBProgressHUDIndeterminate:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
   
    // Block UIButton
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"Block UIButton" forState:UIControlStateNormal];
    [tempBtn uxy_handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        NSLogD(@"Block UIButton")
    }];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"new girl" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickNewGirl:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"view bind data" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickViewBindData:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    TestView *testView = (TestView *)[[PaintCodeView alloc] initWithFrame:CGRectMake(10, btnOffsetY, 200, 200)];
    _testView = testView;
    [scroll addSubview:testView];
     btnOffsetY += 220;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"change view data" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickChangeViewData:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"send message" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickSendMessage:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"cache" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickStringCache:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"emoji" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickEmoji:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"Crossfade" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickCrossfade:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"Cube" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickCube:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;

    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"OglFlip" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickOglFlip:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"user guide" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickUserGuide:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"NSDateFormatter" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickNSDateFormatter:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"Dealloc Log String" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickHookDealloc:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"test dao" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickTestDao:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"test benchmark" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickTestBenchmark:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"NSInvocation" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickTestNSInvocation:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"AOP" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickTestAop:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"AutoCodingSave" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickAutoCodingSave:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"AutoCodingLoad" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickAutoCodingLoad:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"ArrayCopy" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickArrayCopy:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
    tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.backgroundColor = [UIColor lightGrayColor];
    tempBtn.frame = CGRectMake(10, btnOffsetY, 200, 44);
    [tempBtn setTitle:@"ClickInterval" forState:UIControlStateNormal];
    [tempBtn addTarget:self action:@selector(clickWithInterval:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:tempBtn];
    btnOffsetY += 64;
    
#pragma mark -btn end
    
    scroll.contentSize = CGSizeMake(XY_SCREEN_WIDTH - 20, btnOffsetY + 100);
    
    //[self someTest];
    [self uxy_observeWithObject:self property:@"testKVO"];
    [self uxy_observeWithObject:self property:@"testKVO2" block:^(id newValue, id oldValue) {
        NSLogD(@"new:%@ old:%@", newValue, oldValue);
    }];
    [self uxy_observeWithObject:self property:@"testKVO_BOOL"];
    
    [self uxy_registerNotification:TestVC_aaa];
    [self uxy_registerNotification:TestVC_bbb block:^(NSNotification *notification) {
        NSLogD(@"%@", notification.userInfo);
    }];
    
   // $(@"test");
   // __getTestBlock(@"1");
    
    NSArray *array = @[@"1", @"2"];
    array = [array uxy_safeSubarrayWithRange:NSMakeRange(-1, 1)];
    
    NSArray *array2 = @[@"1", @"2"];
    array2 = [array2 uxy_tail:2];
    NSLog(@"%@", array2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBtn1:(id)sender
{
    // kvo
    self.testKVO = self.testKVO + 1;
   // [self setValue:@99 forKeyPath:@"testKVO"];
    
    self.testKVO_BOOL = !self.testKVO_BOOL;
    
    self.testKVO2 = self.testKVO2 + 1;
    self.myGirl.name = [NSString stringWithFormat:@"%d", self.testKVO];
    
    // 观察array
   // [[self mutableArrayValueForKey:@"testArrayKVO"] addObject:@"a"];
}

- (IBAction)clickBtn2:(id)sender
{

}
- (IBAction)clickBtnMuhud:(id)sender
{
    UIButton* btn=(UIButton*) sender;
    XYAnimateSerialStep *steps = [XYAnimateSerialStep animate];
    XYAnimateStep *step1 = [XYAnimateStep duration:0.15 animate:^{
        btn.transform = CGAffineTransformMakeScale(.5, .5);
    }];
    XYAnimateStep *step2 = [XYAnimateStep duration:0.2 animate:^{
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    XYAnimateStep *step3 = [XYAnimateStep duration:0.15 animate:^{
        btn.transform = CGAffineTransformMakeScale(0.8, 0.8);
    }];
    XYAnimateStep *step4 = [XYAnimateStep duration:0.1 animate:^{
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    [[[[steps addStep:step1] addStep:step2] addStep:step3] addStep:step4];
    
    [steps run];
}
- (IBAction)clickAVSpeech:(id)sender
{
    if (XY_IOS7_OR_LATER)
    {
        NSLogD(@"1")
        
        AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc] init];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:@"Copyright (c) 2013 Heaven. All rights reserved"];
     //   utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
        utterance.pitchMultiplier = 1;
        [av speakUtterance:utterance];
    }
    else
    {
        NSLogD(@"2")
    }
    
}

- (IBAction)clickOnce:(id)sender
{
    uxy_once_begin(a)

    uxy_once_end
}

- (IBAction)clickOnce2:(id)sender
{
    uxy_once_begin(b)

    uxy_once_end
}
- (IBAction)clickBtnShade:(id)sender
{
    [self.view uxy_addShadeWithTarget:self action:@selector(closeShade) color:nil alpha:0.7];
}


- (IBAction)clickBtnBlockActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:nil cancelButtonTitle:@"cancel" destructiveButtonTitle:@"destructive" otherButtonTitles:@"other1", @"other2", nil];
    [actionSheet uxy_handlerClickedButton:^(UIActionSheet *actionSheet, NSInteger btnIndex) {
        NSLogD(@"%ld", (long)btnIndex);
    }];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (IBAction)clickBtnSHOWMBProgressHUDIndeterminate:(id)sender
{
   //
}
- (void)clickNewGirl:(id)sender
{
    NSMutableDictionary *me = [NSMutableDictionary dictionary];
    // 从 GirlEntity类 创建一个妹子
    GirlEntity *girl1 = [[GirlEntity alloc] init];
    girl1.name = @"妹子1";
    [me setObject:girl1 forKey:@"girlFriend"];
    
    // 创建一个NSObject对象, 然后添加属性,把他设置成妹子
    NSObject *girl2 = [[NSObject alloc] init];
    objc_setAssociatedObject(girl2, "name", @"妹子2", OBJC_ASSOCIATION_COPY);
    [me setObject:girl2 forKey:@"girlFriend2"];
    
    // 动态创建一个妹子类,然后创建一个妹子
    const char *className = "Girl3";
    Class kclass = objc_getClass(className);
    if (!kclass)
    {
        Class superClass = [NSObject class];
        kclass = objc_allocateClassPair(superClass, className, 0);
    }
    
    NSUInteger size;
    NSUInteger alignment;
    NSGetSizeAndAlignment("*", &size, &alignment);
    class_addIvar(kclass, "name", size, alignment, "*");
    
    // 注册到运行时环境
    objc_registerClassPair(kclass);
    
    id girl3 = [[kclass alloc] init];
    Ivar ivar = class_getInstanceVariable(kclass, "name");
    object_setIvar(girl3, ivar, @"妹子3");
    //object_setInstanceVariable(girl3, "name", "妹子3");

    [me setObject:girl3 forKey:@"girlFriend3"];
    
    // 挖墙角
    GirlEntity *girl4 = [[GirlEntity alloc] init];
    girl4.name = @"女神";
    
    SEL original = @selector(talk);
    SEL replacement = @selector(talk2);
    
    Method a = class_getInstanceMethod([GirlEntity class], original);
    Method b = class_getInstanceMethod([self class], replacement);
    if (class_addMethod([GirlEntity class], original, method_getImplementation(b), method_getTypeEncoding(b)))
    {
        class_replaceMethod([GirlEntity class], replacement, method_getImplementation(a), method_getTypeEncoding(a));
    }
    else
    {
        method_exchangeImplementations(a, b);
    }
    
    [girl4 talk];
    
    
    NSLogD(@"%@", me);
}
- (void)clickNSDateFormatter:(id)sender
{
    NSDateFormatter *formatter1 = [NSDate uxy_dateFormatter];
    NSDateFormatter *formatter3 = [NSDate uxy_dateFormatterByUTC];
    
    NSDate *date = [NSDate date];
    NSString *str1 = [formatter1 stringFromDate:date];
    NSString *str3 = [formatter3 stringFromDate:date];
    NSString *str = [NSString stringWithFormat:@"%@\n%@\n", str1, str3];
    SHOWMSG(nil, str, @"cancel");
}
- (void)talk2
{
    NSString *name = [self valueForKey:@"name"];
    if ([name isEqualToString:@"女神"]) {
        // do 你懂的
        NSLog(@"%s", __FUNCTION__);
    }
}

- (void)clickViewBindData:(id)sender
{
    
    NSDictionary *dic = @{@"label1": @(self.testKVO), @"img1": @"headportrait.jpg"};
    [_testView uxy_showDataWithDic:dic];
}
- (void)clickChangeViewData:(id)sender
{
    
}

- (void)clickSendMessage:(id)sender
{
    [self uxy_postNotification:TestVC_aaa userInfo:@{@"msg": @"test"}];
    [self uxy_postNotification:TestVC_bbb userInfo:@{@"msg": @"test2"}];
}
- (void)clickStringCache:(id)sender
{
    /*
    XYObjectCache *cache = [XYObjectCache sharedInstance];
    [cache registerObjectClass:[NSString class]];
    NSString *key = [NSString stringWithFormat:@"%d", iKey];
    
    NSString *str = nil;
    if (![cache hasCachedForKey:key]) {
        str = @"hello world";
    }else{
        str = [cache objectForKey:key];
        NSLogD(@"%@", str);
        str = [str stringByAppendingString:@"1"];
        iKey++;
        key = [NSString stringWithFormat:@"%d", iKey];
    }
    [cache saveObject:str forKey:key];
    
    NSLogD(@"%@", str);
     */
}
- (void)clickEmoji:(id)sender
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 80)];
   // label.font = [UIFont fontWithName:@"AppleColorEmoji" size:12.0];
    label.text = @"This is a smiley \ue415 face";
    [self.view addSubview:label];
    [label.uxy_frameBuilder centerInSuperview];
}

- (void)clickCrossfade:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [btn setImage:[UIImage uxy_imageWithFileName:@"headportrait.jpg"] forState:UIControlStateNormal];
    [btn uxy_animationCrossfadeWithDuration:5];
}

- (void)clickCube:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [btn setImage:[UIImage uxy_imageWithFileName:@"headportrait.jpg"] forState:UIControlStateNormal];
    [btn uxy_animationCubeWithDuration:5 direction:kCATransitionFromRight];
}

- (void)clickOglFlip:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [btn setImage:[UIImage uxy_imageWithFileName:@"headportrait.jpg"] forState:UIControlStateNormal];
    [btn uxy_animationOglFlipWithDuration:5 direction:kCATransitionFromTop];
}

- (void)clickUserGuide:(id)sender
{
    NSString *key = [NSString stringWithFormat:@"guide_%d", arc4random()]  ;
    [self uxy_showUserGuideViewWithImage:@"bg_trends.png" key:key alwaysShow:YES frame:@"{{100, 200}, {50, 50}}" tapExecute:nil];
}

- (void)clickHookDealloc:(id)sender
{
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.text = @"3秒后移除";
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    [XYDebugToy hookObject:label whenDeallocLogString:@"over"];
    [label performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:3];
}

- (void)clickTestDao:(id)sender
{
    XYBaseDao *dao = [XYBaseDao daoWithEntityClass:[CarEntity class]];
    [dao deleteAllEntity];
    
    CarEntity *car = [[CarEntity alloc] init];
    car.name = @"a";
    car.brand = @"科鲁兹";
    car.time = 1;
    
    [dao saveEntity:car];
    
    CarEntity *car2 = [[CarEntity alloc] init];
    car2.name = @"b";
    car2.brand = @"科鲁兹";
    car2.time = 1;
    
    CarEntity *car3 = [[CarEntity alloc] init];
    car3.name = @"c";
    car3.brand = @"福克斯";
    car3.time = 1;
    
    CarEntity *car5 = [[CarEntity alloc] init];
    car5.name = @"d";
    car5.brand = @"高尔夫";
    car5.time = 1;
    
    NSArray *array = @[car2, car3, car5];
    
    [dao saveEntityWithArray:array];
    
    CarEntity *car4 = [dao loadEntityWithKey:@"c"];
    NSLog(@"%@", car4);
    
    NSArray *array2 = [dao loadEntityWithWhere:@"brand = '科鲁兹'" order:nil];
    NSLog(@"%@", array2);
    
    NSInteger count = [dao countWithWhere:nil];
    NSLog(@"%ld", count);
    
    [dao deleteEntityWithKey:@"c"];
    [dao deleteEntityWithKey:@"brand = '科鲁兹'"];
}

- (void)clickTestBenchmark:(id)sender
{
    PERF_ENTER_(@"1")
    {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (size_t i = 0; i < 10000; i++)
        {
            [mutableArray addObject:@1];
        }
    }
    PERF_ENTER_(@"1")
    
    PERF_ENTER_(@"once")
    {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (size_t i = 0; i < 10000; i++)
        {
            [mutableArray addObject:@1];
        }
    }
    
    PERF_LEAVE_(@"once")
    
    PERF_ENTER_(@"null")
    PERF_LEAVE_(@"null")
}
- (void)clickTestNSInvocation:(id)sender
{
    {
        // 类方法
        NSString *string = nil;
        
        //初始化NSMethodSignature对象
        NSMethodSignature *sig = [NSString methodSignatureForSelector:@selector(stringWithString:)];
        
        //初始化NSInvocation对象
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        
        //设置执行目标对象
        [invocation setTarget:[NSString class]];
        
        //设置执行的selector
        [invocation setSelector:@selector(stringWithString:)];
        
        //设置参数
        NSString *argString = @"test method";
        [invocation setArgument:&argString atIndex:2];
        
        //执行方法
        [invocation retainArguments];
        [invocation invoke];
        
        //获取返回值
        [invocation getReturnValue:&string];
        
        NSLog(@"执行结果 ====%@",string);
    }
    
    
    {
        // 实例方法
        NSString *string = [NSString stringWithFormat:@"我是一个string"];
        NSLog(@"1=%@",string);
        SEL subStringSel = @selector(substringFromIndex:);
        
        //初始化NSMethodSignature对象
        NSMethodSignature *methodSignature = [[NSString class] instanceMethodSignatureForSelector:subStringSel];
        
        //初始化NSInvocation对象
        NSInvocation *myInvocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        
        //设置target
        [myInvocation setTarget:string];
        
        //设置selector
        [myInvocation setSelector:subStringSel];
        
        //设置参数
        int arg1 =  2;
        [myInvocation setArgument:&arg1 atIndex:2];//参数从2开始，index 为0表示target，1为_cmd
        
        //获取结果
        NSString *resultString = nil;
        [myInvocation invoke];
        [myInvocation getReturnValue:&resultString];
        NSLog(@"2=%@",resultString);
    }
}

- (void)clickTestAop:(id)sender
{
    AopTestM *test = [[AopTestM alloc] init];
    NSLog(@"run1");
    [test sumA:1 andB:2];
    
    NSString *before = [XYAOP interceptClass:[AopTestM class] beforeExecutingSelector:@selector(sumA:andB:) usingBlock:^(NSInvocation *invocation) {
        int a = 3;
        int b = 4;
        
        [invocation setArgument:&a atIndex:2];
        [invocation setArgument:&b atIndex:3];
        
        NSLog(@"berore fun. a = %d, b = %d", a , b);
    }];
    
    NSString *after =  [XYAOP interceptClass:[AopTestM class] afterExecutingSelector:@selector(sumA:andB:) usingBlock:^(NSInvocation *invocation) {
        int a;
        int b;
        NSString *str;
        
        [invocation getArgument:&a atIndex:2];
        [invocation getArgument:&b atIndex:3];
        [invocation getReturnValue:&str];
        
        NSLog(@"after fun. a = %d, b = %d, sum = %@", a , b, str);
    }];
    
    NSLog(@"run2");
    [test sumA:1 andB:2];
    
    [XYAOP removeInterceptorWithIdentifier:before];
    [XYAOP removeInterceptorWithIdentifier:after];
    
    NSLog(@"run3");
    [test sumA:1 andB:2];
}

- (void)clickAutoCodingSave:(id)sender
{
    AutoCodingEntity *entity = [[AutoCodingEntity alloc] init];
    entity.str = [NSString stringWithFormat:@"%@", [NSDate date].uxy_stringCache];
    entity.f = 0.1f;
    entity.i = 10001;
    entity.b = YES;
    entity.num = @1;
    
    AutoCodingEntityOther *other = [[AutoCodingEntityOther alloc] init];
    other.i = 1;
    
    entity.objc = other;
    
    AutoCodingEntity *entity2 = [[AutoCodingEntity alloc] init];
    entity2.str = [NSString stringWithFormat:@"%@", [NSDate date].uxy_stringCache];
    entity2.f = 0.2f;
    entity2.i = 10002;
    entity2.b = NO;
    entity2.num = @2;
    
    AutoCodingEntityOther *other2 = [[AutoCodingEntityOther alloc] init];
    other2.i = 2;
    
    entity2.objc = other2;
    
    AutoCodingEntityList *list = [[AutoCodingEntityList alloc] init];
    list.array = [@[entity, entity2] mutableCopy];
    
    PERF_ENTER_(@"save")
    NSString *path = [[XYSandbox docPath] stringByAppendingString:@"/AutoCodingFileData"];
    [list writeToFile:path atomically:YES];
    PERF_LEAVE_(@"save")
    
    PERF_ENTER_(@"fileCache_save")
    XYFileCache *fileCache = [XYFileCache sharedInstance];
    [fileCache setObject:list forKey:@"AutoCodingList"];
    PERF_LEAVE_(@"fileCache_save")
}

- (void)clickAutoCodingLoad:(id)sender
{
    PERF_ENTER_(@"load")
    NSString *path = [[XYSandbox docPath] stringByAppendingString:@"/AutoCodingFileData"];
    AutoCodingEntityList *list = [AutoCodingEntityList uxy_objectWithContentsOfFile:path];
    PERF_LEAVE_(@"load")
    NSLog(@"%@", list);
    
    PERF_ENTER_(@"fileCache_load")
    XYFileCache *fileCache = [XYFileCache sharedInstance];
    AutoCodingEntityList *list2 = [fileCache objectForKey:@"AutoCodingList" objectClass:[AutoCodingEntityList class]];
    PERF_LEAVE_(@"fileCache_load")
    
    NSLog(@"%@", list2);
}
- (void)clickArrayCopy:(id)sender
{
    NSMutableArray *array1 = [@[] mutableCopy];
    NSMutableArray *array2 = [@[] mutableCopy];
    
    PERF_ENTER_(@"init")
    for (int i = 0; i < 10000000; i++)
    {
        [array1 addObject:@(i)];
        [array2 addObject:@(i)];
    }
    PERF_LEAVE_(@"init")
    
    PERF_ENTER_(@"copy")
    NSArray *array3 = [array1 copy];
    PERF_LEAVE_(@"copy")
    NSLog(@"%@", [array3 class]);
    
    PERF_ENTER_(@"arrayWithArray")
    NSArray *array4 = [NSArray arrayWithArray:array1];
    PERF_LEAVE_(@"arrayWithArray")
    NSLog(@"%@", [array4 class]);
    
    PERF_ENTER_(@"immutable")
    NSArray *array5 = [array2 copy];
    PERF_LEAVE_(@"immutable")
    NSLog(@"%@", [array5 class]);
    // objc_msgSend(array3, @selector(addObject:), @"a");
    // [array3 addObject:@"3"];
}

- (void)clickWithInterval:(id)sender
{
    NSLogDD
}

/////////////////////////// 备注 ///////////////////////////////

/*
- (void)testKVOIn:(id)sourceObject new:(id)newValue old:(id)oldValue{
    NSLogD(@"obj:%@ new:%@ old:%@", sourceObject, newValue, oldValue);
}
 */
uxy_handleKVO( testKVO, sourceObject, newValue, oldValue )
{
     NSLogD(@"obj:%@ new:%@ old:%@", sourceObject, newValue, oldValue);
}

uxy_handleKVO( testKVO_BOOL, sourceObject, newValue, oldValue )
{
    NSLogD(@"obj:%@ new:%@ old:%@", sourceObject, newValue, oldValue);
}

uxy_handleNotification(TestVC_aaa, notification)
{
    NSLogD(@"%@", notification.userInfo);
}

#pragma mark - XYTimer
@end
