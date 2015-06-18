//
//  CollectionViewController.m
//  VDCollectionView
//
//  Created by cuong on 6/18/15.
//  Copyright (c) 2015 cuong. All rights reserved.
//

#import "CollectionViewController.h"
#import "HeadCollection.h"
#import "ShowLargeImage.h"
#import <Social/Social.h>

@interface CollectionViewController ()
{
    NSMutableArray *mArrayRecipe;
    
    //NSArray *recipeImages;
    BOOL shareEnabled;
    NSMutableArray *selectedRecipes;
}

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedRecipes = [NSMutableArray array];

    NSArray *mainDishImages = [NSArray arrayWithObjects:@"images/egg_benedict.jpg", @"images/full_breakfast.jpg", @"images/ham_and_cheese_panini.jpg", @"images/ham_and_egg_sandwich.jpg", @"images/hamburger.jpg", @"images/instant_noodle_with_egg.jpg", @"images/japanese_noodle_with_pork.jpg", @"images/mushroom_risotto.jpg", @"images/noodle_with_bbq_pork.jpg", @"images/thai_shrimp_cake.jpg", @"images/vegetable_curry.jpg", nil];
    NSArray *drinkDessertImages = [NSArray arrayWithObjects:@"images/angry_birds_cake.jpg", @"images/creme_brelee.jpg", @"images/green_tea.jpg", @"images/starbucks_coffee.jpg", @"images/white_chocolate_donut.jpg", nil];
    mArrayRecipe = [NSMutableArray arrayWithObjects:mainDishImages, drinkDessertImages, nil];

    // set flowLayout
    UICollectionViewFlowLayout *collectionViewLayout =(UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset=UIEdgeInsetsMake(20, 0, 10, 0);
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
  //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [mArrayRecipe count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[mArrayRecipe objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *imageView= [[UIImageView alloc]init];
    imageView=(UIImageView *)[cell.contentView viewWithTag:100];
   // imageView.image=[UIImage imageNamed:[mArrayRecipe objectAtIndex:indexPath.row]];
    imageView.image=[UIImage imageNamed:[mArrayRecipe[indexPath.section] objectAtIndex:indexPath.row]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images/photo-frame.png"]];
    cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"images/pic_frame.png"]];
    
    // Configure the cell
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (shareEnabled) {
        // Determine the selected items by using the indexPath
        NSString *selectedRecipe = [mArrayRecipe[indexPath.section] objectAtIndex:indexPath.row];
        // Add the selected item into the array
        [selectedRecipes addObject:selectedRecipe];

        
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (shareEnabled) {
        NSString *deSelectedRecipe = [mArrayRecipe[indexPath.section] objectAtIndex:indexPath.row];
        [selectedRecipes removeObject:deSelectedRecipe];
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *collectionReusable=nil;
    NSString *identifier=@"HeadCollection";
    
    if(kind == UICollectionElementKindSectionHeader)
    {
        HeadCollection *headView= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
       NSString *title=[NSString stringWithFormat:@"Section: #%lu",indexPath.section+1];
        headView.headCollectionViewTitle.text=title;
        collectionReusable=headView;
    }
    
    return collectionReusable;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowLargeImage"])
    {
        NSArray *indexPaths =[self.collectionView indexPathsForSelectedItems];
        ShowLargeImage *showLargeImage= segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        showLargeImage.mArrayImage=mArrayRecipe;
        showLargeImage.section=indexPath.section;
        showLargeImage.row=indexPath.row;
        showLargeImage.nameImage =[mArrayRecipe [indexPath.section] objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (IBAction)doShare:(id)sender {
    
    if (shareEnabled) {
        
        // Post selected photos to Facebook
        if ([selectedRecipes count] > 0) {
            if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [controller setInitialText:@"Check out my recipes!"];
                for (NSString *recipePhoto in selectedRecipes) {
                    [controller addImage:[UIImage imageNamed:recipePhoto]];
                }
                
                [self presentViewController:controller animated:YES completion:Nil];
            }
        }
        
        // Deselect all selected items
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        // Remove all items from selectedRecipes array
        [selectedRecipes removeAllObjects];
        
        // Change the sharing mode to NO
        shareEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        self.btnShare.title = @"Share";
        [self.btnShare setStyle:UIBarButtonItemStylePlain];
        
    } else {
        
        // Change shareEnabled to YES and change the button text to DONE
        shareEnabled = YES;
        self.collectionView.allowsMultipleSelection = YES;
        self.btnShare.title = @"Upload";
        [self.btnShare setStyle:UIBarButtonItemStyleDone];
        
    }
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if(shareEnabled)
    {return NO;}
    else{
        return YES;
    }
}
@end
