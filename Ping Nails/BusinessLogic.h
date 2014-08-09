//
//  BusinessLogic.h
//  Ping Nails
//
//  Created by Taya Technologies on 27/07/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DayDetails.h"
#import "DBAccess.h"

@interface BusinessLogic : NSObject
@property (nonatomic, strong) NSMutableArray *dayevents,*monthevents,*myevents2,*myevents1;
@property (nonatomic, strong) NSMutableArray *fullDayEvent;
@property (nonatomic, strong) NSMutableArray *fullWeekEvent;
@property (nonatomic, strong) NSMutableArray *fullMonthEvent;
-(NSDate *)getNextorPreviousDate:(int )days withDate:(NSString *)date;
-(NSMutableArray *)getEventsListForDay:(int)date withMonth:(int)month andYear:(int)year;
-(NSMutableArray *)getEventsListForWeekFrom:(int)date to:(int)toDate withMonth:(int)month andYear:(int)year;
-(NSMutableArray *)getEventsListForMonthFrom:(int)date to:(int)toDate withMonth:(int)month andYear:(int)year;
@end
