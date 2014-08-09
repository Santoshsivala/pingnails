//
//  ReservationViewController.m
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//
#import "ReservationViewController.h"
@interface ReservationViewController ()
{
    NSMutableArray *monthNameArrayforNumberFormat;
}
@end

@implementation ReservationViewController

@synthesize arrayCalendars,mySegment,toolBarView,DayCalendarView,MonthCalendarView,MCButtonsBg,MCDisplayLabel,MCDayNamesView,collectionViewPack,WeekScrollView,WCalendarView,collectionViewPack2,WeekButtonsBgView,WeekDaysBgView,collectionViewPack3,DayScrollView,DayButtonsBgView,EmployeeNamesBgView,collectionViewPack4,DayViewHourLabel,monthCollectionViewLabelLine,WeekTimeView,MonthNextBtn,MonthPreBtn,WeekNextBtn,WeekPreBtn,DayNextBtn,DayPreBtn,WeekDaysDisplayLabel,DayDisplaylabelInDayView,WeekDay1stLabel,WeekDay2ndLabel,WeekDay3rdLabel,WeekDay4thLabel,WeekDay5thLabel,WeekDay6thLabel,WeekDay7thLabel,AgendaView,weekEventArray,dayArray,monthsDatesArrayInMonthView,dayNamesArray;

@synthesize AgendaRightTableView,AgendaLeftTableView,AgendaLeftBGView,AgendaRightBGView,monthEventArray,agendaHeaderLabel,customerFormBtn;

@synthesize servicesTextfield,subServicesTextfield,reservationTimeTextfield,employeeTextfield,customerMobileNo,customerName,mypicker,MydatePicker,customerFormView;

