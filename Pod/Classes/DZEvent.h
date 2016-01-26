//
//  DZEvent.h
//  ChengYi
//
//  Created by stonedong on 16/1/26.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DZEvent;
@protocol DZEventResponser <NSObject>
@optional
@property (nonatomic, weak) id<DZEventResponser> nextEventHandler;
- (void) handleEvent:(DZEvent*)event from:(id)source;
@end


extern NSString* kDZEventDeleted;
extern NSString* kDZEventAdd;

@interface DZEvent : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDictionary* values;
@end
