//
//  DZSectionDataController.h
//  Pods
//
//  Created by stonedong on 15/11/10.
//
//

#import <Foundation/Foundation.h>

@interface DZSectionDataController : NSObject
@property (nonatomic, assign, readonly) NSUInteger sectionCount;
- (NSUInteger) countOfObjectsAtSection:(NSUInteger)index;
- (id) objectAtIndexPath:(NSIndexPath*)path;
- (void) updateSection:(NSArray*)array index:(NSUInteger)index;
- (void) deleteSection:(NSUInteger)index;
- (void) insertSection:(NSArray*)array index:(NSUInteger)index;
- (void) updateObject:(id)object indexPath:(NSIndexPath*)indexpath;
- (void) deleteObjectAtIndexPath:(NSIndexPath*)indexPath;
- (void) insertObject:(id)object indexPath:(NSIndexPath*)indexpath;
- (NSArray*) sectionDataAtIndex:(NSUInteger)index;
- (void) updateObjeect:(id)object indexPath:(NSIndexPath *)indexpath;

- (void) updateTitle:(NSString*)title forSection:(NSUInteger)section;
- (NSString*) titleForSection:(NSUInteger)index;

- (void) updateAllObjects:(NSArray*)objects;

@end
