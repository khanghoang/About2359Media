//
//  AMPerson.m
//  About2359Media
//
//  Created by Trieu Khang on 1/18/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import "AMPerson.h"

@implementation AMPerson

+(id)initPersonFromDictionary:(NSDictionary*)dic
{
    AMPerson *person = [[AMPerson alloc] init];
    person.name = [dic valueForKey:@"name"];
    return person;
}

@end