static NSString * const kCellReuseIdentifier = @"collectionViewCell";
static NSString * const kCellReuseIdentifier2 = @"collectionViewCell2";
static NSString * const kCellReuseIdentifier3 = @"collectionViewCell3";
static NSString * const kCellReuseIdentifier4 = @"collectionViewCell4";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //EmpNamesInDayView
    [self.collectionViewPack4 registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
    [self.collectionViewPack4 registerNib:[UINib nibWithNibName:@"CollectionViewItemEmpNamesInDay" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier4];
   // self.collectionViewPack4.backgroundColor = [UIColor lightGrayColor];
    flowLayout4 = [[UICollectionViewFlowLayout alloc] init];
    
    [self.collectionViewPack4 setCollectionViewLayout:flowLayout4];
    [self.collectionViewPack4 setAllowsSelection:YES];
    self.collectionViewPack4.delegate=self;
    self.collectionViewPack4.dataSource=self;
    [flowLayout4 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.EmployeeNamesBgView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DayNameDayview.png"]]];
   // [collectionViewPack4 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"empnameViewBg.png"]]];
    [collectionViewPack4 setBackgroundColor:[UIColor clearColor]];
    //day
    DayScrollView.delegate = self;
    [DayScrollView setScrollEnabled:YES];
    [DayScrollView setContentSize:CGSizeMake(1024, 940)];
    [self.collectionViewPack3 registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
    [self.collectionViewPack3 registerNib:[UINib nibWithNibName:@"CollectionViewItemDay" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier3];
    self.collectionViewPack3.backgroundColor = [UIColor lightGrayColor];
    flowLayout3 = [[UICollectionViewFlowLayout alloc] init];
    [self.collectionViewPack3 setCollectionViewLayout:flowLayout3];
    [self.collectionViewPack3 setAllowsSelection:YES];
    self.collectionViewPack3.delegate=self;
    self.collectionViewPack3.dataSource=self;
    [flowLayout3 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.DayButtonsBgView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DayNameDayview.png"]]];
    [DayCalendarView setBackgroundColor:[UIColor lightGrayColor]];
    [DayViewHourLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DayViewHourLabelBg.png"]]];
    
    //week
    WeekScrollView.delegate = self;
    [WeekScrollView setScrollEnabled:YES];
    [WeekScrollView setContentSize:CGSizeMake(1024, 1940)];
    [self.collectionViewPack2 registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
    [self.collectionViewPack2 registerNib:[UINib nibWithNibName:@"CollectionViewItemWeek" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier2];
    self.collectionViewPack2.backgroundColor = [UIColor lightGrayColor];
    flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    [self.collectionViewPack2 setCollectionViewLayout:flowLayout2];
    [self.collectionViewPack2 setAllowsSelection:YES];
    self.collectionViewPack2.delegate=self;
    self.collectionViewPack2.dataSource=self;
    [flowLayout2 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.WeekButtonsBgView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DayNameDayview.png"]]];
    [self.WeekDaysBgView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DayNameDayview.png"]]];
    [self.WeekTimeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MonthViewBG1.png"]]];
    
    //month
    [self.collectionViewPack registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
    [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItemMonth" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier];
    self.collectionViewPack.backgroundColor = [UIColor lightGrayColor];
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [self.collectionViewPack setCollectionViewLayout:flowLayout];
    [self.collectionViewPack setAllowsSelection:YES];
    self.collectionViewPack.delegate=self;
    self.collectionViewPack.dataSource=self;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
	[self.toolBarView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"headerBarBG.png"]]];
    [self.MCButtonsBg setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"DayNameDayview.png"]]];
    [self.MCDayNamesView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MCDayNames.png"]]];
    [self.MonthCalendarView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MonthViewBG1.png"]]];
    [self.monthCollectionViewLabelLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MonthViewBG1.png"]]];
    dayNamesArray=[NSMutableArray arrayWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
    //another purpose like view appear
    [self.mySegment setSelectedSegmentIndex:3];
    CGRect frame = CGRectMake (473, 15, 415, 30);
    self.mySegment.frame = frame;
    mySegment.layer.cornerRadius=20;

    
    arrayCalendars = @[ DayCalendarView, WCalendarView, MonthCalendarView,AgendaView,customerFormView];
    //agendaView purpose
    
    employeeArrayTimings00=[NSMutableArray new];
    employeeArrayTimings01=[NSMutableArray new];
    employeeArrayTimings02=[NSMutableArray new];
    employeeArrayTimings10=[NSMutableArray new];
    employeeArrayTimings11=[NSMutableArray new];
    employeeArrayTimings12=[NSMutableArray new];
    employeeArrayTimings20=[NSMutableArray new];
    employeeArrayTimings21=[NSMutableArray new];
    employeeArrayTimings22=[NSMutableArray new];
    employeeArrayTimings30=[NSMutableArray new];
    employeeArrayTimings31=[NSMutableArray new];
    employeeArrayTimings32=[NSMutableArray new];
    employeeArrayTimings40=[NSMutableArray new];
    employeeArrayTimings41=[NSMutableArray new];
    employeeArrayTimings42=[NSMutableArray new];
    employeeArrayTimings50=[NSMutableArray new];
    employeeArrayTimings51=[NSMutableArray new];
    employeeArrayTimings52=[NSMutableArray new];
    employeeArrayTimings60=[NSMutableArray new];
    employeeArrayTimings61=[NSMutableArray new];
    employeeArrayTimings62=[NSMutableArray new];
    employeeArrayTimings70=[NSMutableArray new];
    employeeArrayTimings71=[NSMutableArray new];
    employeeArrayTimings72=[NSMutableArray new];
    employeeArrayTimings80=[NSMutableArray new];
    employeeArrayTimings81=[NSMutableArray new];
    employeeArrayTimings82=[NSMutableArray new];
    employeeArrayTimings90=[NSMutableArray new];
    employeeArrayTimings91=[NSMutableArray new];
    employeeArrayTimings92=[NSMutableArray new];

    dbAccess = [[DBAccess alloc] init];
    checkBoxArray =[[NSMutableArray alloc]initWithCapacity:11];
    for (int i = 0; i <=11; i++)
    {
        [checkBoxArray addObject:[NSNumber numberWithBool:NO]];
    }
    employeesArr2 = [dbAccess getAllEmpDetails];
    tempEmpNameArray=[[NSMutableArray alloc]init];
    for(int counter =0; counter < employeesArr2.count; counter++)
    {
        Employee *emp = [employeesArr2 objectAtIndex:counter];
        [tempEmpNameArray addObject:[NSMutableString stringWithFormat:@"%@",emp.name]];
    }
    [self.AgendaLeftTableView registerNib:[UINib nibWithNibName:@"employeNameCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.AgendaRightTableView registerNib:[UINib nibWithNibName:@"employeeReservationCell" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    self.AgendaLeftBGView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"BG.png"]];
    self.AgendaLeftTableView.backgroundColor=[UIColor clearColor];
    self.AgendaRightTableView.backgroundColor=[UIColor clearColor];
    self.AgendaRightBGView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"MonthViewBG1.png"]];
    [self.agendaHeaderLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"employ ajenda.png"]]];
    
//customer form
    monthNameArrayforNumberFormat=[[NSMutableArray alloc] initWithObjects:@"January", @"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December",nil];
    dateTimeSeparationArray=[NSArray new];
    dateTimeSeparationArray2=[NSArray new];
    
    DBdata=[DBAccess new];
    mypicker=[[UIPickerView alloc] init];
    [mypicker setDataSource:self];
    [mypicker setDelegate:self];
    MydatePicker=[[UIDatePicker alloc] init];   [MydatePicker setBackgroundColor:[UIColor clearColor]];
    textfieldPickerIdentifier=0;
    
   [self customViewMethod];
    customerFormView.userInteractionEnabled = YES;//WeekScrollView
   [collectionViewPack3 setShowsHorizontalScrollIndicator:NO];
    [DayScrollView setShowsVerticalScrollIndicator:NO];
    [WeekScrollView setShowsVerticalScrollIndicator:NO];
    [AgendaLeftTableView setShowsVerticalScrollIndicator:NO];
    [AgendaRightTableView setShowsVerticalScrollIndicator:NO];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView==collectionViewPack2||collectionView==collectionViewPack3)
    {
        return 11;
    }else if (collectionView==collectionViewPack4)
    {
        return tempEmpNameArray.count;
    }
    else
    {
        return 42;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView==collectionViewPack2){
        return 7;
    }else if (collectionView==collectionViewPack3){
        return tempEmpNameArray.count;
    }else if (collectionView==collectionViewPack4){
        return 1;
    }
    return 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView==collectionViewPack2){
        return CGSizeMake(136.9,161);
    }
    else if (collectionView==collectionViewPack3){
        return CGSizeMake(125,80);
    }
    else if (collectionView==collectionViewPack4){
        return CGSizeMake(125,43);
    }else{
        return CGSizeMake(140.,84.5);
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView==collectionViewPack2){
        int index = 11*indexPath.section+indexPath.row;
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier2 forIndexPath:indexPath];
        
            UILabel *noOfServices2=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 136.9, 161)];
        [noOfServices2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"boxes.png"]]];
            [noOfServices2 setTextColor:[UIColor whiteColor]];
            [noOfServices2 setTextAlignment:NSTextAlignmentCenter];
            UILabel *generalLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 136, 80)];
            [generalLabel setBackgroundColor:[UIColor clearColor]];
            [generalLabel setTextColor:[UIColor whiteColor]];
            [generalLabel setTextAlignment:NSTextAlignmentCenter];
            [noOfServices2 addSubview:generalLabel];
            [cell.contentView addSubview:noOfServices2];
                
                if([[weekEventArray objectAtIndex:index] intValue]!=0){
                    generalLabel.text=[NSString stringWithFormat:@"%d",[[weekEventArray objectAtIndex:index] intValue]];
                    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"boxes2.png"]]];
                }else
                {
                    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"boxes.png"]]];
                }
        
        return cell;
    }
    else if (collectionView==collectionViewPack){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            for (UIView *v in [cell.contentView subviews])
                [v removeFromSuperview];
            
            if ([self.collectionViewPack.indexPathsForVisibleItems containsObject:indexPath]) {
        
                UILabel *dayEventsCountLabel=[[UILabel alloc] initWithFrame:CGRectMake(1, 20, 112, 40)];
                [dayEventsCountLabel setBackgroundColor:[UIColor clearColor]];
                [dayEventsCountLabel setFont:[UIFont fontWithName:@"AmericanTypewriter" size:15]];
                [dayEventsCountLabel setTextColor:[UIColor greenColor]];
                dayEventsCountLabel.textAlignment=NSTextAlignmentCenter;
                [cell.contentView addSubview:dayEventsCountLabel];

                UILabel *monthDateLabel1=[[UILabel alloc] initWithFrame:CGRectMake(1, 3, 35, 15)];
                [monthDateLabel1 setBackgroundColor:[UIColor clearColor]];
                [monthDateLabel1 setFont:[UIFont fontWithName:@"AmericanTypewriter" size:20] ];
                [monthDateLabel1 setTextColor:[UIColor lightGrayColor]];
                monthDateLabel1.textAlignment=NSTextAlignmentLeft;
                [cell.contentView addSubview:monthDateLabel1];
                
                if([[monthEventArray objectAtIndex:indexPath.row] intValue]!=0)
                {
                    [dayEventsCountLabel setText:[NSString stringWithFormat:@"%d",[[monthEventArray objectAtIndex:indexPath.row] intValue]]];
                }
                monthDateLabel1.text=[monthsDatesArrayInMonthView objectAtIndex:indexPath.row];
                [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"CMCellBG.png"]]];
            }
        });
        
        return cell;
    }else if (collectionView==collectionViewPack4){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier4 forIndexPath:indexPath];
        EmpNamesInDayView=(UILabel *)[cell viewWithTag:900];
        EmpNamesInDayView.text=[tempEmpNameArray objectAtIndex:indexPath.row];
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"empcellnameViewBg.png"]]];
        return cell;
    }
    else{
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier3 forIndexPath:indexPath];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            for (UIView *v in [cell.contentView subviews])
                [v removeFromSuperview];
            
            if ([self.collectionViewPack3.indexPathsForVisibleItems containsObject:indexPath]) {
                        UILabel *mylb=[[UILabel alloc] initWithFrame:CGRectMake(12, 3, 112, 14)];
                        [mylb setBackgroundColor:[UIColor clearColor]];
                        [mylb setTextColor:[UIColor lightGrayColor]];
                        [mylb setFont:[UIFont fontWithName:@"AmericanTypewriter" size:13.0]];
                        mylb.textAlignment= NSTextAlignmentLeft;
                        [cell.contentView addSubview:mylb];
                
                        UILabel *mylb2=[[UILabel alloc] initWithFrame:CGRectMake(12, 42, 112, 17)];
                        [mylb2 setBackgroundColor:[UIColor clearColor]];
                        [mylb2 setTextColor:[UIColor whiteColor]];
                        [mylb2 setFont:[UIFont fontWithName:@"Arial" size:13.0]];
                        mylb2.textAlignment= NSTextAlignmentLeft;
                        [cell.contentView addSubview:mylb2];
                
                        UILabel *mylb3=[[UILabel alloc] initWithFrame:CGRectMake(12, 17, 112, 18)];
                        [mylb3 setBackgroundColor:[UIColor clearColor]];
                        [mylb3 setTextColor:[UIColor whiteColor]];
                        [mylb3 setFont:[UIFont fontWithName:@"Arial" size:13.0]];
                        mylb3.textAlignment= NSTextAlignmentLeft;
                        [cell.contentView addSubview:mylb3];
                
                
                        UILabel *mylb4=[[UILabel alloc] initWithFrame:CGRectMake(12, 59, 112, 18)];
                        [mylb4 setBackgroundColor:[UIColor clearColor]];
                        [mylb4 setTextColor:[UIColor whiteColor]];
                        [mylb4 setFont:[UIFont fontWithName:@"Arial" size:13.0]];
                        mylb4.textAlignment= NSTextAlignmentLeft;
                        [cell.contentView addSubview:mylb4];
                
                
                int index = 11 * indexPath.section + indexPath.row;
                if([dayArray objectAtIndex:index] != [NSNull null] && [dayArray objectAtIndex:index] != nil){
                    DayDetails *details = [dayArray objectAtIndex:index];
                    
                    
                    [mylb setText:[NSString stringWithFormat:@"%@ :00",details.starttime]];
                    
                    [mylb2 setText:details.customerName];
                    
                    [mylb3 setText:details.serviceName];
                    
                    [mylb4 setText:details.mobileNo];
                   
                    
                    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"day-cell-bg.png"]]];
                }else{
                    if (indexPath.section %2==0) {
                        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"cell-bg2.png"]]];
                    }else{
                        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"cell-3.png"]]];
                    }
                }
                
            }
        });
        return cell;
    }

    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView==collectionViewPack)
    {
        [self.mySegment setSelectedSegmentIndex:0];
        [self.view bringSubviewToFront:[arrayCalendars objectAtIndex:0]];
        BusinessLogic *logic = [[BusinessLogic alloc] init];
        [agendaHeaderLabel setHidden:YES];
        
        NSArray *dateTimeSeparationArr=[NSMutableArray new];
        dateTimeSeparationArr=[[NSString stringWithFormat:@"%@ %@",[monthsDatesArrayInMonthView objectAtIndex:indexPath.row],MCDisplayLabel.text ] componentsSeparatedByString:@" "];
        
        int monthNo=  [monthNameArrayforNumberFormat indexOfObject:[dateTimeSeparationArr objectAtIndex:1]]+1;
        
        NSDateFormatter *dateFormatter=[NSDateFormatter new];
        NSString *strDate=[NSString stringWithFormat:@"%@-%d-%@",[dateTimeSeparationArr objectAtIndex:2],monthNo,[dateTimeSeparationArr objectAtIndex:0]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *targetDate=[dateFormatter dateFromString:strDate];
        [dateFormatter setDateFormat:@"EEEE"];
        
        if ([[dateTimeSeparationArr objectAtIndex:0] length]==1)
        {
            DayDisplaylabelInDayView.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@, %@ 0%@, %@",[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:targetDate]],[dateTimeSeparationArr objectAtIndex:1],[dateTimeSeparationArr objectAtIndex:0],[dateTimeSeparationArr objectAtIndex:2]]];
        }else
        {
            DayDisplaylabelInDayView.text=[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@, %@ %@, %@",[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:targetDate]],[dateTimeSeparationArr objectAtIndex:1],[dateTimeSeparationArr objectAtIndex:0],[dateTimeSeparationArr objectAtIndex:2]]];
        }
        
        dayArray = [logic getEventsListForDay:[[dateTimeSeparationArr objectAtIndex:0] intValue] withMonth:monthNo andYear:[[dateTimeSeparationArr objectAtIndex:2] intValue]];
        [self.collectionViewPack3 reloadData];
        [self.collectionViewPack4 reloadData];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (collectionView==collectionViewPack||collectionView==collectionViewPack2)
    {
        return 0.5;
    }
    return 1.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (collectionView==collectionViewPack4)
    {
        return 1.0;
    }else if (collectionView==collectionViewPack)
    {
        return 0.5;
    }else if (collectionView==collectionViewPack2)
    {
        return 0.5;
    }else{
        return 0.5;
    }
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (collectionView==collectionViewPack2){
        return UIEdgeInsetsMake(0.5,0.5,0.5,0.5);
    }else if (collectionView==collectionViewPack){
        return UIEdgeInsetsMake(0,0,0,0);
    }else if (collectionView==collectionViewPack4){
        return UIEdgeInsetsMake(0,0,0,0);
    }
    else{ return UIEdgeInsetsMake(0,0,0,1);
    }
}

- (IBAction)segControllerAction:(id)sender
{
   [self getCollection:mySegment.selectedSegmentIndex];
   [self.view bringSubviewToFront:[arrayCalendars objectAtIndex:mySegment.selectedSegmentIndex]];
}

- (IBAction)PrevOrNextbuttonAction:(id)sender
{
    BusinessLogic *logic = [[BusinessLogic alloc] init];
    UIButton *btn = (UIButton*)sender;
    if (btn.tag==510||btn.tag==610||btn.tag==710)
    {
        if (btn.tag==510)
        {
            dayArray=nil;
        NSArray *timeDateSepArrDay=[NSArray new];
        timeDateSepArrDay=[DayDisplaylabelInDayView.text componentsSeparatedByString:@" "];
        
            NSString *sendDateStr=[NSString stringWithFormat:@"%@-%@-%@",[[timeDateSepArrDay objectAtIndex:1]substringToIndex:3],[[timeDateSepArrDay objectAtIndex:2]substringToIndex:2],[timeDateSepArrDay objectAtIndex:3]];
            
            NSDate *requitedate =[logic getNextorPreviousDate:0 withDate:sendDateStr];

            NSArray *dateTimeSeparationArray3=[NSMutableArray new];
            dateTimeSeparationArray3=[[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10] componentsSeparatedByString:@"-"];

            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"EEEE"];
            
            NSString *strDate=[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSDate *targetDate=[dateFormatter dateFromString:strDate];
            [dateFormatter setDateFormat:@"EEEE"];
         
            DayDisplaylabelInDayView.text=[NSString stringWithFormat:@"%@, %@ %@, %@",[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:targetDate]],[NSString stringWithFormat:@"%@",[[dateFormatter monthSymbols] objectAtIndex:[[dateTimeSeparationArray3 objectAtIndex:1] intValue]-1]],[dateTimeSeparationArray3 objectAtIndex:2],[dateTimeSeparationArray3 objectAtIndex:0]];
            
            dayArray = [logic getEventsListForDay:[[dateTimeSeparationArray3 objectAtIndex:2] intValue] withMonth:[[dateTimeSeparationArray3 objectAtIndex:1] intValue] andYear:[[dateTimeSeparationArray3 objectAtIndex:0] intValue]];
            
            [self.collectionViewPack3 reloadData];
            [self.collectionViewPack4 reloadData];
        }else if (btn.tag==610)
        {
            [weekEventArray removeAllObjects];
            [self.collectionViewPack2 reloadData];
        NSString *sendDateStr=[NSString stringWithFormat:@"%@-%@-%@",[WeekDaysDisplayLabel.text substringToIndex:3],[[WeekDaysDisplayLabel.text substringFromIndex:[WeekDaysDisplayLabel.text length]-11]substringToIndex:2],[WeekDaysDisplayLabel.text substringFromIndex:[WeekDaysDisplayLabel.text length] - 4]];
       
            NSDate *requitedateWeek=[logic getNextorPreviousDate:-6 withDate:sendDateStr];
           
            NSMutableArray * datesArray=[NSMutableArray new];
            for (int i=0; i<7; i++)
            {
                NSDate *tomorrow = [NSDate dateWithTimeInterval:(24*60*60*i) sinceDate:requitedateWeek];
                NSString *endDateStr=[[NSString stringWithFormat:@"%@",tomorrow] substringToIndex:10];
                endDateStr= [endDateStr substringFromIndex:8];
                [datesArray addObject:endDateStr ];
            }
            WeekDay1stLabel.text=[NSString stringWithFormat:@"Sun %@",[datesArray objectAtIndex:0]];
            WeekDay2ndLabel.text=[NSString stringWithFormat:@"Mon %@",[datesArray objectAtIndex:1]];
            WeekDay3rdLabel.text=[NSString stringWithFormat:@"Tue %@",[datesArray objectAtIndex:2]];
            WeekDay4thLabel.text=[NSString stringWithFormat:@"Wed %@",[datesArray objectAtIndex:3]];
            WeekDay5thLabel.text=[NSString stringWithFormat:@"Thu %@",[datesArray objectAtIndex:4]];
            WeekDay6thLabel.text=[NSString stringWithFormat:@"Fri %@",[datesArray objectAtIndex:5]];
            WeekDay7thLabel.text=[NSString stringWithFormat:@"Sat %@",[datesArray objectAtIndex:6]];
           
            NSArray *weekSrartDateTimeSeparationArray=[NSMutableArray new];
            weekSrartDateTimeSeparationArray=[[NSString stringWithFormat:@"%@",requitedateWeek] componentsSeparatedByString:@"-"];
            
            NSDateFormatter  *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            NSString *monthName = [[dateFormat monthSymbols] objectAtIndex:([[weekSrartDateTimeSeparationArray objectAtIndex:1] intValue]-1)];
            
            WeekDaysDisplayLabel.text=[NSString stringWithFormat:@"%@ %@-%@, %@",monthName,[datesArray objectAtIndex:0],[datesArray objectAtIndex:6],[weekSrartDateTimeSeparationArray objectAtIndex:0]];
            
            weekEventArray = [logic getEventsListForWeekFrom:[[datesArray objectAtIndex:0] intValue] to:[[datesArray objectAtIndex:6] intValue] withMonth:[[weekSrartDateTimeSeparationArray objectAtIndex:1] intValue] andYear:[[weekSrartDateTimeSeparationArray objectAtIndex:0] intValue]];
            
            [self.collectionViewPack2 reloadData];
            
        }else
        {
            [monthEventArray removeAllObjects];
            [self.collectionViewPack reloadData];
            NSString *sendDateStr=[NSString stringWithFormat:@"%@-01-%@",[MCDisplayLabel.text substringToIndex:3],[MCDisplayLabel.text substringFromIndex:[MCDisplayLabel.text length] - 4]];
             NSDate *requitedate =[logic getNextorPreviousDate:-10 withDate:sendDateStr];
            
            NSArray *dateTimeSeparationArray3=[NSMutableArray new];
            dateTimeSeparationArray3=[[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10] componentsSeparatedByString:@"-"];
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"EEEE"];
            
//            NSString *strDate=[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//            NSDate *targetDate=[dateFormatter dateFromString:strDate];
            [dateFormatter setDateFormat:@"EEEE"];
            MCDisplayLabel.text=[NSString stringWithFormat:@"%@ %@",[[dateFormatter monthSymbols] objectAtIndex:[[dateTimeSeparationArray3 objectAtIndex:1] intValue]-1],[dateTimeSeparationArray3 objectAtIndex:0]];
           
            NSCalendar *cal = [NSCalendar currentCalendar];
            NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:requitedate];
            NSUInteger numberOfDaysInMonth = range.length;
           
          
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:requitedate];
            components.day = 1;
            NSDate *firstDayOfMonth = [gregorian dateFromComponents:components];
            [dateFormatter setDateFormat:@"EEEE"];
            
            NSMutableArray *monthDtes=[NSMutableArray new];
            for (int i=0; i<42; i++)
            {
                if (i<=6)
                {
                    if ([[dayNamesArray objectAtIndex:i]isEqualToString:[dateFormatter stringFromDate:firstDayOfMonth]])
                    {
                        for (int j=1; j<=numberOfDaysInMonth; j++)
                        {
                            [monthDtes addObject:[NSString stringWithFormat:@"%d",j]];
                        }
                        i=i+numberOfDaysInMonth;
                    }
                }
                [monthDtes addObject:@""];
            }
            monthsDatesArrayInMonthView=monthDtes;
            
            monthEventArray=[logic getEventsListForMonthFrom:1 to:numberOfDaysInMonth withMonth:[[dateTimeSeparationArray3 objectAtIndex:1] intValue] andYear:[[dateTimeSeparationArray3 objectAtIndex:0] intValue]];
            [self.collectionViewPack reloadData];
        }
    }
    else if (btn.tag==520||btn.tag==620||btn.tag==720)
    {
        if (btn.tag==520)
        {
            [dayArray removeAllObjects];
            [self.collectionViewPack3 reloadData];
            [self.collectionViewPack4 reloadData];
            
            NSArray *timeDateSepArrDay=[NSArray new];
            timeDateSepArrDay=[DayDisplaylabelInDayView.text componentsSeparatedByString:@" "];
            
            NSString *sendDateStr=[NSString stringWithFormat:@"%@-%@-%@",[[timeDateSepArrDay objectAtIndex:1]substringToIndex:3],[[timeDateSepArrDay objectAtIndex:2]substringToIndex:2],[timeDateSepArrDay objectAtIndex:3]];
            
            NSDate *requitedate =[logic getNextorPreviousDate:+2 withDate:sendDateStr];
            
            NSArray *dateTimeSeparationArray3=[NSMutableArray new];
            dateTimeSeparationArray3=[[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10] componentsSeparatedByString:@"-"];
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"EEEE"];
            
            NSString *strDate=[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSDate *targetDate=[dateFormatter dateFromString:strDate];
            [dateFormatter setDateFormat:@"EEEE"];
            
            DayDisplaylabelInDayView.text=[NSString stringWithFormat:@"%@, %@ %@, %@",[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:targetDate]],[NSString stringWithFormat:@"%@",[[dateFormatter monthSymbols] objectAtIndex:[[dateTimeSeparationArray3 objectAtIndex:1] intValue]-1]],[dateTimeSeparationArray3 objectAtIndex:2],[dateTimeSeparationArray3 objectAtIndex:0]];
            
            dayArray = [logic getEventsListForDay:[[dateTimeSeparationArray3 objectAtIndex:2] intValue] withMonth:[[dateTimeSeparationArray3 objectAtIndex:1] intValue] andYear:[[dateTimeSeparationArray3 objectAtIndex:0] intValue]];
            
            [self.collectionViewPack3 reloadData];
            [self.collectionViewPack4 reloadData];
            
        }else if (btn.tag==620)
        {
            [weekEventArray removeAllObjects];
            [self.collectionViewPack2 reloadData];
            NSString *sendDateStr=[NSString stringWithFormat:@"%@-%@-%@",[WeekDaysDisplayLabel.text substringToIndex:3],[[WeekDaysDisplayLabel.text substringFromIndex:[WeekDaysDisplayLabel.text length]-11]substringToIndex:2],[WeekDaysDisplayLabel.text substringFromIndex:[WeekDaysDisplayLabel.text length] - 4]];
            
            NSDate *requitedateWeek=[logic getNextorPreviousDate:+8 withDate:sendDateStr];
            
            NSMutableArray * datesArray=[NSMutableArray new];
            for (int i=0; i<7; i++)
            {
                NSDate *tomorrow = [NSDate dateWithTimeInterval:(24*60*60*i) sinceDate:requitedateWeek];
                NSString *endDateStr=[[NSString stringWithFormat:@"%@",tomorrow] substringToIndex:10];
                endDateStr= [endDateStr substringFromIndex:8];
                [datesArray addObject:endDateStr ];
            }
            WeekDay1stLabel.text=[NSString stringWithFormat:@"Sun %@",[datesArray objectAtIndex:0]];
            WeekDay2ndLabel.text=[NSString stringWithFormat:@"Mon %@",[datesArray objectAtIndex:1]];
            WeekDay3rdLabel.text=[NSString stringWithFormat:@"Tue %@",[datesArray objectAtIndex:2]];
            WeekDay4thLabel.text=[NSString stringWithFormat:@"Wed %@",[datesArray objectAtIndex:3]];
            WeekDay5thLabel.text=[NSString stringWithFormat:@"Thu %@",[datesArray objectAtIndex:4]];
            WeekDay6thLabel.text=[NSString stringWithFormat:@"Fri %@",[datesArray objectAtIndex:5]];
            WeekDay7thLabel.text=[NSString stringWithFormat:@"Sat %@",[datesArray objectAtIndex:6]];
            
            NSArray *weekSrartDateTimeSeparationArray=[NSMutableArray new];
            weekSrartDateTimeSeparationArray=[[NSString stringWithFormat:@"%@",requitedateWeek] componentsSeparatedByString:@"-"];
            
            NSDateFormatter  *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            NSString *monthName = [[dateFormat monthSymbols] objectAtIndex:([[weekSrartDateTimeSeparationArray objectAtIndex:1] intValue]-1)];
            
            WeekDaysDisplayLabel.text=[NSString stringWithFormat:@"%@ %@-%@, %@",monthName,[datesArray objectAtIndex:0],[datesArray objectAtIndex:6],[weekSrartDateTimeSeparationArray objectAtIndex:0]];
            
            weekEventArray = [logic getEventsListForWeekFrom:[[datesArray objectAtIndex:0] intValue] to:[[datesArray objectAtIndex:6] intValue] withMonth:[[weekSrartDateTimeSeparationArray objectAtIndex:1] intValue] andYear:[[weekSrartDateTimeSeparationArray objectAtIndex:0] intValue]];
            
            [self.collectionViewPack2 reloadData];

        }else
        {
            [monthEventArray removeAllObjects];
            [self.collectionViewPack reloadData];
            NSString *sendDateStr=[NSString stringWithFormat:@"%@-01-%@",[MCDisplayLabel.text substringToIndex:3],[MCDisplayLabel.text substringFromIndex:[MCDisplayLabel.text length] - 4]];
            NSDate *requitedate =[logic getNextorPreviousDate:+40 withDate:sendDateStr];
            
            NSArray *dateTimeSeparationArray3=[NSMutableArray new];
            dateTimeSeparationArray3=[[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10] componentsSeparatedByString:@"-"];
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"EEEE"];
            
