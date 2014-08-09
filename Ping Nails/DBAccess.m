//
//  DBAccess.m
//  Ping Nails
//
//  Created by Taya technologies on 31/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "DBAccess.h"

@implementation DBAccess

static DBAccess *database;
+(DBAccess *)database
{
    if (database==nil) {
        database=[[DBAccess alloc]init];
    }
    return database;
}
-(id)init
{
    self=[super init];
    if (self)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *writableDB = [documentsDirectory stringByAppendingPathComponent:@"sqliteDB.sqlite"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath:writableDB] ) {
            NSString *databaseFile = [[NSBundle mainBundle] pathForResource:@"sqliteDB" ofType:@"sqlite"];
            [fileManager copyItemAtPath:databaseFile toPath:writableDB error:nil];
           // NSLog(@"database copied");
        }
        
        sqliteDb=writableDB;
        
        if (sqlite3_open([sqliteDb UTF8String], &database)!=SQLITE_OK)
        {
        }
//        NSLog(@"path is %@",sqliteDb);
    }
    return self;
}

-(NSMutableArray *)getAllEmpDetails
{
    empDetailsArray=[[NSMutableArray alloc] init];
    NSString *query=@"SELECT *FROM employee";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            int empId=sqlite3_column_int(statement, 0);
            char *empNameChar=(char *) sqlite3_column_text(statement, 1);
            NSMutableString *empName=[[NSMutableString alloc] initWithUTF8String:empNameChar];
            Employee *emp = [[Employee alloc] init];
            emp.employeeid = empId;
            emp.name = empName;
            [empDetailsArray addObject:emp];
        }
        sqlite3_finalize(statement);
    }
    return empDetailsArray;
}

-(NSMutableArray *)getAllCategories
{
    categoriesArray=[[NSMutableArray alloc] init];
    NSString *query=@"SELECT *FROM category";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            int categoryid=sqlite3_column_int(statement, 0);
            char *catNameChar=(char *) sqlite3_column_text(statement, 1);
            char *desChar=(char *) sqlite3_column_text(statement, 2);
            NSMutableString *name=[[NSMutableString alloc] initWithUTF8String:catNameChar];
            NSMutableString *description=[[NSMutableString alloc] initWithUTF8String:desChar];
            Categorys *cat=[[Categorys alloc] init];
            cat.categoryid=categoryid;
            cat.name=name;
            cat.description=description;
            [categoriesArray addObject:cat];
        }
        sqlite3_finalize(statement);
    }
    return categoriesArray;
}

-(NSMutableArray *)getAllProductsbyCategory:(int)categoryid
{
    NSMutableString *selectedImageName;
    productsbyCategoryArray=[[NSMutableArray alloc] init];
    NSString *query=[NSString stringWithFormat:@"SELECT *FROM product where catagoryid = %d",categoryid];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            int productid=sqlite3_column_int(statement, 0);
            char *serviceNameCahr=(char *) sqlite3_column_text(statement, 1);
            char *serviceDescChar=(char *) sqlite3_column_text(statement, 2);
            double price=sqlite3_column_double(statement, 3);
            char *imageNameChar=(char *) sqlite3_column_text(statement, 4);
            int catagoryid=sqlite3_column_int(statement, 5);
            char *selectedImageNamechar=(char *) sqlite3_column_text(statement, 6);
            NSMutableString *name=[[NSMutableString alloc] initWithUTF8String:serviceNameCahr];
            NSMutableString *description=[[NSMutableString alloc]initWithUTF8String:serviceDescChar];
            NSMutableString *imageName=[[NSMutableString alloc]initWithUTF8String:imageNameChar];
            
            if (selectedImageNamechar==NULL) {
                selectedImageName=nil;
                
            }else
            {
                
                selectedImageName=[[NSMutableString alloc]initWithUTF8String:selectedImageNamechar];
            }
            //VO or DTO implementation
            Product *productObj = [[Product alloc] init];
            productObj.productid= productid;
            productObj.name = name;
            productObj.description = description;
            productObj.price=price;
            productObj.imageName=imageName;
            productObj.catagoryid=catagoryid;
            productObj.selectedImageName=selectedImageName;
            productObj.quantity=1;
            [productsbyCategoryArray addObject:productObj];
        }
        sqlite3_finalize(statement);
    }
    return productsbyCategoryArray;
}

