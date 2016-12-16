//
//  RubyChinaNodeEntity.h
//  JoinShow
//
//  Created by Heaven on 13-10-31.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYQuick.h"

@protocol RubyChinaNodeEntity <NSObject>
@end

@interface RubyChinaNodeEntity : NSObject <XYJSONAutoBinding>

@property (nonatomic, assign) int nodeID;
@property (nonatomic,  strong) NSString *name;
@property (nonatomic, assign) int topics_count;
@property (nonatomic,  strong) NSString *summary;
@property (nonatomic, assign) int section_id;
@property (nonatomic, assign) int sort;
@property (nonatomic,  strong) NSString *section_name;

@property (nonatomic, strong) RubyChinaNodeEntity *nextNode;
@property (nonatomic, strong) NSArray <RubyChinaNodeEntity> *array;

@end
