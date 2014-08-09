//
//  employeeReservationCell.h
//  Ping Nails
//
//  Created by Taya technologies on 11/06/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface employeeReservationCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *reservationTime;
@property (strong, nonatomic) IBOutlet UIImageView *employeeIcon;
@property (strong, nonatomic) IBOutlet UILabel *EmployeeName;
@property (strong, nonatomic) IBOutlet UILabel *servicesforReservation;
@property (strong, nonatomic) IBOutlet UILabel *customerName;

@end
