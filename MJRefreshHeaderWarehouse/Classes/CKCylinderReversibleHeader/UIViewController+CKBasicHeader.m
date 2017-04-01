//
//  UIViewController+CKBasicHeader.m
//  BatourTool
//
//  Created by mac on 17/3/15.
//  Copyright © 2017年 GRSource. All rights reserved.
//

#import "UIViewController+CKBasicHeader.h"
#import <objc/runtime.h>

typedef enum : NSUInteger {
    kHeader,
    kFooter,
} CKBasicType;


@implementation UIViewController (CKBasicHeader)

-(CKCylinderReversibleHeader *) ckBasicHeader
{
    return (CKCylinderReversibleHeader*)[self ckBasicForClassName:@"CKCylinderReversibleHeader" type:kHeader];
}

-(CKCylinderReversibleFooter *) ckBasicFooter
{
    return (CKCylinderReversibleFooter*)[self ckBasicForClassName:@"CKCylinderReversibleFooter" type:kFooter];
}

-(MJRefreshComponent *) ckBasicForClassName:(NSString *) className type:(CKBasicType) type
{
    MJRefreshComponent * finalComponent = nil;
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            id propertyValue = [self valueForKey:propertyName];
            if([propertyValue isKindOfClass:[UIScrollView class]])
            {
                UIScrollView * scrollView = (UIScrollView *) propertyValue;
                MJRefreshComponent * component = nil;
                if(type == kHeader)
                {
                    component = scrollView.mj_header;
                }
                else {
                    component = scrollView.mj_header;
                }
                if([component isKindOfClass:NSClassFromString(className)])
                {
                    if(component)
                    {
                        finalComponent = component;
                        break;
                    }
                }
            }
        }
    }
    free(properties);
    
    if(finalComponent == nil)
    {
        for (UIView * emView in self.view.subviews) {
            if([emView isKindOfClass:[UIScrollView class]])
            {
                UIScrollView * scrollView = (UIScrollView *) emView;
                if([scrollView.mj_header isKindOfClass:NSClassFromString(className)])
                {
                    MJRefreshComponent * component = nil;
                    if(type == kHeader)
                    {
                        component = scrollView.mj_header;
                    }
                    else {
                        component = scrollView.mj_header;
                    }
                    if(component)
                    {
                        finalComponent = component;
                        break;
                    }
                }
            }
        }
    }
    
    return finalComponent;
}

@end
