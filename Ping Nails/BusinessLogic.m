//
//  BusinessLogic.m
//  Ping Nails
//
//  Created by Taya Technologies on 27/07/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "BusinessLogic.h"

@implementation BusinessLogic
@synthesize fullDayEvent,dayevents,fullWeekEvent,fullMonthEvent,monthevents,myevents1,myevents2;


-(NSDate *)getNextorPreviousDate:(int )days withDate:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:date];
    
    NSDateComponents *components= [[NSDateComponents alloc]init];
    [components setDay:days];
    
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *requiredDate =[calender dateByAddingComponents:components toDate:dateFromString options:0];
    
    return requiredDate;
}

-(NSMutableArray *)getEventsListForDay:(int)date withMonth:(int)month andYear:(int)year{
    fullDayEvent = [[NSMutableArray alloc] init];
    DBAccess *dbAccess=[[DBAccess alloc]init];
    NSArray *employeeArray =[dbAccess getAllEmpDetails];
    NSArray *timeTicksArray = [[NSArray alloc] initWithObjects:@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18", nil];
    
    dayevents=[dbAccess getDetailsforDay:date month:month withYear:year];
    [fullDayEvent removeAllObjects];
    for(int employeeCounter=0;employeeCounter <employeeArray.count;employeeCounter++){
        
        Employee *employee =[employeeArray objectAtIndex:employeeCounter];
        
        for(int timeTickCounter=0;timeTickCounter < timeTicksArray.count; timeTickCounter++)
        {
            int  strtTime = [[timeTicksArray objectAtIndex:timeTickCounter] intValue];
            int flag=0;
            for (int eventCounter=0;eventCounter <dayevents.count ; eventCounter++)
            {
                DayDetails *dayDetails =[dayevents objectAtIndex:eventCounter];
                if(dayDetails.empid  == employee.employeeid && [dayDetails.starttime integerValue] == strtTime)
                {
                    flag=1;
                    [fullDayEvent addObject:dayDetails];
                    break;
                }
            }
            if(flag==0)
            {
                [fullDayEvent addObject:[NSNull null]];
            }
        }
    }
return fullDayEvent;
}
-(NSMutableArray *)getEventsListForWeekFrom:(int)date to:(int)toDate withMonth:(int)month andYear:(int)year{

    NSDateComponents* b = [[NSDateComponents alloc] init];
    [b setMonth:month];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[cal dateFromComponents:b]];
    NSUInteger numberOfDaysInMonth = rng.length;
    fullWeekEvent = [[NSMutableArray alloc] init];
    DBAccess *dbAccess=[[DBAccess alloc]init];
    NSMutableArray *weekDates = [NSMutableArray new];
    int j=1;
    int myflag=0;
    int startingdate=date;
    for(int i=0; i<7; i++)
    {
        if (numberOfDaysInMonth>=date && myflag==0)
        {
            [weekDates addObject:[NSString stringWithFormat:@"%d",startingdate]];
            startingdate=startingdate+1;
        }
        else
        {
            [weekDates addObject:[NSString stringWithFormat:@"%d",j]];
            j++;
            myflag++;
        }
    }
    NSArray *timeTicksArray = [[NSArray alloc] initWithObjects:@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18", nil];
    int flag=0;
    for(int dateIndex=0;dateIndex<weekDates.count;dateIndex++)
    {
        if([[weekDates objectAtIndex:dateIndex]integerValue]==numberOfDaysInMonth)
            {
            flag=1;
            }
    }
    if (flag==1)
    {
        myevents1=[dbAccess getDetailsforWeek:date ndate:numberOfDaysInMonth month:month withYear:year];
        myevents2=[dbAccess getDetailsforWeek:1 ndate:toDate month:month+1 withYear:year];
        dayevents = [NSMutableArray arrayWithArray:myevents1];
        [dayevents addObjectsFromArray: myevents2];
    }
    else
    {
        dayevents=[dbAccess getDetailsforWeek:date ndate:toDate month:month withYear:year];
    }
    
     for(int weekCounter=0;weekCounter <weekDates.count;weekCounter++)
     {
         
        for(int timeTickCounter=0;timeTickCounter < timeTicksArray.count; timeTickCounter++)
        {
            int  strtTime = [[timeTicksArray objectAtIndex:timeTickCounter] intValue];
            int flag=0;
            for (int eventCounter=0;eventCounter <dayevents.count ; eventCounter++)
            {
                DayDetails *dayDetails =[dayevents objectAtIndex:eventCounter];
                
                
                if(dayDetails.date == [[weekDates objectAtIndex:weekCounter] intValue]&& [dayDetails.starttime intValue]== strtTime){
                    flag++;
                }
            }
            [fullWeekEvent addObject:[NSNumber numberWithInt:flag]];
        }
    }
    return fullWeekEvent;
}
-(NSMutableArray *)getEventsListForMonthFrom:(int)date to:(int)toDate withMonth:(int)month andYear:(int)year
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSString *dateToget = [NSString stringWithFormat:@"%@-0%d-%d",[[[dateFormatter monthSymbols] objectAtIndex:(month-1)] substringToIndex:3],date,year];
    
    NSDate *dateFromString = [[NSDate alloc] init];
    
    [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
    
    dateFromString = [dateFormatter dateFromString:dateToget];
//    NSCalendar *cal = [NSCalendar currentCalendar];
//    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:dateFromString];
//    NSUInteger numberOfDaysInMonth = range.length;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:dateFromString];
    components.day = 1;
    NSDate *firstDayOfMonth = [gregorian dateFromComponents:components];
    
    [dateFormatter setDateFormat:@"EEEE"];
//    NSString *monthStartingDay=[dateFormatter stringFromDate:firstDayOfMonth];
    
    
    fullMonthEvent=[[NSMutableArray alloc]init];
    DBAccess *dbAccess=[[DBAccess alloc]init];
    NSArray *monthDates = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",nil];

    NSArray *weekNames=[[NSArray alloc]initWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
    
    monthevents=[dbAccess getDetailsforMonth:date ndate:toDate month:month year:year];
    
     for(int monthCounter=0;monthCounter <monthDates.count;monthCounter++)
     {
         if (monthCounter < 7)
         {
             if ([[weekNames objectAtIndex:monthCounter]isEqualToString:[dateFormatter stringFromDate:firstDayOfMonth]])
             {
                 for (int j=1; j<=toDate; j++)
                 {
                     int flag=0;
                     for (int eventCounter=0;eventCounter <monthevents.count ; eventCounter++)
                     {
                         DayDetails *dayDetails =[monthevents objectAtIndex:eventCounter];
                         if(dayDetails.date == [[monthDates objectAtIndex:j] intValue])
                         {
                             flag++;
                         }
                     }
                     if (flag==0)
                     {
                         [fullMonthEvent addObject:@""];
                     }else
                     {
                        [fullMonthEvent addObject:[NSNumber numberWithInt:flag]];
                     }
                 }
                 monthCounter=monthCounter+toDate;
             }
          }
          [fullMonthEvent addObject:@""];
      }
      return fullMonthEvent;
}
@end
