//
//  MapViewViewController.h
//  MapView
//
//  Created by 菱田 哲也 on 11/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewViewController : UIViewController  <CLLocationManagerDelegate> {
    CLLocationManager *lm;
    IBOutlet UILabel *myLabel1;
    IBOutlet UILabel *myLabel2;
    IBOutlet UILabel *latLabel;
    IBOutlet UILabel *lngLabel;
    MKMapView *mapview;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapview;
-(IBAction)setMap:(id)sender;
-(IBAction)getlocation;
+(double)distance:(double)latitude longitude:(double)longitude;
@end
