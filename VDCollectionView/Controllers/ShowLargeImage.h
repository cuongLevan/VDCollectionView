//
//  ShowLargeImage.h
//  VDCollectionView
//
//  Created by cuong on 6/18/15.
//  Copyright (c) 2015 cuong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowLargeImage : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgShow;
@property (strong,nonatomic) NSString *nameImage;
@property (strong, nonatomic) NSMutableArray *mArrayImage;
@property NSUInteger section;
@property NSUInteger row;

- (IBAction)doClose:(id)sender;
- (IBAction)doNext:(id)sender;
- (IBAction)doPrevious:(id)sender;
@end