-(NSMutableArray *)getEmployeeReservationSchedule:(int)empid date:(int)date month:(int)month year:(int)year
{
    allDayAppointmentsInaDayArray=[NSMutableArray new];
    NSString *query=[NSString stringWithFormat:@"select res.STATRTTIME ,p.name,e.name,c.NAME from reservation res inner join custinfo  c on res.customerid = c.userID inner join product p on res.serviceslist = p.productid  inner join employee e on res.EMPID = e.employeeid where res.empid =%d and res.rdate =%d and res.rmonth =%d and res.ryear =%d",empid,date,month,year];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            char *startTimeChar=(char *) sqlite3_column_text(statement, 0);
            char *empNameCahar=(char *) sqlite3_column_text(statement, 2);
            char *servicesNameChar=(char *) sqlite3_column_text(statement, 1);
            char *custmerNameChar=(char *) sqlite3_column_text(statement, 3);
            NSMutableString *employeeName=[[NSMutableString alloc] initWithUTF8String:empNameCahar];
            NSMutableString *startTime=[[NSMutableString alloc] initWithUTF8String:startTimeChar];
            NSMutableString *ServicesName=[[NSMutableString alloc] initWithUTF8String:servicesNameChar];
            NSMutableString *custmerName=[[NSMutableString alloc] initWithUTF8String:custmerNameChar];
            employeeAgenda *agenda=[[employeeAgenda alloc] init];
            agenda.startingTime=startTime;
            agenda.employeeName=employeeName;
            agenda.servicesName=ServicesName;
            agenda.custmerName=custmerName;
            [allDayAppointmentsInaDayArray addObject:agenda];
        }
        sqlite3_finalize(statement);
    }
    return allDayAppointmentsInaDayArray;
}

-(NSMutableArray *)getDetailsforDay:(int)date month:(int)month withYear:(int)year
{
    dayDetailsArray=[[NSMutableArray alloc]init];
    NSString *query=[NSString stringWithFormat:@"select c.NAME as customername,p.name as servicename,r.STATRTTIME,r.EMPID,c.mobile as mobilenumber  from  reservation r inner join product p on p.productid =  r.SERVICESLIST inner join custinfo c on c.userid=r.customerid where r.rdate=%d and r.rmonth=%d and r.RYEAR =%d order by r.EMPID asc,r.STATRTTIME asc",date,month,year];
    
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            char *customerName=(char *) sqlite3_column_text(statement, 0);
            char *servicesNameChar=(char *) sqlite3_column_text(statement, 1);
            char *startTime=(char *) sqlite3_column_text(statement, 2);
            int empid=(int) sqlite3_column_text(statement, 3);
            char *customerMobileNo=(char *)sqlite3_column_text(statement, 4);
            NSMutableString *customerName1=[[NSMutableString alloc] initWithUTF8String:customerName];
            
            NSMutableString *servicesName=[[NSMutableString alloc] initWithUTF8String:servicesNameChar];
            NSMutableString *startTime1=[[NSMutableString alloc] initWithUTF8String:startTime];
            NSMutableString *emmployeeId=[[NSMutableString alloc] initWithUTF8String:empid];
            NSMutableString *customerMobileNum=[[NSMutableString alloc] initWithUTF8String:customerMobileNo];
            
            DayDetails *details=[[DayDetails alloc]init];
            details.customerName=customerName1;
            details.serviceName=servicesName;
            details.starttime=startTime1;
            details.empid=[emmployeeId intValue];
            details.mobileNo=customerMobileNum;
            [dayDetailsArray addObject:details];
        }
        sqlite3_finalize(statement);
    }
    return dayDetailsArray;
}

-(NSMutableArray *)getDetailsforWeek:(int)pdate ndate:(int)ndate month:(int)month withYear:(int)year
{
    dayDetailsArray=[[NSMutableArray alloc]init];
    
    NSString *query=[NSString stringWithFormat:@"select c.NAME as customername,p.name as servicename,r.STATRTTIME,r.EMPID,r.RDATE as date  from  reservation r inner join product p on p.productid =  r.SERVICESLIST inner join custinfo c on c.userid=r.customerid where r.rdate between %d and %d and r.rmonth=%d and r.RYEAR =%d order by r.EMPID ,r.STATRTTIME asc",pdate,ndate,month,year];
        
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            char *customerName=(char *) sqlite3_column_text(statement, 0);
            char *servicesNameChar=(char *) sqlite3_column_text(statement, 1);
            char *startTime=(char *) sqlite3_column_text(statement, 2);
            int empid=(int) sqlite3_column_text(statement, 3);
            int date=(int) sqlite3_column_text(statement, 4);
            NSMutableString *customerName1=[[NSMutableString alloc] initWithUTF8String:customerName];
            
            NSMutableString *servicesName=[[NSMutableString alloc] initWithUTF8String:servicesNameChar];
            NSMutableString *startTime1=[[NSMutableString alloc] initWithUTF8String:startTime];
            NSMutableString *emmployeeId=[[NSMutableString alloc] initWithUTF8String:empid];
            NSMutableString *dateString =[[NSMutableString alloc] initWithUTF8String:date];
            DayDetails *details=[[DayDetails alloc]init];
            details.customerName=customerName1;
            details.serviceName=servicesName;
            details.starttime=startTime1;
            details.empid=[emmployeeId intValue];
            details.date = [dateString intValue];
            [dayDetailsArray addObject:details];
        }
        sqlite3_finalize(statement);
    }
    return dayDetailsArray;
}

