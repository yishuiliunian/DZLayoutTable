//
//  DZSectionDataController.m
//  Pods
//
//  Created by stonedong on 15/11/10.
//
//

#import "DZSectionDataController.h"
#import <objc/runtime.h>

static void* kDZArrayTitle = &kDZArrayTitle;

@interface NSArray (DZTitle)
@property (nonatomic, strong) NSString* title;
@end


@implementation NSArray (DZTitle)

- (void) setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, kDZArrayTitle, title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*) title
{
    return objc_getAssociatedObject(self, kDZArrayTitle);
}

@end


@interface DZSectionDataController ()
{
    NSMutableArray* _allData;
}
@end


@implementation DZSectionDataController
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _allData = [NSMutableArray new];
    return self;
}
- (NSUInteger) sectionCount
{
    return _allData.count;
}

- (NSUInteger) countOfObjectsAtSection:(NSUInteger)index
{
    NSAssert([self __sectionIndexVaild:index], @"访问非法位置");
    return [_allData[index] count];
}

- (BOOL) __sectionIndexVaild:(NSUInteger)index
{
    if (index>=_allData.count) {
        return NO;
    }
    return YES;
}

- (BOOL) __indexPathVaild:(NSIndexPath*)path
{
    if (![self __sectionIndexVaild:path.section]) {
        return NO;
    }
    NSArray* data = [self sectionDataAtIndex:path.section];
    if (path.row >= data.count) {
        return NO;
    }
    return YES;
}

- (NSArray*) sectionDataAtIndex:(NSUInteger)index
{
    NSAssert([self __sectionIndexVaild:index], @"数组越界%lu",(unsigned long)index);
    return [_allData[index] copy];
}
- (id) objectAtIndexPath:(NSIndexPath*)path
{
    NSAssert([self __indexPathVaild:path], @"数组越界%@",path);
    return _allData[path.section][path.row];
}
- (void) updateSection:(NSArray*)array index:(NSUInteger)index
{
    NSAssert([self __sectionIndexVaild:index], @"数组越界%lu",(unsigned long)index);
    
    NSAssert([array isKindOfClass:[NSArray class]], @"更新%lu section时使用了错误的类型%@", (unsigned long)index,array);
    NSAssert(array.count, @"不可更新空数组%lu",(unsigned long)index);
    _allData[index] = [NSMutableArray arrayWithArray:array];
}
- (void) deleteSection:(NSUInteger)index
{
    NSAssert([self __sectionIndexVaild:index], @"数组越界%lu",(unsigned long)index);
    [_allData removeObjectAtIndex:index];
}
- (void) insertSection:(NSArray*)array index:(NSUInteger)index
{
    NSAssert(index <= _allData.count, @"非法的数组序号%lu",(unsigned long)index);
    NSAssert([array isKindOfClass:[NSArray class]], @"更新%lu section时使用了错误的类型%@", (unsigned long)index,array);
    NSAssert(array.count, @"不可更新空数组%lu",(unsigned long)index);
    [_allData insertObject:[NSMutableArray arrayWithArray:array] atIndex:index];
    
}
- (void) updateObject:(id)object indexPath:(NSIndexPath*)indexpath
{
    NSAssert([self __indexPathVaild:indexpath], @"数组越界");
    NSAssert(object, @"不可更新nil对象到数组");
    _allData[indexpath.section][indexpath.row] = object;
}
- (void) deleteObjectAtIndexPath:(NSIndexPath*)indexPath;
{
    NSAssert([self __indexPathVaild:indexPath], @"数组越界");
    [_allData[indexPath.section] removeObjectAtIndex:indexPath.row];
    NSMutableArray* array = _allData[indexPath.section];
    if (array.count == 0) {
        [self deleteSection:indexPath.section];
    }
}
- (void) insertObject:(id)object indexPath:(NSIndexPath*)indexpath
{
    NSAssert(indexpath.section >= _allData.count, @"插入对象位置超出数组边界");
    NSAssert(object, @"不可更新nil对象到数组");
    if (indexpath.section == _allData.count) {
        [self insertSection:@[object] index:indexpath.section];
    } else {
        NSMutableArray* array = _allData[indexpath.section];
        NSAssert(indexpath.row > array.count, @"插入对象位置超出子数组边界");
        [array insertObject:object atIndex:indexpath.row];
    }
}

- (void) updateTitle:(NSString*)title forSection:(NSUInteger)section
{
    NSAssert([self __sectionIndexVaild:section], @"数组越界%lu",(unsigned long)index);
    NSArray* array = _allData[section];
    array.title = title;
}
- (NSString*) titleForSection:(NSUInteger)index
{
    NSAssert([self __sectionIndexVaild:index], @"数组越界%lu",(unsigned long)index);
    NSArray* array = _allData[index];
    return array.title;
}


- (void) updateAllObjects:(NSArray *)objects
{
    [_allData removeAllObjects];
    for (NSArray* array  in objects) {
        if (![array isKindOfClass:[NSArray class]]) {
            NSAssert(NO, @"传入的数组中，包含非法元素%@",array);
        }
        NSMutableArray* inobjects = [NSMutableArray arrayWithArray:array];
        [_allData addObject:inobjects];
    }
}

@end

