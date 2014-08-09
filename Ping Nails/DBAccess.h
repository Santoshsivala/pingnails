//
//  DBAccess.h
//  Ping Nails
//
//  Created by Taya technologies on 31/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Employee.h"
#import "Categorys.h"
#import "sqlite3.h"
#import "employeeAgenda.h"
#import "DayDetails.h"
#import "Reservation.h"
@interface DBAccess : NSObject
{
    sqlite3 *database;
    NSMutableArray *empDetailsArray,*categoriesArray,*productsbyCategoryArray,*allDayAppointmentsInaDayArray,*dayDetailsArray;
     NSString *sqliteDb;
}
+(DBAccess *)database;
-(NSMutableArray *)getAllEmpDetails;
-(NSMutableArray *)getAllCategories;
-(NSMutableArray *)getAllProductsbyCategory:(int)categoryid;

-(NSMutableArray *)getEmployeeReservationSchedule:(int)empid date:(int)date month:(int)month year:(int)year;

-(NSMutableArray *)getDetailsforWeek:(int)pdate ndate:(int)ndate month:(int)month withYear:(int)year;
-(NSMutableArray *)getDetailsforDay:(int)date month:(int)month withYear:(int)year;
-(NSMutableArray *)getDetailsforMonth:(int)pdate ndate:(int)ndate month:(int)month year:(int)year;

-(BOOL) saveCustmerData:(NSString*)name mobile:(NSString*)mobile createdon:(NSString*)createdon reservationObject:()reservationObject;
-(BOOL) saveReservationData:(int)custmerid empid:(int)empid rdate:(int)rdate rmonth:(int)rmonth ryear:(int)ryear starttime:(NSString *)starttime endtime:(NSString *)endtime servicelist:(int)servicelist createdon:(NSString*)createdon;

@end
