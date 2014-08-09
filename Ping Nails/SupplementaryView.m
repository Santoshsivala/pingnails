//
//  SupplementaryView.m
//  CollectionViewDemo
//
//  Created by Tapasya on 15/10/12.
//  Copyright (c) 2012 Tapasya. All rights reserved.
//

#import "SupplementaryView.h"

@implementation SupplementaryView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 528, 50)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:20.0];
        self.label.textColor = [UIColor whiteColor];
        [self.label setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-g.png"]]];
        self.label.numberOfLines = 3;
        [self addSubview:self.label];
    }
    return self;
}

@end
