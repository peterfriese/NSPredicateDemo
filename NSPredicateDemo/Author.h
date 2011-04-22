//
//  Author.h
//  NSPredicateDemo
//
//  Created by Peter Friese on 15.03.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Author : NSObject {
@private
    
}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;

+ (Author *)authorWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;

@end
