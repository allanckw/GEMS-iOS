#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class tns1_CompositeType;
@interface tns1_CompositeType : NSObject {
	
/* elements */
	USBoolean * BoolValue;
	NSString * StringValue;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (tns1_CompositeType *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * BoolValue;
@property (retain) NSString * StringValue;
/* attributes */
- (NSDictionary *)attributes;
@end
