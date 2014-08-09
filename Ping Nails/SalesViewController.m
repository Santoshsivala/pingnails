//
//  SalesViewController.m
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "ReservationViewController.h"
#import "ReportsViewController.h"
#import "AdminViewController.h"
#import "LogoutViewController.h"
#import "SalesViewController.h"
@interface SalesViewController ()
@end

AppDelegate *appd;

@implementation SalesViewController

@synthesize collectionViewPack,leftTable,Total,subTotal,giftCard,doller,finalizeOrderTable,imgviewSubtotal,imgviewTotal,subtotalheading,totahHeading,giftcareHeading,orderHeading,labelLineHead,finalizeOrderBtn,okbtn,cancelbtn,finalTotal,SubView,leftBgView,employeeIconArray,totalDoller,subTotalDoller,prePurchasedLabel;

static NSString * const kCellReuseIdentifier = @"collectionViewCell";
static NSString * const kCellReuseIdentifier2 = @"collectionViewCell2";

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
    
    [self.leftTable registerNib:[UINib nibWithNibName:@"leftTableCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.leftTable registerNib:[UINib nibWithNibName:@"leftTableCell2" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    [self.finalizeOrderTable registerNib:[UINib nibWithNibName:@"orderpannelCell" bundle:nil] forCellReuseIdentifier:@"Cell3"];
    
    actionSheet.delegate = self;
    prePurchasedLabel.layer.borderColor=[UIColor lightGrayColor].CGColor;
    prePurchasedLabel.layer.borderWidth = 1.0f;
    giftCard.textAlignment=NSTextAlignmentCenter;
    additionalSerSelectedArr=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"check.png"], nil];
   
    employeeIconArray =[[NSMutableArray alloc]initWithCapacity:36];
    productSelctionArr  =[[NSMutableArray alloc]initWithCapacity:36];
    rowCountArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 35; i++)
    {
        [employeeIconArray addObject:[NSNumber numberWithBool:NO]];
        [productSelctionArr addObject:[NSNumber numberWithInt:0]];
    }
      
    dbAccess = [[DBAccess alloc] init];
    okbtn.layer.cornerRadius=20;
    cancelbtn.layer.cornerRadius=20;
    finalTotal.layer.cornerRadius=20;
    finalizeOrderTable.layer.cornerRadius=50;
    SubView.layer.cornerRadius=30;
    [SubView setHidden:YES];
    appd=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"myScreen Shot 2014-06-08 at 5.09.05 pm.png"]];
    self.SubView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"finalizeOrderbg.png"]];
    [self.collectionViewPack registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
    [giftCard setTag:3000];
    giftCard.text=[NSMutableString stringWithFormat:@""];
    comparestr=@"Gift Card Purchase";
    string$=@"$";
    leftTableString$=@"- $";
    [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier];
    [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem2" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier2];
    self.collectionViewPack.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gray.png"]];
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 30, 15);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionViewPack setCollectionViewLayout:flowLayout];
    [self.collectionViewPack setAllowsSelection:YES];
    self.collectionViewPack.delegate=self;
    self.collectionViewPack.dataSource=self;
    finalizeOrderBtn.layer.cornerRadius=10;
    MyArray=[NSMutableArray new];
    myTotal=0.0;
    subtotal=0;
    noOfTextfieldInLeftTable=0;
    [leftTable setShowsVerticalScrollIndicator:NO];
    [finalizeOrderTable setShowsVerticalScrollIndicator:NO];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    Categorys *category = [categoryArr objectAtIndex:section];
    productArr = [dbAccess getAllProductsbyCategory:category.categoryid];
    [rowCountArr addObject:[NSNumber numberWithInt:productArr.count]];
    return productArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    categoryArr = [dbAccess getAllCategories];
    return categoryArr.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.section==4)
        {
            return CGSizeMake(146, 50);
        }
        else return CGSizeMake(146, 158);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    serviceNameOfCollctionCell = (UILabel *)[cell viewWithTag:100];
    servicePriceOfCollctionCell = (UILabel *)[cell viewWithTag:200];
    servieImage = (UIImageView *)[cell viewWithTag:300];
    cellBottomImgView=(UIImageView *)[cell viewWithTag:900];
    
    Categorys *Mycategory2 = [categoryArr objectAtIndex:indexPath.section];
    myprodArray2 = [dbAccess getAllProductsbyCategory:Mycategory2.categoryid];
    Product *MYproOBJECT=[myprodArray2 objectAtIndex:indexPath.row];
    
    int rowConter_test = 0;
    for(int loopCOunter =0; loopCOunter < indexPath.section; loopCOunter++){
        int test = [[rowCountArr objectAtIndex:loopCOunter] intValue];
        rowConter_test = rowConter_test +test;
    }
    
    if(indexPath.section==0)
    {
        if([[productSelctionArr objectAtIndex:indexPath.row] intValue] == 1){
            cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBgRed.png"];
            servieImage.image=[UIImage imageNamed:MYproOBJECT.selectedImageName];
        }
        else{
            servieImage.image=[UIImage imageNamed:MYproOBJECT.imageName];
            cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBg.png"];
        }
    }else{
        if (indexPath.section==4)
        {
            
        }else{

        if([[productSelctionArr objectAtIndex:(rowConter_test+indexPath.row)] intValue] == 1)
        {
            cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBgRed.png"];
            servieImage.image=[UIImage imageNamed:MYproOBJECT.selectedImageName];
        }
        else{
            servieImage.image=[UIImage imageNamed:MYproOBJECT.imageName];
            cellBottomImgView.image=[UIImage imageNamed:@"cellBottomBg.png"];
        }
        }
    }
    if (indexPath.section==4)
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier2 forIndexPath:indexPath];
        
        serviceNameOfCollctionCellAddSer = (UILabel *)[cell viewWithTag:400];
        servicePriceOfCollctionCellAddSer = (UILabel *)[cell viewWithTag:500];
        servieImageForAdditionalSer=(UIImageView *)[cell viewWithTag:800];
        
        serviceNameOfCollctionCellAddSer.text=MYproOBJECT.name;

        if (indexPath.row==14)
        {
            servicePriceOfCollctionCellAddSer.text=@"Enter Amt";
        }else{
          servicePriceOfCollctionCellAddSer.text=[string$ stringByAppendingString:[NSMutableString stringWithFormat:@"%0.f",MYproOBJECT.price]];
        }
        
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-cell.png"]]];
        
        if([[productSelctionArr objectAtIndex:(rowConter_test+indexPath.row)] intValue] == 1)
        {
            
            servieImageForAdditionalSer.image=[additionalSerSelectedArr objectAtIndex:0];
        }
        else{
            servieImageForAdditionalSer.image=[UIImage imageNamed:@"Screen.png"];
        }
 
        return cell;
    }
    else
    {
        serviceNameOfCollctionCell.text = MYproOBJECT.name;
        servicePriceOfCollctionCell.text =[string$ stringByAppendingString:[NSMutableString stringWithFormat:@"%0.f",MYproOBJECT.price]];
        
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    int rowConter_test = 0;
    for(int loopCOunter =0; loopCOunter < indexPath.section; loopCOunter++){
        int test = [[rowCountArr objectAtIndex:loopCOunter] intValue];
        rowConter_test = rowConter_test +test;
    }
    
    giftCard.text=nil;
    appd.dataSection=[NSMutableString stringWithFormat:@"%ld",(long)indexPath.section];
    appd.dataRow=[NSMutableString stringWithFormat:@"%ld",(long)indexPath.row];
    float tempTotal=0.0;
    Categorys *Mycategory = [categoryArr objectAtIndex:indexPath.section];
    myproductArray = [dbAccess getAllProductsbyCategory:Mycategory.categoryid];
    Product *MYproOBJ=[myproductArray objectAtIndex:indexPath.row];
    tempTotal=(MYproOBJ.quantity*MYproOBJ.price);
    appd.dataName=[NSMutableString stringWithFormat:@"%@",MYproOBJ.name];
    

    Categorys *Mycategory2 = [categoryArr objectAtIndex:indexPath.section];
    myprodArray2 = [dbAccess getAllProductsbyCategory:Mycategory2.categoryid];
    
    if ([comparestr isEqualToString:appd.dataName])
    {
        if ([myGiftCardLeftTableCustomCellArray containsObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]])
        {

                [productSelctionArr replaceObjectAtIndex:(rowConter_test+indexPath.row) withObject:[NSNumber numberWithInt:0]];
            Product *ProdObject =[giftcardCellArray objectAtIndex:0];
            int tempTotal2=ProdObject.price;
            myTotal=myTotal-tempTotal2;
            [giftcardCellArray removeAllObjects];
            [myGiftCardLeftTableCustomCellArray removeAllObjects];
        }
        else
        {
            [productSelctionArr replaceObjectAtIndex:(rowConter_test+indexPath.row) withObject:[NSNumber numberWithInt:1]];
            myTotal=myTotal+tempTotal;
            if (!giftcardCellArray)
            {
                myGiftCardLeftTableCustomCellArray =[NSMutableArray new];
                [myGiftCardLeftTableCustomCellArray addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
                giftcardCellArray =[NSMutableArray new];
                [giftcardCellArray addObject:MYproOBJ];
            }
            else
            {
                [myGiftCardLeftTableCustomCellArray addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
                [giftcardCellArray addObject:MYproOBJ];
            }
        }
    }
    else
    {
        if ([myLeftTableCustomCellArray containsObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]])
        {
            if(indexPath.section==0){
                [productSelctionArr replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInt:0]];
            }else{
                [productSelctionArr replaceObjectAtIndex:(rowConter_test+indexPath.row) withObject:[NSNumber numberWithInt:0]];
            }
            
            NSUInteger index = [myLeftTableCustomCellArray indexOfObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
            Product *ProdObject =[MyArray objectAtIndex:index];
            int tempTotal1=ProdObject.quantity*ProdObject.price;
            myTotal=myTotal-tempTotal1;
            [myLeftTableCustomCellArray removeObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
            [MyArray removeObjectAtIndex:index];
        }
        else
        {
            if(indexPath.section==0){
                [productSelctionArr replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInt:1]];
            }else{
                [productSelctionArr replaceObjectAtIndex:(rowConter_test+indexPath.row) withObject:[NSNumber numberWithInt:1]];
            }
            myTotal=myTotal+tempTotal;
            if (!myLeftTableCustomCellArray)
            {
                myLeftTableCustomCellArray=[NSMutableArray new];
                [myLeftTableCustomCellArray addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
                MyArray=[NSMutableArray new];
                [MyArray addObject:MYproOBJ];
            }
            else
            {
                [myLeftTableCustomCellArray addObject:[NSMutableString stringWithFormat:@"%@%@",appd.dataSection,appd.dataRow]];
                [MyArray addObject:MYproOBJ];
            }
        }
    }
    
    subtotal=myTotal;
    subTotal.text=[NSString stringWithFormat:@"%0.f",myTotal];
    Total.text=[NSString stringWithFormat:@"%0.f",myTotal];
    [self.collectionViewPack reloadData];
    [self.leftTable reloadData];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SupplementaryView *supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SupplementaryView" forIndexPath:indexPath];
    if(kind == UICollectionElementKindSectionHeader)
    {
        supplementaryView.backgroundColor = [UIColor lightGrayColor];
        Categorys *cat = [categoryArr objectAtIndex:indexPath.section];
        supplementaryView.label.text=cat.name;
    }
  return supplementaryView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(528, 50);
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
        return [giftcardCellArray count];
    else
        return MyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    static NSString *cellIdentifier2=@"Cell2";
    static NSString *cellIdentifier3=@"Cell3";
    
    if (tableView==finalizeOrderTable)
    {
        orderpannelCell *cell=(orderpannelCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier3];
        if (cell==nil)
        {
            cell=[[orderpannelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
        }
        if (indexPath.section==0)
        {
            Product *PoductObject =[giftcardCellArray objectAtIndex:indexPath.row];
            cell.servName.text=[NSString stringWithFormat:@"%@",PoductObject.name];
            cell.Qntity.text=[NSString stringWithFormat:@"%d",PoductObject.quantity];
            cell.price.text=[NSString stringWithFormat:@"%0.f",PoductObject.price];
            return cell;
        }
        else
        {
            Product *PoductObject =[MyArray objectAtIndex:indexPath.row];
            cell.servName.text=[NSString stringWithFormat:@"%@",PoductObject.name];
            [cell.Qntity setText:[NSString stringWithFormat:@"%d",PoductObject.quantity]];
            cell.price.text=[NSString stringWithFormat:@"%0.f",PoductObject.price];
            return cell;
        }
    }
    else
    {
        if (indexPath.section==0)
        {
            leftTableCell2 *cell = (leftTableCell2 *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
            if (cell==nil)
            {
                cell=[[leftTableCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
            }
            cell.Barcode.delegate=self;
            cell.Quantity2.delegate=self;
            cell.Barcode.tag=2000;
            cell.Quantity2.tag=1000;
            Product *PoductObj =[giftcardCellArray objectAtIndex:indexPath.row];
            cell.Quantity2.text=[NSString stringWithFormat:@"%d",PoductObj.quantity];
            cell.Barcode.text=[NSString stringWithFormat:@"%0.f",PoductObj.price];
            cell.NameOfTheservice2.text=[NSString stringWithFormat:@"%@",PoductObj.name];
            [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftTableCellbg.png"]]];
            cell.Barcode.layer.borderColor=[[UIColor lightGrayColor]CGColor];
            cell.Quantity2.layer.borderColor=[[UIColor lightGrayColor]CGColor];
            cell.Barcode.layer.borderWidth = 1.0f;
            cell.Quantity2.layer.borderWidth = 1.0f;
            return cell;
        }
        else if (indexPath.section==1)
        {
            leftTableCell *cell = (leftTableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell==nil)
            {
                cell=[[leftTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            
            Product *PoductObject =[MyArray objectAtIndex:indexPath.row];
            cell.Quantity.tag=indexPath.row;
            cell.empbtn.tag=indexPath.row;
            cell.Quantity.delegate=self;
            cell.NameofServices.text=[NSString stringWithFormat:@"%@",PoductObject.name];
            cell.Price.text=[NSString stringWithFormat:@"%0.f",PoductObject.price];
            cell.Quantity.text=[NSString stringWithFormat:@"%d",PoductObject.quantity];
            [cell.empbtn addTarget:self action:@selector(employeeIcon:) forControlEvents:UIControlEventTouchUpInside];
            
            NSNumber *flag1 = (NSNumber *)[employeeIconArray objectAtIndex:indexPath.row];
            if (flag1 == [NSNumber numberWithBool:NO])
            {
                cell.empbtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"unselecteduser.png"]];
            }else
            {
                cell.empbtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"selecteduser.png"]];
            }
            [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftTableCellbg.png"]]];
            cell.Quantity.layer.borderColor=[[UIColor lightGrayColor]CGColor];
            cell.Quantity.layer.borderWidth = 1.0f;
            return cell;
        }
    }
    return nil;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag==1000||textField.tag==2000){
        if(textField.tag==2000){
            Product *ProdObject =[giftcardCellArray objectAtIndex:0];
            int tempPreviousValue=ProdObject.price;
            ProdObject.price=[textField.text intValue];
            myTotal=(myTotal+ProdObject.price)-tempPreviousValue;
            subtotal=myTotal;
        }else{
            Product *ProdObject =[giftcardCellArray objectAtIndex:0];
            ProdObject.quantity=[textField.text intValue];
        }
    }else if(textField.tag <=40){
        if (noOfTextfieldInLeftTable==MyArray.count+giftcardCellArray.count) {
            Product *ProdObject =[MyArray objectAtIndex:textField.tag];
            int tempPreviousValue=ProdObject.quantity*ProdObject.price;
            ProdObject.quantity=[textField.text intValue];
            myTotal=myTotal+(ProdObject.quantity*ProdObject.price)-tempPreviousValue;
            subtotal=myTotal;
            giftCard.text=nil;
        }
    }
    if (textField.tag==3000)
    {
        if ([textField.text intValue]>myTotal) {
            UIAlertView *alertgif=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Please enter correct value i.e less than or equal to total bill" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertgif show];
            giftCard.text=nil;
        }
        subtotal=myTotal-[textField.text intValue];
    }
    
    subTotal.text=[NSString stringWithFormat:@"%d",subtotal];
    Total.text=[NSString stringWithFormat:@"%0.f",myTotal];
    finalTotal.text=[NSString stringWithFormat:@"Total Amount                                        $ %d",subtotal];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    noOfTextfieldInLeftTable=MyArray.count + giftcardCellArray.count;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string length]==0)
    {
        return YES;
    }
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++)
    {
        unichar ch = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:ch])
        {
            return YES;
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Please enter Numaric characters" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
           [alert show];
        }
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)okayAction:(id)sender
{
    UIAlertView *alertx=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Order is Success" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertx show];
    [giftcardCellArray removeAllObjects];
    [myGiftCardLeftTableCustomCellArray removeAllObjects];
    [MyArray removeAllObjects];
    [myLeftTableCustomCellArray removeAllObjects];
    subtotal=0;
    myTotal=0;
    
    for (int i = 0; i < 35; i++)
    {
        [employeeIconArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
        [productSelctionArr replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:0]];
    }
    
    [collectionViewPack reloadData];
    Total.text=0;
    subTotal.text=0;
    finalTotal.text=0;
    giftCard.text=nil;
    [self.leftTable reloadData];
    [self.SubView setHidden:YES];
    [totalDoller setHidden:NO];
    [subTotalDoller setHidden:NO];
    [doller setHidden:NO];
    [prePurchasedLabel setHidden:NO];
    [collectionViewPack setHidden:NO];
    [leftTable setHidden:NO];
    [Total setHidden:NO];
    [giftCard setHidden:NO];
    [subTotal setHidden:NO];
    [imgviewTotal setHidden:NO];
    [imgviewSubtotal setHidden:NO];
    [subtotalheading setHidden:NO];
    [totahHeading setHidden:NO];
    [giftcareHeading setHidden:NO];
    [orderHeading setHidden:NO];
    [labelLineHead setHidden:NO];
    [finalizeOrderBtn setHidden:NO];
    [leftBgView setHidden:NO];
}

- (IBAction)cancelAction:(id)sender
{
    [self.SubView setHidden:YES];
    [totalDoller setHidden:NO];
    [subTotalDoller setHidden:NO];
    [doller setHidden:NO];
    [doller setHidden:NO];
    [prePurchasedLabel setHidden:NO];
    [collectionViewPack setHidden:NO];
    [leftTable setHidden:NO];
    [Total setHidden:NO];
    [giftCard setHidden:NO];
    [subTotal setHidden:NO];
    [imgviewTotal setHidden:NO];
    [imgviewSubtotal setHidden:NO];
    [subtotalheading setHidden:NO];
    [totahHeading setHidden:NO];
    [giftcareHeading setHidden:NO];
    [orderHeading setHidden:NO];
    [labelLineHead setHidden:NO];
    [finalizeOrderBtn setHidden:NO];
    [leftBgView setHidden:NO];
}

- (IBAction)FinalizeOrder:(id)sender
{
    if (myLeftTableCustomCellArray.count==0 && myGiftCardLeftTableCustomCellArray.count==0)
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Please select services" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }else{
        if ([giftCard.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Information" message:@"Please enter Giftcard value" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }else{
            [finalizeOrderTable reloadData];
            [totalDoller setHidden:YES];
            [subTotalDoller setHidden:YES];
            [doller setHidden:YES];
            [prePurchasedLabel setHidden:YES];
            [self.SubView setHidden:NO];
            [leftBgView setHidden:YES];
            [collectionViewPack setHidden:YES];
            [leftTable setHidden:YES];
            [Total setHidden:YES];
            [giftCard setHidden:YES];
            [subTotal setHidden:YES];
            [imgviewTotal setHidden:YES];
            [imgviewSubtotal setHidden:YES];
            [subtotalheading setHidden:YES];
            [totahHeading setHidden:YES];
            [giftcareHeading setHidden:YES];
            [orderHeading setHidden:YES];
            [labelLineHead setHidden:YES];
            [finalizeOrderBtn setHidden:YES];
        }
    }
}
-(void)employeeIcon:(id)sender
{
    UIButton *senderButton = (UIButton *)sender;
    NSNumber *flag1 = (NSNumber *)[employeeIconArray objectAtIndex:senderButton.tag];
    
    if (flag1 == [NSNumber numberWithBool:NO])
    {
        dbAccess = [[DBAccess alloc] init];
        employeesArr2 = [dbAccess getAllEmpDetails];
        array1=[[NSMutableArray alloc]init];

        for(int counter =0; counter < employeesArr2.count; counter++)
        {
            Employee *emp = [employeesArr2 objectAtIndex:counter];
            [array1 addObject:[NSMutableString stringWithFormat:@"%@",emp.name]];
        }
        
        actionSheet = [[UIActionSheet alloc] init];
        actionSheet.title = @"Employee Name";
        actionSheet.delegate = self;
        
        for(int i=0;i<[array1 count];i++)
        {
            [actionSheet addButtonWithTitle:[array1 objectAtIndex:i]];
        }
        [actionSheet showInView:self.view];
        
        [employeeIconArray replaceObjectAtIndex:senderButton.tag withObject:[NSNumber numberWithBool:YES]];
    }
    else
    {
        [employeeIconArray replaceObjectAtIndex:senderButton.tag withObject:[NSNumber numberWithBool:NO]];
        [self.leftTable reloadData];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet2 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet2.cancelButtonIndex)
    {
        [actionSheet2 dismissWithClickedButtonIndex:buttonIndex animated:YES];
        [self.leftTable reloadData];
    }
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet2
{
    [[actionSheet2 layer] setBackgroundColor:[UIColor blackColor].CGColor];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [leftTable deselectRowAtIndexPath:indexPath animated:YES];
}
@end
