//
//  AMPerson.h
//  About2359Media
//
//  Created by Trieu Khang on 1/18/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMPerson : NSObject

@property (strong, nonatomic) NSString* name;

+(id)initPersonFromDictionary:(NSDictionary*)dic;

@end
