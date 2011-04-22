//
//  main.m
//  NSPredicateDemo
//
//  Created by Peter Friese on 15.03.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
#import "Book.h"

NSArray * createBookshelf() {
    Author *jackNutting = [Author authorWithFirstName:@"Jack" andLastName:@"Nutting"];
    Author *daveWooldridge = [Author authorWithFirstName:@"Dave" andLastName:@"Wooldridge"];
    Author *davidMark = [Author authorWithFirstName:@"David" andLastName:@"Mark"];
    
    Book *beginningIPad = [Book bookWithTitle:@"Beginning iPad Development for iPhone Developers" 
                                         isbn:@"978-1-4302-3021-2" 
                                        price:[NSNumber numberWithFloat:26.95]
                                    publisher:@"Apress"
                                      authors:[NSSet setWithObjects:jackNutting, daveWooldridge, davidMark, nil]];
    
    Author *markDalrymple = [Author authorWithFirstName:@"Mark" andLastName:@"Dalrymple"];
    Author *scottKnaster = [Author authorWithFirstName:@"Scott" andLastName:@"Knaster"];
    
    Book *learnObjectiveCMac = [Book bookWithTitle:@"Learn Objective-C on the Mac" 
                                              isbn:@"978-1-4302-1815-9" 
                                             price:[NSNumber numberWithFloat:38.91]
                                         publisher:@"Apress" 
                                           authors:[NSSet setWithObjects:markDalrymple, scottKnaster, nil]];
    
    Author *jeffLaMarche = [Author authorWithFirstName:@"Jeff" andLastName:@"LaMarche"];
    
    Book *beginningIPhone3Development = [Book bookWithTitle:@"Beginning iPhone 3 Development" 
                                                       isbn:@"978-1-4302-2459-4" 
                                                      price:[NSNumber numberWithFloat:23.95]
                                                  publisher:@"Apress" 
                                                    authors:[NSSet setWithObjects:davidMark, jeffLaMarche, nil]];
    
    Author *billDudney = [Author authorWithFirstName:@"Bill" andLastName:@"Dudney"];
    Author *chrisAdamson = [Author authorWithFirstName:@"Chris" andLastName:@"Adamson"];
    
    Book *iPhoneSDKDevelopment = [Book bookWithTitle:@"iPhone SDK Development"
                                                isbn:@"978-1-934356-25-8" 
                                               price:[NSNumber numberWithFloat:28.95]
                                           publisher:@"The Pragmatic Bookshelf" 
                                             authors:[NSSet setWithObjects:billDudney, chrisAdamson, nil]];
    
    Author *maxFirtman = [Author authorWithFirstName:@"Maximiliano" andLastName:@"Firtman"];
    Book *mobileWeb = [Book bookWithTitle:@"Programming the Mobile Web" 
                                     isbn:@"978-0-596-80778-8" 
                                    price:[NSNumber numberWithFloat:49.99] 
                                publisher:@"O'Reilly" 
                                  authors:[NSSet setWithObject:maxFirtman]];
    
    NSArray *bookshelf = [NSArray arrayWithObjects:beginningIPad, learnObjectiveCMac, beginningIPhone3Development, iPhoneSDKDevelopment, mobileWeb, nil];
    return bookshelf;
}

void dumpBookshelf(NSString *title, NSArray *shelf) {
    NSLog(@"%@", title);
    for (Book *book in shelf) {
        NSLog(@"\n%@\n---", book);
    }
}

int main (int argc, const char * argv[]){

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    NSArray *bookshelf = createBookshelf();
    dumpBookshelf(@"Bookshelf", bookshelf);
    
    NSMutableArray *oldSkoolFiltered = [[NSMutableArray alloc] init];
    for (Book *book in bookshelf) {
        if ([book.publisher isEqualToString:@"Apress"]) {
            [oldSkoolFiltered addObject:book];
        }
    }
    dumpBookshelf(@"Old skool filtered: Books by Apress", oldSkoolFiltered);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"publisher == %@", @"Apress" ];
    NSArray *filtered  = [bookshelf filteredArrayUsingPredicate:predicate];
    dumpBookshelf(@"Books by Apress", filtered);
    
    predicate = [NSPredicate predicateWithFormat:@"authors.lastName CONTAINS %@", @"Mark" ];
    filtered  = [bookshelf filteredArrayUsingPredicate:predicate];
    dumpBookshelf(@"Books by authors that contain the string 'Mark'", filtered);
    
    NSArray *favoritePublishers = [NSArray arrayWithObjects:@"Apress", @"O'Reilly", nil];
    predicate = [NSPredicate predicateWithFormat:@"publisher IN %@", favoritePublishers];
    filtered  = [bookshelf filteredArrayUsingPredicate:predicate];
    dumpBookshelf(@"Books published by my favorite publishers", filtered);
    
    predicate = [NSPredicate predicateWithFormat:@"title MATCHES '.*(iPhone|iPad).*'"];
    filtered = [bookshelf filteredArrayUsingPredicate:predicate];
    dumpBookshelf(@"Books that contain 'iPad' or 'iPhone' in their title", filtered);
    
    NSLog(@"Average price");
    NSNumber *average = [bookshelf valueForKeyPath:@"@avg.price"];
    NSLog(@"Price: %@", average);    
    
    [pool drain];
    return 0;
}

