//
//  ReservationViewController.h
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupplementaryView.h"
#import <QuartzCore/QuartzCore.h>
#import "DayDetails.h"
#import "BusinessLogic.h"
#import "DBAccess.h"
#import "employeNameCell.h"
#import "employeeReservationCell.h"
#import "employeeAgenda.h"
#import "Reservation.h"

@interface ReservationViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate>
{
    IBOutlet UICollectionView *collectionViewPack,*collectionViewPack2,*collectionViewPack3,*collectionViewPack4;
    UICollectionViewFlowLayout *flowLayout,*flowLayout2,*flowLayout3,*flowLayout4;
    UILabel *serviceNameOfCollctionCell;
    UILabel *noOfServices;
    UILabel *serviceHourServiceTime;
    UILabel *EmpNamesInDayView;
    UILabel *timeLabel,*customerNameLabel;
    UILabel *monthDateLabel;
  
    //agendaviewpurpose
    NSMutableArray *tempEmpNameArray ;
    NSMutableArray *employeesArr2;
    NSMutableArray *checkBoxArray;
    NSMutableArray *selectedEmpNameArray;
    NSMutableArray *employeeArrayTimings00,*employeeArrayTimings01,*employeeArrayTimings02,*employeeArrayTimings10,*employeeArrayTimings11,*employeeArrayTimings12,*employeeArrayTimings20,*employeeArrayTimings21,*employeeArrayTimings22,*employeeArrayTimings30,*employeeArrayTimings31,*employeeArrayTimings32,*employeeArrayTimings40,*employeeArrayTimings41,*employeeArrayTimings42,*employeeArrayTimings50,*employeeArrayTimings51,*employeeArrayTimings52,*employeeArrayTimings60,*employeeArrayTimings61,*employeeArrayTimings62,*employeeArrayTimings70,*employeeArrayTimings71,*employeeArrayTimings72,*employeeArrayTimings80,*employeeArrayTimings81,*employeeArrayTimings82,*employeeArrayTimings90,*employeeArrayTimings91,*employeeArrayTimings92;
    DBAccess *dbAccess;
    employeeAgenda *agendaObj;
    
// customerform
    int pid;
    int myInteger,catint ;
    NSString *myString;
    NSMutableArray *dataArray;
    NSMutableArray *getAllDataArray,*tempGetAllDataArray;

    int textfieldPickerIdentifier;
    DBAccess *DBdata;
    int employeeIdPurpose;
    NSArray *dateTimeSeparationArray,*dateTimeSeparationArray2;
    
}
//AgendaView

@property (strong, nonatomic) IBOutlet UIView *AgendaView;
@property (strong, nonatomic) IBOutlet UIView *AgendaLeftBGView;
@property (strong, nonatomic) IBOutlet UIView *AgendaRightBGView;
@property (strong, nonatomic) IBOutlet UITableView *AgendaLeftTableView;
@property (strong, nonatomic) IBOutlet UITableView *AgendaRightTableView;
@property (strong, nonatomic) IBOutlet UILabel *agendaHeaderLabel;

//week
@property (strong, nonatomic) IBOutlet UIScrollView *WeekScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewPack2;
@property (strong, nonatomic) IBOutlet UIView *WCalendarView;
@property (strong, nonatomic) IBOutlet UIView *WeekButtonsBgView;
@property (strong, nonatomic) IBOutlet UIView *WeekDaysBgView;
@property (strong, nonatomic) IBOutlet UIView *WeekTimeView;
@property (strong, nonatomic) IBOutlet UIButton *WeekPreBtn;
@property (strong, nonatomic) IBOutlet UIButton *WeekNextBtn;
@property (strong, nonatomic) IBOutlet UILabel *WeekDaysDisplayLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay1stLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay2ndLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay3rdLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay4thLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay5thLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay6thLabel;
@property (strong, nonatomic) IBOutlet UILabel *WeekDay7thLabel;
@property (strong, nonatomic) NSMutableArray *weekEventArray ;

//day
@property (strong, nonatomic) IBOutlet UIView *DayCalendarView;
@property (strong, nonatomic) IBOutlet UIScrollView *DayScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewPack3;
@property (strong, nonatomic) IBOutlet UIView *DayButtonsBgView;
@property (strong, nonatomic) IBOutlet UIView *EmployeeNamesBgView;
@property (strong, nonatomic) IBOutlet UIView *DayViewHourLabel;
@property (strong, nonatomic) IBOutlet UIButton *DayPreBtn;
@property (strong, nonatomic) IBOutlet UIButton *DayNextBtn;
@property (strong, nonatomic) IBOutlet UILabel *DayDisplaylabelInDayView;
@property (strong, nonatomic) NSMutableArray *dayArray,*monthsDatesArrayInMonthView,*dayNamesArray;

//EmpNamesInDayView
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewPack4;

//month
@property (nonatomic, retain) IBOutlet UICollectionView *collectionViewPack;
@property (strong, nonatomic) IBOutlet UIView *MCDayNamesView;
@property (strong, nonatomic) IBOutlet UILabel *MCDisplayLabel;
@property (strong, nonatomic) IBOutlet UIView *MonthCalendarView;
@property (strong, nonatomic) IBOutlet UIView *MCButtonsBg;
@property (strong, nonatomic) IBOutlet UIView *toolBarView;
@property (nonatomic, strong) NSArray *arrayCalendars;
@property (nonatomic, strong) NSArray *arrayButtons;
@property (strong, nonatomic) IBOutlet UILabel *monthCollectionViewLabelLine;
@property (strong, nonatomic) IBOutlet UIButton *MonthPreBtn;
@property (strong, nonatomic) IBOutlet UIButton *MonthNextBtn;
@property (strong, nonatomic) NSMutableArray *monthEventArray ;
@property (strong, nonatomic) IBOutlet UIButton *customerFormBtn;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegment;

//customer form
@property (strong, nonatomic) IBOutlet UITextField *employeeTextfield;
@property (strong, nonatomic) IBOutlet UITextField *servicesTextfield;
@property (strong, nonatomic) IBOutlet UITextField *subServicesTextfield;
@property (strong, nonatomic) IBOutlet UITextField *customerName;
@property (strong, nonatomic) IBOutlet UITextField *customerMobileNo;
@property (strong, nonatomic) IBOutlet UITextField *reservationTimeTextfield;
@property (strong, nonatomic) IBOutlet UIDatePicker *MydatePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *mypicker;
@property (strong, nonatomic) IBOutlet UIButton *submitBtn;
@property (strong, nonatomic) IBOutlet UIView *customerFormView;

-(NSMutableArray *)getAllData:(NSString *)name myNo:(NSInteger)myNo;
- (IBAction)submitBtnAction:(id)sender;
- (IBAction)segControllerAction:(id)sender;
- (IBAction)PrevOrNextbuttonAction:(id)sender;
- (IBAction)customerFormBtnAction:(id)sender;
@end
