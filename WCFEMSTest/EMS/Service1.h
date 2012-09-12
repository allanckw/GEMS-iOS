#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class Service1_GetData;
@class Service1_GetDataResponse;
@class Service1_GetDataUsingDataContract;
@class Service1_GetDataUsingDataContractResponse;
#import "tns1.h"
@interface Service1_GetData : NSObject {
	
/* elements */
	NSNumber * value;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1_GetData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSNumber * value;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface Service1_GetDataResponse : NSObject {
	
/* elements */
	NSString * GetDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1_GetDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface Service1_GetDataUsingDataContract : NSObject {
	
/* elements */
	tns1_CompositeType * composite;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1_GetDataUsingDataContract *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_CompositeType * composite;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface Service1_GetDataUsingDataContractResponse : NSObject {
	
/* elements */
	tns1_CompositeType * GetDataUsingDataContractResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1_GetDataUsingDataContractResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) tns1_CompositeType * GetDataUsingDataContractResult;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "Service1.h"
#import "ns1.h"
#import "tns1.h"
#import "tns2.h"
@class Default;
@interface Service1 : NSObject {
	
}
+ (Default *)Default;
@end
@class DefaultResponse;
@class DefaultOperation;
@protocol DefaultResponseDelegate <NSObject>
- (void) operation:(DefaultOperation *)operation completedWithResponse:(DefaultResponse *)response;
@end
@interface Default : NSObject <DefaultResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(DefaultOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (DefaultResponse *)GetDataUsingParameters:(Service1_GetData *)aParameters ;
- (void)GetDataAsyncUsingParameters:(Service1_GetData *)aParameters  delegate:(id<DefaultResponseDelegate>)responseDelegate;
- (DefaultResponse *)GetDataUsingDataContractUsingParameters:(Service1_GetDataUsingDataContract *)aParameters ;
- (void)GetDataUsingDataContractAsyncUsingParameters:(Service1_GetDataUsingDataContract *)aParameters  delegate:(id<DefaultResponseDelegate>)responseDelegate;
@end
@interface DefaultOperation : NSOperation {
	Default *binding;
	DefaultResponse *response;
	id<DefaultResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) Default *binding;
@property (readonly) DefaultResponse *response;
@property (nonatomic, assign) id<DefaultResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(Default *)aBinding delegate:(id<DefaultResponseDelegate>)aDelegate;
@end
@interface Default_GetData : DefaultOperation {
	Service1_GetData * parameters;
}
@property (retain) Service1_GetData * parameters;
- (id)initWithBinding:(Default *)aBinding delegate:(id<DefaultResponseDelegate>)aDelegate
	parameters:(Service1_GetData *)aParameters
;
@end
@interface Default_GetDataUsingDataContract : DefaultOperation {
	Service1_GetDataUsingDataContract * parameters;
}
@property (retain) Service1_GetDataUsingDataContract * parameters;
- (id)initWithBinding:(Default *)aBinding delegate:(id<DefaultResponseDelegate>)aDelegate
	parameters:(Service1_GetDataUsingDataContract *)aParameters
;
@end
@interface Default_envelope : NSObject {
}
+ (Default_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface DefaultResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
