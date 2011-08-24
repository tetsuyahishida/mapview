//
//  MapViewViewController.m
//  MapView
//
//  Created by 菱田哲也 on 11/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewViewController.h"

@implementation MapViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    lm.distanceFilter = kCLDistanceFilterNone;
    [lm startUpdatingLocation];
    [lm startUpdatingHeading];
}
+(double)distance:(double)latitude longitude:(double)longitude
{
    return (6378137*acos(latitude*M_PI/180)*sin(35.656428*M_PI/180)+cos(latitude*M_PI/180)*cos(35.656428*M_PI/180)*cos((longitude-139.688322)*M_PI/180));

}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
//newLocationがポインターになっている
          fromLocation:(CLLocation *)oldLocation {
    latLabel.text = [NSString stringWithFormat:@"緯度=%g",
                     newLocation.coordinate.latitude];
    lngLabel.text = [NSString stringWithFormat:@"経度=%g",
                     newLocation.coordinate.longitude];
//インスタンスを生成したくないのでクラス宣言の関数
    myLabel1.text = [NSString stringWithFormat:@"%g m  to my house" ,[MapViewViewController distance:newLocation.coordinate.latitude longtitude:newLocation.coordinate.longitude]]; 

    myLabel2.text = [NSString stringWithFormat:@"%g m  to my office" ,6378137*acos(sin(newLocation.coordinate.latitude*M_PI/180)*sin(35.691901*M_PI/180)+cos(newLocation.coordinate.latitude*M_PI/180)*cos(35.691901*M_PI/180)*cos((newLocation.coordinate.longitude-139.693912)*M_PI/180))];    
}
@synthesize mapview;

-(IBAction)getlocation {
    mapview.showsUserLocation = YES;

}

-(IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
