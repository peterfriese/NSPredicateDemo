//
//  Book.h
//  NSPredicateDemo
//
//  Created by Peter Friese on 15.03.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Book : NSObject {
@private
    
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *isbn;
@property (nonatomic, retain) NSString *publisher;
@property (nonatomic, retain) NSSet *authors;
@property (nonatomic, retain) NSNumber *price;

+ (Book *)bookWithTitle:(NSString *)title isbn:(NSString *)isbn price:(NSNumber *)price publisher:(NSString *)publisher authors:(NSSet *)authors;

@end
