//
//  ShowLargeImage.m
//  VDCollectionView
//
//  Created by cuong on 6/18/15.
//  Copyright (c) 2015 cuong. All rights reserved.
//

#import "ShowLargeImage.h"

static NSUInteger currentRow;

@interface ShowLargeImage ()

@end

@implementation ShowLargeImage
@synthesize imgShow;
@synthesize nameImage;
@synthesize mArrayImage;
@synthesize section;
@synthesize row;
- (void)viewDidLoad {
    [super viewDidLoad];
    imgShow.image=[UIImage imageNamed:nameImage];
    currentRow=row;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
- (IBAction)doBtnClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
 */
- (IBAction)doClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doNext:(id)sender {
    currentRow++;
    if(currentRow <[[mArrayImage objectAtIndex:section]count])
    {
    NSString *nameOfImage = [mArrayImage [section] objectAtIndex:currentRow];
    imgShow.image=[UIImage imageNamed:nameOfImage];
    }
    else
    {
        currentRow=[[mArrayImage objectAtIndex:section]count]-1;
    }
    NSLog(@"Next %lu",currentRow);
}

- (IBAction)doPrevious:(id)sender {
    currentRow--;
    @try
    {
        NSString *nameOfImage = [mArrayImage [section] objectAtIndex:currentRow];
        imgShow.image=[UIImage imageNamed:nameOfImage];
    }
    @catch(NSException *error){
        currentRow=0;
    }
    @finally{
        NSLog(@"Pre %lu",currentRow);

    }


}
@end
