//
//  DZEvent.m
//  ChengYi
//
//  Created by stonedong on 16/1/26.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "DZEvent.h"
NSString* kDZEventDeleted = @"kDZEventDeleted";
NSString* kDZEventAdd = @"kDZEventAdd";
@implementation DZEvent

+ (instancetype) eventWithName:(NSString *)name
{
    DZEvent* event = [[DZEvent alloc] initWithName:name];
    return event;
}

- (instancetype) initWithName:(NSString *)name
{
    self = [super init];
    if (!self) {
        return self;
    }
    _name = name;
    return self;
}
@end
