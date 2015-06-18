//
//  CollectionViewController.h
//  VDCollectionView
//
//  Created by cuong on 6/18/15.
//  Copyright (c) 2015 cuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnShare;
- (IBAction)doShare:(id)sender;

@end