//            NSString *strDate=[[NSString stringWithFormat:@"%@",requitedate] substringToIndex:10];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//            NSDate *targetDate=[dateFormatter dateFromString:strDate];
            [dateFormatter setDateFormat:@"EEEE"];
            MCDisplayLabel.text=[NSString stringWithFormat:@"%@ %@",[[dateFormatter monthSymbols] objectAtIndex:[[dateTimeSeparationArray3 objectAtIndex:1] intValue]-1],[dateTimeSeparationArray3 objectAtIndex:0]];
            
            NSCalendar *cal = [NSCalendar currentCalendar];
            NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:requitedate];
            NSUInteger numberOfDaysInMonth = range.length;
            
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:requitedate];
            components.day = 1;
            NSDate *firstDayOfMonth = [gregorian dateFromComponents:components];
            [dateFormatter setDateFormat:@"EEEE"];
            
            NSMutableArray *monthDtes=[NSMutableArray new];
            for (int i=0; i<42; i++)
            {
                if (i<=6)
                {
                    if ([[dayNamesArray objectAtIndex:i]isEqualToString:[dateFormatter stringFromDate:firstDayOfMonth]])
                    {
                        for (int j=1; j<=numberOfDaysInMonth; j++)
                        {
                            [monthDtes addObject:[NSString stringWithFormat:@"%d",j]];
                        }
                        i=i+numberOfDaysInMonth;
                    }
                }
                [monthDtes addObject:@""];
            }
            monthsDatesArrayInMonthView=monthDtes;
            
            monthEventArray=[logic getEventsListForMonthFrom:1 to:numberOfDaysInMonth withMonth:[[dateTimeSeparationArray3 objectAtIndex:1] intValue] andYear:[[dateTimeSeparationArray3 objectAtIndex:0] intValue]];
            [self.collectionViewPack reloadData];
        }
    }
}

