//
//  SalesViewController.h
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//
#import <sqlite3.h>
#import "DBAccess.h"
#import <UIKit/UIKit.h>
#import "leftTableCell.h"
#import "leftTableCell2.h"
#import "SupplementaryView.h"
#import "orderpannelCell.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "Product.h"
@interface SalesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,UIActionSheetDelegate>{
    UIActionSheet *actionSheet;
    NSMutableArray *array1 ;
    NSMutableArray *employeesArr2;
    IBOutlet UICollectionView *collectionViewPack;
    UILabel *serviceNameOfCollctionCell,*servicePriceOfCollctionCell,*serviceNameOfCollctionCellAddSer,*servicePriceOfCollctionCellAddSer;
    UIImageView *servieImage,*servieImageForAdditionalSer,*cellBottomImgView;
    UICollectionViewFlowLayout *flowLayout;
    NSString *comparestr;
    NSMutableArray *categoryArr,*productArr;
    NSMutableArray   *productArr2;
    DBAccess *dbAccess;
    NSString *string$,*leftTableString$;
    Product *pro, *pro2;
    NSMutableArray *additionalSerSelectedArr;
    NSMutableArray *MyArray,*myproductArray;
    float myTotal;
    NSMutableArray *myLeftTableCustomCellArray,*giftcardCellArray,*myGiftCardLeftTableCustomCellArray;
    int subtotal;
    int noOfTextfieldInLeftTable;
    NSMutableArray *myprodArray2,*rowCountArr,*productSelctionArr;
    
}
@property (strong, nonatomic) NSMutableArray *employeeIconArray;
@property (strong, nonatomic) IBOutlet UILabel *totalDoller;
@property (strong, nonatomic) IBOutlet UILabel *subTotalDoller;
@property (strong, nonatomic) IBOutlet UILabel *prePurchasedLabel;
@property (strong, nonatomic) IBOutlet UILabel *doller;

@property (nonatomic, strong) IBOutlet UITableView *leftTable;
@property (nonatomic, retain) IBOutlet UICollectionView *collectionViewPack;
@property (strong, nonatomic) IBOutlet UILabel *Total;
@property (strong, nonatomic) IBOutlet UITextField *giftCard;
@property (strong, nonatomic) IBOutlet UILabel *subTotal;
@property (strong, nonatomic) IBOutlet UITableView *finalizeOrderTable;
@property (strong, nonatomic) IBOutlet UIImageView *imgviewSubtotal;
@property (strong, nonatomic) IBOutlet UIImageView *imgviewTotal;
@property (strong, nonatomic) IBOutlet UILabel *subtotalheading;
@property (strong, nonatomic) IBOutlet UILabel *giftcareHeading;
@property (strong, nonatomic) IBOutlet UILabel *totahHeading;
@property (strong, nonatomic) IBOutlet UILabel *orderHeading;
@property (strong, nonatomic) IBOutlet UILabel *labelLineHead;
@property (strong, nonatomic) IBOutlet UIButton *finalizeOrderBtn;
@property (strong, nonatomic) IBOutlet UIButton *okbtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UILabel *finalTotal;
@property (strong, nonatomic) IBOutlet UIView *SubView;
@property (strong, nonatomic) IBOutlet UIImageView *leftBgView;
- (IBAction)okayAction:(id)sender;
- (IBAction)cancelAction:(id)sender;
- (IBAction)FinalizeOrder:(id)sender;

@end
