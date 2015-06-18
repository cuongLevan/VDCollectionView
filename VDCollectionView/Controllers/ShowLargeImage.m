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
{
    NSUInteger numRowOfArray;
}

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
    numRowOfArray=[[mArrayImage objectAtIndex:section]count];
    
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
    if(currentRow <numRowOfArray)
    {
    NSString *nameOfImage = [mArrayImage [section] objectAtIndex:currentRow];
    imgShow.image=[UIImage imageNamed:nameOfImage];
    }
    else
    {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Information" message:@"No picture next" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        currentRow=numRowOfArray-1;
        

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
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Information" message:@"No picture previous" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
        currentRow=0;
    }
    @finally{
        NSLog(@"Pre %lu",currentRow);

    }


}
@end
