//
//  AllPlacesCollectionViewController.m
//  CollectionView
//
//  Created by Felix14 on 07/07/17.
//  Copyright © 2017 felix-its. All rights reserved.
//

#import "AllPlacesCollectionViewController.h"
#import "PlacesCollectionViewCell.h"
#import "nearByPlacesTableViewController.h"

@interface AllPlacesCollectionViewController ()

@end

@implementation AllPlacesCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PlacesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    _imgArray=[NSMutableArray arrayWithObjects:@"atm",@"chemist",@"coffee",@"florists",@"hotel",@"hospital", nil];
    
    _labelArray=[NSMutableArray arrayWithObjects:@"Atm",@"Chemist",@"Coffee",@"Florist",@"Hotel",@"Hospital", nil];
    
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
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imgArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   // PlacesCollectionViewCell *cell = [UICollectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    PlacesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    
    // Configure the cell
    cell.placeImg.image=[UIImage imageNamed:[_imgArray objectAtIndex:indexPath.row]];
    cell.placeLabel.text=[_labelArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // if code is with segue
    //[self performSegueWithIdentifier:@"fvctosvc" sender:self];
    
    nearByPlacesTableViewController *nbp=[[nearByPlacesTableViewController alloc]init];
    
    nbp.selectedPlace=[_labelArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:nbp animated:YES];
    
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"fvctosvc"])
    {
        //NSIndexPath *path=[self.tableView  ]
    }
}
 */

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

@end
