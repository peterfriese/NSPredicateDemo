//
//  Book.m
//  NSPredicateDemo
//
//  Created by Peter Friese on 15.03.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import "Book.h"


@implementation Book

@synthesize title;
@synthesize isbn;
@synthesize authors;
@synthesize publisher;
@synthesize price;

- (id)init {
    self = [super init];
    if (self) {
        self.authors = [[NSSet alloc] init];
    }
    
    return self;
}

+ (Book *)bookWithTitle:(NSString *)title isbn:(NSString *)isbn price:(NSNumber *)price publisher:(NSString *)publisher authors:(NSSet *)authors {
    Book *book = [[[Book alloc] init] autorelease];
    [book setTitle:title];
    [book setIsbn:isbn];
    [book setPrice:price];
    [book setPublisher:publisher];
    [book setAuthors:authors];
    return book;
}

- (NSString *)description {
    NSString *authorList = [[[self authors] allObjects] componentsJoinedByString:@", "];
    return [NSString stringWithFormat:@"Title: %@\nPublisher: %@\nISBN: %@\nAuthors: %@", [self title], [self publisher], [self isbn], authorList ];
}

- (void)dealloc {
    [authors release];
    [super dealloc];
}

@end
