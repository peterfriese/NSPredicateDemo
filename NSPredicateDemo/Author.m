//
//  Author.m
//  NSPredicateDemo
//
//  Created by Peter Friese on 15.03.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import "Author.h"


@implementation Author

@synthesize firstName;
@synthesize lastName;

- (id)init {
    self = [super init];
    if (self) {
    }
    
    return self;
}

+ (Author *)authorWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    Author *author = [[[Author alloc] init] autorelease];
    [author setFirstName:firstName];
    [author setLastName:lastName];
    return author;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (void)dealloc {
    [super dealloc];
}

@end
