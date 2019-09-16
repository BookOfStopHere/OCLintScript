//
//  FTest.h
//  TestOClint
//
//  Created by BOSH on 2019/9/12.
//  Copyright © 2019 BOSH. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//https://clang.llvm.org/docs/AttributeReference.html#objc-subclassing-restricted
// __attribute__((objc_subclassing_restricted))
@interface FTest : NSObject

- (NSString *)stringKey;

@end

NS_ASSUME_NONNULL_END
