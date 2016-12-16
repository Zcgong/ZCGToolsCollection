//
//  XYUISignal.h
//  JoinShow
//
//  Created by Heaven on 14-5-19.
//  Copyright (c) 2014年 Heaven. All rights reserved.
//  Copy from bee Framework

#import "XYQuick_Predefine.h"

#define __XY_UISIGNAL_CALLPATH__        1

// 职责链模式(chain of responsibility)
#pragma mark - #define
#undef	AS_SIGNAL
#define AS_SIGNAL( __name ) \
        - (NSString *)__name; \
        + (NSString *)__name;

#undef	DEF_SIGNAL
#define DEF_SIGNAL( __name )    \
        - (NSString *)__name \
        { \
            return (NSString *)[[self class] __name]; \
        } \
        + (NSString *)__name \
        { \
            static NSString * __local = nil; \
            if ( nil == __local ) \
            { \
                __local = [NSString stringWithFormat:@"%@.%@.%s", @"signal", [self description], #__name]; \
            } \
        return UXY_RETAIN(__local); \
}

#undef	ON_SIGNAL
#define ON_SIGNAL( __signal ) \
        - (void)handleUISignal:(XYUISignal *)__signal

#undef	ON_SIGNAL2
#define ON_SIGNAL2( __filter, __signal ) \
        - (void)handleUISignal_##__filter:(XYUISignal *)__signal

#undef	ON_SIGNAL3
#define ON_SIGNAL3( __class, __name, __signal ) \
        - (void)handleUISignal_##__class##_##__name:(XYUISignal *)__signal


#pragma mark - XYUISignal : NSObject
@interface XYUISignal : NSObject

@property (nonatomic, assign) BOOL            isDead;       // 杀死SIGNAL
@property (nonatomic, assign) BOOL            isReach;      // 是否触达顶级ViewController
@property (nonatomic, assign) NSUInteger      jump;         // 转发次数
@property (nonatomic, assign) id              source;       // 发送来源
@property (nonatomic, assign) id              target;       // 转发目标
@property (nonatomic, copy  ) NSString        *name;        // Signal名字
@property (nonatomic, copy  ) NSString        *namePrefix;  // Signal前辍
@property (nonatomic, strong) NSObject        *object;      // 附带参数

@property (nonatomic, strong) NSObject        *returnValue; // 返回值，默认为空
@property (nonatomic, copy  ) NSString        *preSelector; // 返回值，默认为空

@property (nonatomic, copy  ) NSMutableString *callPath;    // 调用路径


- (BOOL)is:(NSString *)name;
- (BOOL)isKindOf:(NSString *)prefix;
- (BOOL)isSentFrom:(id)source;

// 发送
- (BOOL)send;

// 转发
- (BOOL)forward;
- (BOOL)forward:(id)target;

- (BOOL)boolValue;
- (void)returnYES;
- (void)returnNO;

@end


#pragma mark - NSObject(XYUISignalResponder)
@interface NSObject(XYUISignalResponder)

// 是否响应Signal
//- (BOOL)isUISignalResponder;

@end


#pragma mark - UIView(XYUISignal)
@interface UIView(XYUISignal)

@property (nonatomic, copy) NSString *nameSpace;

+ (NSString *)SIGNAL;
+ (NSString *)SIGNAL_TYPE;

//- (void)handleUISignal:(XYUISignal *)signal;

- (XYUISignal *)sendUISignal:(NSString *)name;
- (XYUISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object;
- (XYUISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object from:(id)source;
- (XYUISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object from:(id)source to:(id)target;

@end


#pragma mark - UIViewController(XYUISignal)
@interface UIViewController(XYUISignal)

@property (nonatomic, copy) NSString *nameSpace;

+ (NSString *)SIGNAL;
+ (NSString *)SIGNAL_TYPE;

//- (void)handleUISignal:(XYUISignal *)signal;

- (XYUISignal *)sendUISignal:(NSString *)name;
- (XYUISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object;
- (XYUISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object from:(id)source;
- (XYUISignal *)sendUISignal:(NSString *)name withObject:(NSObject *)object from:(id)source to:(id)target;

@end

#pragma mark - XYUISignal(SourceView)
@interface XYUISignal(SourceView)

@property (nonatomic, readonly) UIView           *sourceView;
@property (nonatomic, readonly) UIViewController *sourceViewController;

@end

/*
 #pragma mark - NSObject(XYUISignal_delegate)
 // 此处扩展其它类也可以使用signal
 @interface NSObject(XYUISignal_delegate)
 
 @property (nonatomic, strong) NSMutableSet *XY_delegates;       // 处理事件的委托集合, 和XY_deldgate不兼容
 @property (nonatomic, weak) id XY_deldgate;                     // 处理事件的委托
 
 @end
 */