-(NSMutableArray *)getDetailsforMonth:(int)pdate ndate:(int)ndate month:(int)month year:(int)year
{
    dayDetailsArray=[[NSMutableArray alloc]init];
    NSString *query=[NSString stringWithFormat:@"select c.NAME as customername,p.name as servicename,r.STATRTTIME,r.EMPID,r.RDATE as date  from  reservation r inner join product p on p.productid =  r.SERVICESLIST inner join custinfo c on c.userid=r.customerid where r.rdate between %d and %d and r.rmonth=%d and r.RYEAR =%d order by r.RDATE asc",pdate,ndate,month,year];
    
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            char *customerName=(char *) sqlite3_column_text(statement, 0);
            char *servicesNameChar=(char *) sqlite3_column_text(statement, 1);
            char *startTime=(char *) sqlite3_column_text(statement, 2);
            int empid=(int) sqlite3_column_text(statement, 3);
            int date=(int) sqlite3_column_text(statement, 4);
            NSMutableString *customerName1=[[NSMutableString alloc] initWithUTF8String:customerName];
            
            NSMutableString *servicesName=[[NSMutableString alloc] initWithUTF8String:servicesNameChar];
            NSMutableString *startTime1=[[NSMutableString alloc] initWithUTF8String:startTime];
            NSMutableString *emmployeeId=[[NSMutableString alloc] initWithUTF8String:empid];
            NSMutableString *date1=[[NSMutableString alloc]initWithUTF8String:date];
            
            DayDetails *details=[[DayDetails alloc]init];
            details.customerName=customerName1;
            details.serviceName=servicesName;
            details.starttime=startTime1;
            details.empid=[emmployeeId intValue];
            details.date=[date1 intValue];
            [dayDetailsArray addObject:details];
        }
        sqlite3_finalize(statement);
    }
    return dayDetailsArray;

}

-(BOOL) saveCustmerData:(NSString*)name mobile:(NSString*)mobile createdon:(NSString*)createdon reservationObject:()reservationObject
{
    const char *dbpath = [sqliteDb UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into CUSTINFO (name, mobile, createdon) values (\"%@\", \"%@\", \"%@\")",name, mobile, createdon];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_stmt *statement;
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
            
        {
            int custId = [self getLastCustomerId];
            
            Reservation *reservationObj = [[Reservation alloc] init];
            reservationObj=reservationObject;
            
            return [self  saveReservationData:custId empid:reservationObj.empid rdate:reservationObj.rdate rmonth:reservationObj.rmonth ryear:reservationObj.ryear starttime:reservationObj.starttime endtime:reservationObj.endtime servicelist:reservationObj.servicelist createdon:reservationObj.createdon];
        }
        else
        {
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}

-(BOOL) saveReservationData:(int)custmerid empid:(int)empid rdate:(int)rdate rmonth:(int)rmonth ryear:(int)ryear starttime:(NSString *)starttime endtime:(NSString *)endtime servicelist:(int)servicelist createdon:(NSString*)createdon
{
    const char *dbpath = [sqliteDb UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into RESERVATION (CUSTOMERID, EMPID, RDATE,RMONTH,RYEAR,STATRTTIME,ENDTIME,SERVICESLIST,CREATEDON) values ( \"%d\", \"%d\", \"%d\", \"%d\", \"%d\", \"%@\", \"%@\", \"%d\", \"%@\")",custmerid, empid, rdate,rmonth,ryear,starttime,endtime,servicelist,createdon];
        sqlite3_stmt *statement;
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else
        {
            return NO;
        }
        sqlite3_reset(statement);
    }
    
    return NO;
}

-(int)getLastCustomerId{
    int userid=0;
    NSString *query= @"select last_insert_rowid() as custid";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            userid=sqlite3_column_int(statement, 0);
        }
        sqlite3_finalize(statement);
    }
    return userid;
}

@end