-(void)getCollection:(int)sigmentIndex
{
    CGRect frame = CGRectMake (333, 15, 415, 30);
    self.mySegment.frame = frame;
    mySegment.layer.cornerRadius=20;
    
    BusinessLogic *logic = [[BusinessLogic alloc] init];
    if(sigmentIndex == 0)
    {
        [self.collectionViewPack3 reloadData];
        [self.collectionViewPack4 reloadData];

        [agendaHeaderLabel setHidden:YES];
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"dd.MM.YYYY"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        NSArray *dateTimeSeparationArray3=[NSMutableArray new];
        dateTimeSeparationArray3=[dateString componentsSeparatedByString:@"."];
        
        [dateFormatter setDateFormat:@"EEEE"];
        NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:[[dateTimeSeparationArray3 objectAtIndex:1] intValue]-1];
        
        DayDisplaylabelInDayView.text=[NSString stringWithFormat:@"%@, %@ %@, %@", [dateFormatter stringFromDate:[NSDate date]],monthName,[dateTimeSeparationArray3 objectAtIndex:0],[dateTimeSeparationArray3 objectAtIndex:2]];
        
        dayArray = [logic getEventsListForDay:[[dateTimeSeparationArray3 objectAtIndex:0] intValue] withMonth:[[dateTimeSeparationArray3 objectAtIndex:1] intValue] andYear:[[dateTimeSeparationArray3 objectAtIndex:2] intValue]];
        
        [self.collectionViewPack3 reloadData];
        //[self.collectionViewPack4 reloadData];
    }else if (sigmentIndex==1)
    {
        [agendaHeaderLabel setHidden:YES];
        [weekEventArray removeAllObjects];
        [self.collectionViewPack2 reloadData];
        NSDate *today = [NSDate date];
        NSDateFormatter  *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        //Week Start Date
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:today];
        
        int dayofweek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:today] weekday];// this will give you current day of week
        
        [components setDay:([components day] - ((dayofweek) - 2))];// for beginning of the week.
        
        NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
        
        NSString *dateString2Prev = [dateFormat stringFromDate:beginningOfWeek];
        
        NSDate *weekstartPrev = [dateFormat dateFromString:dateString2Prev];
        
        //Week End Date
        
        NSCalendar *gregorianEnd = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDateComponents *componentsEnd = [gregorianEnd components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:today];
        
        int Enddayofweek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:today] weekday];// this will give you current day of week
        
        [componentsEnd setDay:([componentsEnd day]+(7-Enddayofweek)+1)];// for end day of the week
        
        NSDate *EndOfWeek = [gregorianEnd dateFromComponents:componentsEnd];
        
        NSString *dateEndPrev = [dateFormat stringFromDate:EndOfWeek];
        
        NSDate *weekEndPrev =[dateFormat dateFromString:dateEndPrev];
       
        NSString *endDateStr=[NSString stringWithFormat:@"%@",weekEndPrev];
        endDateStr=[endDateStr substringToIndex:10];

        NSString *startDateStr=[NSString stringWithFormat:@"%@",weekstartPrev];
        startDateStr=[startDateStr substringToIndex:10];
        
        NSArray *weekSrartDateTimeSeparationArray=[NSMutableArray new];
        weekSrartDateTimeSeparationArray=[startDateStr componentsSeparatedByString:@"-"];
        
        NSArray *WeekEndDateTimeSeparationArray=[NSMutableArray new];
        WeekEndDateTimeSeparationArray=[endDateStr componentsSeparatedByString:@"-"];
        
         NSString *monthName = [[dateFormat monthSymbols] objectAtIndex:([[weekSrartDateTimeSeparationArray objectAtIndex:1] intValue]-1)];
       
        WeekDaysDisplayLabel.text=[NSString stringWithFormat:@"%@ %@-%@, %@",monthName,[weekSrartDateTimeSeparationArray objectAtIndex:2],[WeekEndDateTimeSeparationArray objectAtIndex:2],[weekSrartDateTimeSeparationArray objectAtIndex:0]];
        
        NSMutableArray * datesArray=[NSMutableArray new];
        for (int i=0; i<7; i++)
        {
            NSDate *tomorrow = [NSDate dateWithTimeInterval:(24*60*60*i) sinceDate:weekstartPrev];
            NSString *endDateStr=[[NSString stringWithFormat:@"%@",tomorrow] substringToIndex:10];
            endDateStr= [endDateStr substringFromIndex:8];
            [datesArray addObject:endDateStr ];
        }
        
    WeekDay1stLabel.text=[NSString stringWithFormat:@"Sun %@",[datesArray objectAtIndex:0]];
    WeekDay2ndLabel.text=[NSString stringWithFormat:@"Mon %@",[datesArray objectAtIndex:1]];
    WeekDay3rdLabel.text=[NSString stringWithFormat:@"Tue %@",[datesArray objectAtIndex:2]];
    WeekDay4thLabel.text=[NSString stringWithFormat:@"Wed %@",[datesArray objectAtIndex:3]];
    WeekDay5thLabel.text=[NSString stringWithFormat:@"Thu %@",[datesArray objectAtIndex:4]];
    WeekDay6thLabel.text=[NSString stringWithFormat:@"Fri %@",[datesArray objectAtIndex:5]];
    WeekDay7thLabel.text=[NSString stringWithFormat:@"Sat %@",[datesArray objectAtIndex:6]];
      
        weekEventArray = [logic getEventsListForWeekFrom:[[weekSrartDateTimeSeparationArray objectAtIndex:2] intValue] to:[[WeekEndDateTimeSeparationArray objectAtIndex:2] intValue] withMonth:[[weekSrartDateTimeSeparationArray objectAtIndex:1] intValue] andYear:[[weekSrartDateTimeSeparationArray objectAtIndex:0] intValue]];
        
        [self.collectionViewPack2 reloadData];
    }else if (sigmentIndex==2)
    {
        [agendaHeaderLabel setHidden:YES];
        [monthEventArray removeAllObjects];
        [self.collectionViewPack reloadData];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];
        NSUInteger numberOfDaysInMonth = range.length;
      
        NSDate *today = [NSDate date];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:today];
        components.day = 1;
        NSDate *firstDayOfMonth = [gregorian dateFromComponents:components];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
   
        NSMutableArray *monthDtes=[NSMutableArray new];
        for (int i=0; i<42; i++)
        {
            if (i<=6)
            {
                if ([[dayNamesArray objectAtIndex:i]isEqualToString:[dateFormatter stringFromDate:firstDayOfMonth]])
                {
                    for (int j=1; j<=numberOfDaysInMonth; j++)
                    {
                        [monthDtes addObject:[NSString stringWithFormat:@"%d",j]];
                    }
                    i=i+numberOfDaysInMonth;
                }
            }
            [monthDtes addObject:@""];
        }
        monthsDatesArrayInMonthView=monthDtes;
        
        NSString *DateStr=[[NSString stringWithFormat:@"%@",today] substringToIndex:10];
        NSArray *dateTimeSeparationArray4=[NSMutableArray new];
        dateTimeSeparationArray4=[DateStr componentsSeparatedByString:@"-"];
        NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:[[dateTimeSeparationArray4 objectAtIndex:1] intValue]-1];
        MCDisplayLabel.text=[NSString stringWithFormat:@"%@ %@",monthName,[dateTimeSeparationArray4 objectAtIndex:0]];
    
        monthEventArray=[logic getEventsListForMonthFrom:01 to:numberOfDaysInMonth withMonth:[[dateTimeSeparationArray4 objectAtIndex:1] intValue] andYear:[[dateTimeSeparationArray4 objectAtIndex:0] intValue]];
        [self.collectionViewPack reloadData];
    }
    else
    {
        [agendaHeaderLabel setHidden:NO];
        CGRect frame = CGRectMake (473, 15, 415, 30);
        self.mySegment.frame = frame;
        mySegment.layer.cornerRadius=20;
        [AgendaLeftTableView reloadData];
        [AgendaRightTableView reloadData];
        //reload agendaView
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==AgendaRightTableView)
    {
    return 30;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==AgendaLeftTableView)
    {
        return tempEmpNameArray.count;
    }
    else{
        switch (section)
        {
            case 0:return [employeeArrayTimings00 count];break;
            case 1:return [employeeArrayTimings10 count];break;
            case 2:return [employeeArrayTimings20 count];break;
            case 3:return [employeeArrayTimings30 count];break;
            case 4:return [employeeArrayTimings40 count];break;
            case 5:return [employeeArrayTimings50 count];break;
            case 6:return [employeeArrayTimings60 count];break;
            case 7:return [employeeArrayTimings70 count];break;
            case 8:return [employeeArrayTimings80 count];break;
            case 9:return [employeeArrayTimings90 count];break;
            case 10:return [employeeArrayTimings01 count];break;
            case 11:return [employeeArrayTimings11 count];break;
            case 12:return [employeeArrayTimings21 count];break;
            case 13:return [employeeArrayTimings31 count];break;
            case 14:return [employeeArrayTimings41 count];break;
            case 15:return [employeeArrayTimings51 count];break;
            case 16:return [employeeArrayTimings61 count];break;
            case 17:return [employeeArrayTimings71 count];break;
            case 18:return [employeeArrayTimings81 count];break;
            case 19:return [employeeArrayTimings91 count];break;
            case 20:return [employeeArrayTimings02 count];break;
            case 21:return [employeeArrayTimings12 count];break;
            case 22:return [employeeArrayTimings22 count];break;
            case 23:return [employeeArrayTimings32 count];break;
            case 24:return [employeeArrayTimings42 count];break;
            case 25:return [employeeArrayTimings52 count];break;
            case 26:return [employeeArrayTimings62 count];break;
            case 27:return [employeeArrayTimings72 count];break;
            case 28:return [employeeArrayTimings82 count];break;
            case 29:return [employeeArrayTimings92 count];break;
        }
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    static NSString *cellIdentifier2=@"Cell2";
    
    if (tableView==AgendaLeftTableView)
    {
        employeNameCell *cell=(employeNameCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell==nil)
        {
            cell=[[employeNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.employeeName.text=[[[tempEmpNameArray objectAtIndex:indexPath.row]lowercaseString] capitalizedString];
        cell.backgroundColor=[UIColor clearColor];
        cell.checkButton.tag=indexPath.row;
        [cell.checkButton addTarget:self action:@selector(checkBoxIcon:) forControlEvents:UIControlEventTouchUpInside];
        
        NSNumber *flag1 = (NSNumber *)[checkBoxArray objectAtIndex:indexPath.row];
        if (flag1 == [NSNumber numberWithBool:NO])
        {
            cell.checkButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"unchecked.png"]];
        }else
        {
            cell.checkButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"checked.png"]];
        }
        return cell;
    }
    else if(tableView==AgendaRightTableView)
    {
        employeeReservationCell *cell = (employeeReservationCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (cell==nil)
        {
            cell=[[employeeReservationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
        }
        cell.backgroundColor=[UIColor clearColor];
        switch (indexPath.section)
        {
            case 0:
                agendaObj=[employeeArrayTimings00 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 1:
                agendaObj=[employeeArrayTimings10 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 2:
                agendaObj=[employeeArrayTimings20 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 3:
                agendaObj=[employeeArrayTimings30 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 4:
                agendaObj=[employeeArrayTimings40 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 5:
                agendaObj=[employeeArrayTimings50 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 6:
                agendaObj=[employeeArrayTimings60 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 7:
                agendaObj=[employeeArrayTimings70 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 8:
                agendaObj=[employeeArrayTimings80 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 9:
                agendaObj=[employeeArrayTimings90 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 10:
                agendaObj=[employeeArrayTimings01 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 11:
                agendaObj=[employeeArrayTimings11 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 12:
                agendaObj=[employeeArrayTimings21 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 13:
                agendaObj=[employeeArrayTimings31 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 14:
                agendaObj=[employeeArrayTimings41 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"wisth  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 15:
                agendaObj=[employeeArrayTimings51 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 16:
                agendaObj=[employeeArrayTimings61 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 17:
                agendaObj=[employeeArrayTimings71 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 18:
                agendaObj=[employeeArrayTimings81 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 19:
                agendaObj=[employeeArrayTimings91 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 20:
                agendaObj=[employeeArrayTimings02 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 21:
                agendaObj=[employeeArrayTimings12 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 22:
                agendaObj=[employeeArrayTimings22 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 23: agendaObj=[employeeArrayTimings32 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 24:
                agendaObj=[employeeArrayTimings42 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 25:
                agendaObj=[employeeArrayTimings52 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 26:
                agendaObj=[employeeArrayTimings62 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 27:
                agendaObj=[employeeArrayTimings72 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 28:
                agendaObj=[employeeArrayTimings82 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
            case 29:
                agendaObj=[employeeArrayTimings92 objectAtIndex:indexPath.row];
                cell.reservationTime.text=[NSString stringWithFormat:@"%@",agendaObj.startingTime];
                cell.servicesforReservation.text=[NSString stringWithFormat:@"%@",agendaObj.servicesName];
                cell.customerName.text=[NSString stringWithFormat:@"with  %@",agendaObj.custmerName];
                cell.EmployeeName.text=[[[NSString stringWithFormat:@"%@",agendaObj.employeeName]lowercaseString]capitalizedString];
                break;
        }
        return cell;
    }
    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, AgendaRightTableView.bounds.size.width, 42)];
   
    if (tableView==AgendaRightTableView)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        if (section==0)
        {
            UILabel *headerLable=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, AgendaRightTableView.bounds.size.width-15, 42)];
            [headerLable setBackgroundColor:[UIColor clearColor]];
            [headerLable setTextColor:[UIColor whiteColor]];
            [headerView addSubview:headerLable];
            [headerView setBackgroundColor:[UIColor clearColor]];
            
            UILabel *headerLable3=[[UILabel alloc]initWithFrame:CGRectMake(15,42, AgendaRightTableView.bounds.size.width-15, 1)];
            [headerView addSubview:headerLable3];
            
            NSDate *currDate = [NSDate date];
            NSString *dateString = [dateFormatter stringFromDate:currDate];
            [dateFormatter setDateFormat:@"EEEE"];
            headerLable.text=[NSString stringWithFormat:@"%@, %@",[dateFormatter stringFromDate:[NSDate date]],dateString];
            [headerLable setFont:[UIFont fontWithName:@"GillSans" size:15.0]];
        }else if (section==10)
        {
            
            UILabel *headerLable=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, AgendaRightTableView.bounds.size.width-15, 42)];
            [headerLable setBackgroundColor:[UIColor clearColor]];
            [headerLable setTextColor:[UIColor whiteColor]];
            [headerView addSubview:headerLable];
            [headerView setBackgroundColor:[UIColor clearColor]];
            
            UILabel *headerLable2=[[UILabel alloc]initWithFrame:CGRectMake(15,0, AgendaRightTableView.bounds.size.width-15, 1)];
            UILabel *headerLable3=[[UILabel alloc]initWithFrame:CGRectMake(15,42, AgendaRightTableView.bounds.size.width-15, 1)];
            [headerLable2 setBackgroundColor:[UIColor whiteColor]];
            [headerLable3 setBackgroundColor:[UIColor whiteColor]];

           
            [headerView addSubview:headerLable2];
            [headerView addSubview:headerLable3];
            
            NSDate *tomorrow = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
            
            NSString *tomorrowDate=[dateFormatter stringFromDate:tomorrow];
            [dateFormatter setDateFormat:@"EEEE"];
            headerLable.text=[NSString stringWithFormat:@"%@, %@",[dateFormatter stringFromDate:tomorrow],tomorrowDate];
            [ headerLable setFont:[UIFont fontWithName:@"GillSans" size:15.0]];
        }else if(section==20)
        {
            UILabel *headerLable=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, AgendaRightTableView.bounds.size.width-15, 42)];
            [headerLable setBackgroundColor:[UIColor clearColor]];
            [headerLable setTextColor:[UIColor whiteColor]];
            [headerView addSubview:headerLable];
            [headerView setBackgroundColor:[UIColor clearColor]];
            
            UILabel *headerLable2=[[UILabel alloc]initWithFrame:CGRectMake(15,0, AgendaRightTableView.bounds.size.width-15, 1)];
            UILabel *headerLable3=[[UILabel alloc]initWithFrame:CGRectMake(15,42, AgendaRightTableView.bounds.size.width-15, 1)];
            [headerLable2 setBackgroundColor:[UIColor whiteColor]];
            [headerLable3 setBackgroundColor:[UIColor whiteColor]];
        
            [headerView addSubview:headerLable2];
            [headerView addSubview:headerLable3];
            
            NSDate *dayafterTomorrow = [NSDate dateWithTimeInterval:(24*60*60*2) sinceDate:[NSDate date]];
            NSString *dayafterTomorrowDate=[dateFormatter stringFromDate:dayafterTomorrow];
            [dateFormatter setDateFormat:@"EEEE"];
            headerLable.text=[NSString stringWithFormat:@"%@, %@",[dateFormatter stringFromDate:dayafterTomorrow],dayafterTomorrowDate];
           [ headerLable setFont:[UIFont fontWithName:@"GillSans" size:15.0]];
        }
        return headerView;
    }
     return [[UIView alloc] init];;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 42;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0)
    {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight)
    {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    if (mySegment.selectedSegmentIndex==0)
    {
        collectionViewPack4.contentOffset = collectionViewPack3.contentOffset;
        //or collectionViewPack3.contentOffset = collectionViewPack3.contentOffset;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView==AgendaRightTableView)
    {
        if (section==0){
            return 42.0;
        }else if (section==10){
            return 42.0;
        }
        else if (section==20){
            return 42.0;
        }
        else{
            return 0.0;
        }
    }
    return 0.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [AgendaLeftTableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)checkBoxIcon:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    NSNumber *flag1 = (NSNumber *)[checkBoxArray objectAtIndex:senderButton.tag];
    
    if (flag1 == [NSNumber numberWithBool:NO])
    {
        [checkBoxArray replaceObjectAtIndex:senderButton.tag withObject:[NSNumber numberWithBool:YES]];
        
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"dd.MM.YYYY"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        NSArray *dateTimeSeparationArray3=[NSMutableArray new];
        dateTimeSeparationArray3=[dateString componentsSeparatedByString:@"."];
        
        NSDate *tomorrow = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
        [dateFormatter setDateFormat:@"dd.MM.YYYY"];
        NSString *tomorrowDate=[dateFormatter stringFromDate:tomorrow];
        NSArray *tomorrowdateTimeSeparationArray=[NSMutableArray new];
        tomorrowdateTimeSeparationArray=[tomorrowDate componentsSeparatedByString:@"."];
        
        NSDate *dayafterTomorrow = [NSDate dateWithTimeInterval:(24*60*60*2) sinceDate:[NSDate date]];
        [dateFormatter setDateFormat:@"dd.MM.YYYY"];
        NSString *dayafterTomorrowDate=[dateFormatter stringFromDate:dayafterTomorrow];
        NSArray *dayafterTomorrowdateTimeSeparationArray=[NSMutableArray new];
        dayafterTomorrowdateTimeSeparationArray=[dayafterTomorrowDate componentsSeparatedByString:@"."];
        
        switch (senderButton.tag)
        {
            case 0:employeeArrayTimings00=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings01=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings02=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 1:employeeArrayTimings10=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings11=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings12=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 2:employeeArrayTimings20=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings21=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings22=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
           
            case 3:employeeArrayTimings30=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings31=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings32=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 4:employeeArrayTimings40=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings41=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings42=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 5:employeeArrayTimings50=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings51=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings52=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 6:employeeArrayTimings60=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings61=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings62=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 7:employeeArrayTimings70=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings71=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings72=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 8:employeeArrayTimings80=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings81=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings82=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
            
            case 9:employeeArrayTimings90=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dateTimeSeparationArray3 objectAtIndex:0]intValue] month:[[dateTimeSeparationArray3 objectAtIndex:1]intValue] year:[[dateTimeSeparationArray3 objectAtIndex:2]intValue]];
                employeeArrayTimings91=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[tomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[tomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[tomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];
                employeeArrayTimings92=[dbAccess getEmployeeReservationSchedule:senderButton.tag+1 date:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:0]intValue] month:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:1]intValue] year:[[dayafterTomorrowdateTimeSeparationArray objectAtIndex:2]intValue]];break;
        }
        
        if (!selectedEmpNameArray) {
            selectedEmpNameArray =[NSMutableArray new];
            [selectedEmpNameArray addObject:[NSMutableString stringWithFormat:@"%@",[tempEmpNameArray objectAtIndex:senderButton.tag]]];
        }else{
            [selectedEmpNameArray addObject:[NSMutableString stringWithFormat:@"%@",[tempEmpNameArray objectAtIndex:senderButton.tag]]];
        }
    }
    else
    {
        switch (senderButton.tag)
        {
            case 0:[employeeArrayTimings00 removeAllObjects];
                [employeeArrayTimings01 removeAllObjects];
                [employeeArrayTimings02 removeAllObjects];break;
            case 1:[employeeArrayTimings10 removeAllObjects];
                [employeeArrayTimings11 removeAllObjects];
                [employeeArrayTimings12 removeAllObjects];break;
            case 2:[employeeArrayTimings20 removeAllObjects];
                [employeeArrayTimings21 removeAllObjects];
                [employeeArrayTimings22 removeAllObjects];break;
            case 3:[employeeArrayTimings30 removeAllObjects];
                [employeeArrayTimings31 removeAllObjects];
                [employeeArrayTimings32 removeAllObjects];break;
            case 4:[employeeArrayTimings40 removeAllObjects];;
                [employeeArrayTimings41 removeAllObjects];
                [employeeArrayTimings42 removeAllObjects];break;
            case 5:[employeeArrayTimings50 removeAllObjects];
                [employeeArrayTimings51 removeAllObjects];
                [employeeArrayTimings52 removeAllObjects];break;
            case 6:[employeeArrayTimings60 removeAllObjects];
                [employeeArrayTimings61 removeAllObjects];
                [employeeArrayTimings62 removeAllObjects];break;
            case 7:[employeeArrayTimings70 removeAllObjects];
                [employeeArrayTimings71 removeAllObjects];
                [employeeArrayTimings72 removeAllObjects];break;
            case 8:[employeeArrayTimings80 removeAllObjects];
                [employeeArrayTimings81 removeAllObjects];
                [employeeArrayTimings82 removeAllObjects];break;
            case 9:[employeeArrayTimings90 removeAllObjects];
                [employeeArrayTimings91 removeAllObjects];
                [employeeArrayTimings92 removeAllObjects];break;
        }
        
        [checkBoxArray replaceObjectAtIndex:senderButton.tag withObject:[NSNumber numberWithBool:NO]];
        NSUInteger index = [selectedEmpNameArray indexOfObject:[tempEmpNameArray objectAtIndex:senderButton.tag]];
        [selectedEmpNameArray removeObjectAtIndex:index];
    }
    [self.AgendaLeftTableView reloadData];
    [self.AgendaRightTableView reloadData];
}

//customer form
- (IBAction)customerFormBtnAction:(id)sender
{
    [agendaHeaderLabel setHidden:YES];
    [self.view bringSubviewToFront:[arrayCalendars objectAtIndex:4]];
    customerMobileNo.text=@"";
    customerName.text=@"";
    servicesTextfield.text=@"";
    subServicesTextfield.text=@"";
    employeeTextfield.text=@"";
    reservationTimeTextfield.text=@"";
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [tempGetAllDataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str=[NSString new];
   if (myInteger==30)
    {
        Employee *emp = [tempGetAllDataArray objectAtIndex:row];
       return str=emp.name;
    }else if (myInteger==20)
    {
        Product *pro=[tempGetAllDataArray objectAtIndex:row];
        return str=pro.name;
    }else
    {
        Categorys *cat=[tempGetAllDataArray objectAtIndex:row];
        return str=cat.name;
    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (myInteger==10)
    {
        Categorys *cat=[tempGetAllDataArray objectAtIndex:row];
        servicesTextfield.text=cat.name;
        catint=cat.categoryid;
    }
    else if (myInteger==20)
    {
        Product *pro=[tempGetAllDataArray objectAtIndex:row];
        subServicesTextfield.text=pro.name;
       pid =pro.productid;
    }
    else if (myInteger ==30)
    {
        Employee *emp = [tempGetAllDataArray objectAtIndex:row];
        employeeIdPurpose =emp.employeeid;
         employeeTextfield.text=emp.name;
    }
}

- (IBAction)submitBtnAction:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Are you sure to Submit" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
    alert.tag=111;
    [mypicker setHidden:YES];
    [MydatePicker setHidden:YES];
}

- (IBAction)cancelBtnAction:(id)sender
{
    customerMobileNo.text=@"";
    customerName.text=@"";
    servicesTextfield.text=@"";
    subServicesTextfield.text=@"";
    employeeTextfield.text=@"";
    reservationTimeTextfield.text=@"";
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==222)
    {
        if (buttonIndex==0)
        {
            //yes
            servicesTextfield.text=@"";
            subServicesTextfield.text=@"";
            employeeTextfield.text=@"";
            reservationTimeTextfield.text=@"";
        }
        else if (buttonIndex==1)
        {
            //no
            customerMobileNo.text=@"";
            customerName.text=@"";
            servicesTextfield.text=@"";
            subServicesTextfield.text=@"";
            employeeTextfield.text=@"";
            reservationTimeTextfield.text=@"";
        }
    }

    if (alertView.tag==111)
    {
        int mothNo=0;
        if (buttonIndex==0)
        {
            //yes
            if ([customerName.text isEqualToString:@""]||[customerMobileNo.text isEqualToString:@""]||[employeeTextfield.text isEqualToString:@""]||[servicesTextfield.text isEqualToString:@""]||[reservationTimeTextfield.text isEqualToString:@""]||[subServicesTextfield.text isEqualToString:@""]) {
                UIAlertView *generalAlert=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Please enter all Fields" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [generalAlert show];
            }else
            {
                for (int i=0; i<=11; i++)
                {
                    if ([[dateTimeSeparationArray objectAtIndex:1] isEqualToString:[monthNameArrayforNumberFormat objectAtIndex:i]])
                    {
                        mothNo=i+1;
                        break;
                    }
                }
                
                BOOL success ;
                
                Reservation *CustReservationObj=[[Reservation alloc] init];
                
                CustReservationObj.empid= employeeIdPurpose;
                CustReservationObj.rdate =[[dateTimeSeparationArray objectAtIndex:2] intValue];
                CustReservationObj.rmonth =mothNo;
                CustReservationObj.ryear=[[dateTimeSeparationArray objectAtIndex:3] intValue];
                
                NSString *str=[NSString new ];
                NSArray *arraysplictString=[[dateTimeSeparationArray objectAtIndex:5] componentsSeparatedByString:@":"];
                
                NSString *stringfirst=[NSString new ];
                 NSString *stringsecond=[NSString new ];
                if ([[arraysplictString objectAtIndex:0] intValue]<=9) {
                    if ([[arraysplictString objectAtIndex:0] intValue]>=8) {
                        str=@"0";
                        str=[str stringByAppendingString:[dateTimeSeparationArray objectAtIndex:5]];
                    }else{
                        switch ([[arraysplictString objectAtIndex:0] intValue]) {
                            case 1: str=@"13";
                                stringfirst=[NSString stringWithFormat:@"%@",[dateTimeSeparationArray objectAtIndex:5]];
                                stringsecond=[stringfirst substringFromIndex:1];
                                str=[str stringByAppendingString:stringsecond];
                                break;
                            case 2: str=@"14";
                             stringfirst=[NSString stringWithFormat:@"%@",[dateTimeSeparationArray objectAtIndex:5]];
                                stringsecond=[stringfirst substringFromIndex:1];
                                str=[str stringByAppendingString:stringsecond];
                                break;
                            case 3: str=@"15";
                                stringfirst=[NSString stringWithFormat:@"%@",[dateTimeSeparationArray objectAtIndex:5]];
                                stringsecond=[stringfirst substringFromIndex:1];
                                str=[str stringByAppendingString:stringsecond];
                                break;
                            case 4: str=@"16";
                                stringfirst=[NSString stringWithFormat:@"%@",[dateTimeSeparationArray objectAtIndex:5]];
                                stringsecond=[stringfirst substringFromIndex:1];
                                str=[str stringByAppendingString:stringsecond];
                                break;
                            case 5: str=@"17";
                                stringfirst=[NSString stringWithFormat:@"%@",[dateTimeSeparationArray objectAtIndex:5]];
                                stringsecond=[stringfirst substringFromIndex:1];
                                str=[str stringByAppendingString:stringsecond];
                                break;
                            case 6: str=@"18";
                                stringfirst=[NSString stringWithFormat:@"%@",[dateTimeSeparationArray objectAtIndex:5]];
                                stringsecond=[stringfirst substringFromIndex:1];
                                str=[str stringByAppendingString:stringsecond];
                                break;
                        }
                    }
                }
                else{
                    str=[dateTimeSeparationArray objectAtIndex:5];

                }
                
                CustReservationObj.starttime=str;
                CustReservationObj.endtime=@"01:00:00";
                CustReservationObj.servicelist=pid;
                
                NSDateFormatter *dateformateee=[[NSDateFormatter alloc]init];
                [dateformateee setDateFormat:@"dd/MM/YYYY"];
                NSString *currentDate_String=[dateformateee stringFromDate:[NSDate date]];
                CustReservationObj.createdon= currentDate_String;
                
                success = [DBdata saveCustmerData:customerName.text mobile:customerMobileNo.text createdon:currentDate_String reservationObject:CustReservationObj];
                
                UIAlertView *alert2=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Do you want another Services" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
                [alert2 show];
                
                alert2.tag=222;
            }
        }
        else if (buttonIndex==1)
        {
        }
    }
}

-(void)MydatePickerAction:(id)sender
{
    NSLocale *usLocale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *pickerDate = [MydatePicker date];
    NSDateFormatter *dateformatter=[NSDateFormatter new];
    [dateformatter setDateFormat:@"dd MMMM yyyy hh:mm a"];
     NSString *str=[dateformatter stringFromDate:MydatePicker.date];
    if (textfieldPickerIdentifier==97)
    {
        reservationTimeTextfield.text =str;
        NSString *sampleString=[NSString stringWithFormat:@"%@",[pickerDate descriptionWithLocale:usLocale]];
        dateTimeSeparationArray=[sampleString componentsSeparatedByString:@" "];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    myString=[NSMutableString new];
    myInteger = 0;
    if (textField.tag==96||textField.tag==98||textField.tag==99)
    {
        if(textField.tag==99)
        {
            myString=@"category";
            myInteger=10;
        }
        else if(textField.tag==98)
        {
            myString=@"services";
            myInteger=20;
        }
        else if(textField.tag==96)
        {
            myString=@"employee";
            myInteger=30;
        }
        [mypicker setHidden:NO];
        [MydatePicker setHidden:YES];
        [self dimisskeyboard];
        [mypicker setFrame:CGRectMake(textField.frame.origin.x+textField.bounds.size.width, textField.frame.origin.y-(2.2*textField.bounds.size.height), textField.bounds.size.width,textField.bounds.size.width)];
        [mypicker setBackgroundColor:[UIColor clearColor]];//grayColor
        [customerFormView addSubview:mypicker];
    }
    if (textField.tag==97)
    {
        textfieldPickerIdentifier=textField.tag;
        [MydatePicker setHidden:NO];
        [mypicker setHidden:YES];
        [MydatePicker setFrame:CGRectMake(textField.frame.origin.x+textField.bounds.size.width, textField.frame.origin.y-(2.2*textField.bounds.size.height), textField.bounds.size.width,textField.bounds.size.width)];
        [MydatePicker addTarget:self
                         action:@selector(MydatePickerAction:)
               forControlEvents:UIControlEventValueChanged];
        [customerFormView addSubview:MydatePicker];
        [self dimisskeyboard];
    }
    [self getAllData:myString myNo:myInteger];
    [mypicker reloadAllComponents];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)dimisskeyboard
{
    [servicesTextfield resignFirstResponder];
    [subServicesTextfield resignFirstResponder];
    [reservationTimeTextfield resignFirstResponder];
    [employeeTextfield resignFirstResponder];
}

-(NSMutableArray *)getAllData:(NSString *)name myNo:(NSInteger)myNo
{
    if ([myString isEqualToString:@"category"] && myInteger==10)
    {
        tempGetAllDataArray = [dbAccess getAllCategories];
        return tempGetAllDataArray;
    }
    if ([myString isEqualToString:@"services"] && myInteger==20)
    {
        tempGetAllDataArray = [dbAccess getAllProductsbyCategory:catint];
        return tempGetAllDataArray;
    }
    if ([myString isEqualToString:@"employee"] && myInteger==30)
    {
        tempGetAllDataArray = [dbAccess getAllEmpDetails];
        return tempGetAllDataArray;
    }
return nil;
}

- (void)customViewMethod
{
    [customerFormView.layer setBorderWidth:2.];
    
    customerName=[[UITextField alloc] initWithFrame:CGRectMake(285, 90, 350, 40)];
    [customerName setDelegate:self];
    [customerName setTag:10];
    [customerName setBorderStyle:UITextBorderStyleRoundedRect];
    [customerName setPlaceholder:@"Enter Cusromer-Name"];
    
    customerMobileNo=[[UITextField alloc]initWithFrame:CGRectMake(285, 160, 350, 40) ];
    [customerMobileNo setTag:77];
    [customerMobileNo setDelegate:self];
    [customerMobileNo setBorderStyle:UITextBorderStyleRoundedRect];
    [customerMobileNo setKeyboardType:UIKeyboardTypeNumberPad];
    [customerMobileNo setPlaceholder:@"Enter MobileNo"];
    
    employeeTextfield=[[UITextField alloc]initWithFrame:CGRectMake(285, 230, 350, 40) ];
    [employeeTextfield setTag:96];
    [employeeTextfield setDelegate:self];
    [employeeTextfield setBorderStyle:UITextBorderStyleRoundedRect];
    [employeeTextfield setPlaceholder:@"Select Employee"];
    
    servicesTextfield=[[UITextField alloc]initWithFrame:CGRectMake(285, 300, 350, 40) ];
    [servicesTextfield setTag:99];
    [servicesTextfield setDelegate:self];
    [servicesTextfield setBorderStyle:UITextBorderStyleRoundedRect];
    [servicesTextfield setPlaceholder:@"Select Category"];
    
    subServicesTextfield=[[UITextField alloc]initWithFrame:CGRectMake(285, 370, 350, 40) ];
    [subServicesTextfield setTag:98];
    [subServicesTextfield setDelegate:self];
    [subServicesTextfield setBorderStyle:UITextBorderStyleRoundedRect];
    [subServicesTextfield setPlaceholder:@"Select Service"];
    
    reservationTimeTextfield=[[UITextField alloc]initWithFrame:CGRectMake(285, 440, 350, 40) ];
    [reservationTimeTextfield setTag:97];
    [reservationTimeTextfield setDelegate:self];
    [reservationTimeTextfield setBorderStyle:UITextBorderStyleRoundedRect];
    [reservationTimeTextfield setPlaceholder:@"Enter ReservationTime"];
    
    //textfields background colors
    [customerName setBackgroundColor:[UIColor whiteColor]];
    [customerMobileNo setBackgroundColor:[UIColor whiteColor]];
    [employeeTextfield setBackgroundColor:[UIColor whiteColor]];
    [servicesTextfield setBackgroundColor:[UIColor whiteColor]];
    [subServicesTextfield setBackgroundColor:[UIColor whiteColor]];
    [reservationTimeTextfield setBackgroundColor:[UIColor whiteColor]];
    //labels
    UILabel *label1=[[UILabel alloc] initWithFrame:CGRectMake(100, 90, 200, 40)];
    UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(100, 160, 200, 40)];
    UILabel *label3=[[UILabel alloc] initWithFrame:CGRectMake(100, 230, 200, 40)];
    UILabel *label4=[[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
    UILabel *label5=[[UILabel alloc] initWithFrame:CGRectMake(100, 370, 200, 40)];
    UILabel *label6=[[UILabel alloc] initWithFrame:CGRectMake(100, 440, 200, 40)];
    
    UILabel *headerLable=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1024, 60)];
    
    [headerLable setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lab1.png"]]];
    
    [label1 setBackgroundColor:[UIColor clearColor]];
    [label1 setText:@"Name:"];
    label1.textAlignment=NSTextAlignmentLeft;
    [label2 setBackgroundColor:[UIColor clearColor]];
    [label2 setText:@"Mobile No:"];
    label2.textAlignment=NSTextAlignmentLeft;
    [label3 setBackgroundColor:[UIColor clearColor]];
    [label3 setText:@"Employee:"];
    label3.textAlignment=NSTextAlignmentLeft;
    [label4 setBackgroundColor:[UIColor clearColor]];
    [label4 setText:@"Category:"];
    label4.textAlignment=NSTextAlignmentLeft;
    [label5 setBackgroundColor:[UIColor clearColor]];
    [label5 setText:@"Services:"];
    label5.textAlignment=NSTextAlignmentLeft;
    [label6 setBackgroundColor:[UIColor clearColor]];
    [label6 setText:@"Preferred StartTime:"];
    label6.textAlignment=NSTextAlignmentLeft;
    
    UIButton *cancelBtn=[[UIButton alloc] initWithFrame:CGRectMake(300, 530, 120, 35)];
    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnAction:)
        forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"cancelbtnBG.png"]]];
    cancelBtn.layer.cornerRadius=16;
    
    UIButton *submitBtn=[[UIButton alloc] initWithFrame:CGRectMake(500, 530, 120, 35)];
    [submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn addTarget:self
                  action:@selector(submitBtnAction:)
        forControlEvents:UIControlEventTouchUpInside];
    [submitBtn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"submitbtn.png"]]];
    submitBtn.layer.cornerRadius=16;
    
    [customerFormView addSubview:cancelBtn];
    [customerFormView addSubview:submitBtn];
    
    [customerFormView addSubview:label1];
    [customerFormView addSubview:label2];
    [customerFormView addSubview:label3];
    [customerFormView addSubview:label4];
    [customerFormView addSubview:label5];
    [customerFormView addSubview:label6];
    [customerFormView addSubview:headerLable];
    [customerFormView addSubview:customerName];
    [customerFormView addSubview:customerMobileNo];
    [customerFormView addSubview:employeeTextfield];
    [customerFormView addSubview:servicesTextfield];
    [customerFormView addSubview:subServicesTextfield];
    [customerFormView addSubview:customerName];
    [customerFormView addSubview:reservationTimeTextfield];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    if(textField.tag == 77)
    {
        if([self MobileNumberValidate:string] == TRUE)
        {
            int length = [self getLength:textField.text];
            if(length == 10)
            {
                if(range.length == 0)
                    return NO;
            }
            if(length == 3)
            {
                NSString *num = [self formatNumber:textField.text];
                textField.text = [NSString stringWithFormat:@"(%@) ",num];
                if(range.length > 0)
                    textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
            }
            else if(length == 6)
            {
                NSString *num = [self formatNumber:textField.text];
                textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
                if(range.length > 0)
                    textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
            }
        }
        else
        {
            UIAlertView *noAlert=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Please enter valid mobile No" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [noAlert show];
            return NO;
        }
    }
    return YES;
}

#pragma mark - Mobile Number validation
- (BOOL)MobileNumberValidate:(NSString*)number
{
    NSString *numberRegEx =@"^([0-9]+)?(\\.([0-9]{1,2})?)?$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx];
    if ([numberTest evaluateWithObject:number] == YES)
        return TRUE;
    else
        return FALSE;
}
-(NSString*)formatNumber:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    int length = [mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
    }
    return mobileNumber;
}

-(int)getLength:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    int length = [mobileNumber length];
    return length;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan)
    {
        [self.customerMobileNo resignFirstResponder];
        [self.customerName resignFirstResponder];
    }
}
@end
