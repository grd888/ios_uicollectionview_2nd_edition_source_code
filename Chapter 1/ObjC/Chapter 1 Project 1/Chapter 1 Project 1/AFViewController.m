//
//  AFViewController.m
//  Chapter 1 Project 1
//
//  Created by Greg Delgado on 26/10/2017.
//  Copyright © 2017 Greg Delgado. All rights reserved.
//

#import "AFViewController.h"

static NSString *kCellIdentifier = @"Cell Identifier";

@implementation AFViewController
{
    NSArray *colorArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    
    const NSInteger numberOfColors = 100;
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:numberOfColors];
    
    for (NSInteger i = 0; i < numberOfColors; i++)
    {
        CGFloat redValue = (arc4random() % 255) / 255.0f;
        CGFloat blueValue = (arc4random() % 255) / 255.0f;
        CGFloat greenValue = (arc4random() % 255) / 255.0f;
        
        [tempArray addObject:[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f]];
    }
    
    colorArray = [NSArray arrayWithArray:tempArray];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return colorArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = colorArray[indexPath.item];
    
    return cell;
}

@end
