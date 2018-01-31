//
//  nearByPlacesTableViewController.m
//  CollectionView
//
//  Created by student14 on 18/07/17.
//  Copyright © 2017 felix-its. All rights reserved.
//

#import "nearByPlacesTableViewController.h"
#import "nearByPlacesTableViewCell.h"
#import <CoreLocation/CoreLocation.h>

@interface nearByPlacesTableViewController ()


@end

@implementation nearByPlacesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //NSLog(@"%@",_selectedPlace);
    
    _name=[[NSMutableArray alloc]init];
    _address=[[NSMutableArray alloc]init];
    
    _data=[[NSMutableData alloc]init];
    //CLLocationManager *locationManager;
    //locationManager=[[CLLocationManager alloc]init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"nearByPlacesTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    //NSMutableString *url=@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=YOUR_API_KEY";
   
    //locationManager.distanceFilter = kCLDistanceFilterNone;
    //locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    //[locationManager startUpdatingLocation];
    
    //float latitude = locationManager.location.coordinate.latitude;
    //float longitude = locationManager.location.coordinate.longitude;
    //NSLog(@" latitude : %f Longitude : %f",latitude,longitude);
    
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=18.5204,73.8567&radius=1000&sensor=true&types=%@&key=AIzaSyCoH7E3jTcSgJvloQKQBKEpNtMhP7ayQIM",[_selectedPlace lowercaseString]];
    
    NSURL *url=[NSURL URLWithString:str];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *outerdic=[NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *results=[outerdic objectForKey:@"results"];
    
    for(NSDictionary *temp in results)
    {
        
        [_name addObject:[temp objectForKey:@"name"]];
        [_address addObject:[temp objectForKey:@"vicinity"]];
        
    }
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _name.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    nearByPlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.nameLabel.text=[_name objectAtIndex:indexPath.row];
    cell.addressLabel.text=[_address objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
