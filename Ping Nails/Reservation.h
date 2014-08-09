//
//  Reservation.h
//  Ping Nails
//
//  Created by Taya technologies on 06/07/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reservation : NSObject
@property (nonatomic ) int empid;
@property (nonatomic ) int rdate;
@property (nonatomic ) int rmonth;
@property (nonatomic ) int ryear;
@property (nonatomic , strong ) NSString *starttime;
@property (nonatomic , strong ) NSString *endtime;
@property (nonatomic ) int servicelist;
@property (nonatomic , strong ) NSString *createdon;

@end
