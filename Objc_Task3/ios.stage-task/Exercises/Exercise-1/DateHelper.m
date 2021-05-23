#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
	// Wed Jan  1 00:00:00 2020
	
	if (monthNumber > 0 && monthNumber <= 12) {
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		NSArray *months = [dateFormatter monthSymbols];
		return  months[monthNumber-1];
		
		
//		NSCalendar *calendar = [NSCalendar currentCalendar];
//		NSDateComponents *components = [[NSDateComponents alloc] init];
//
//		components.year = 2020;
//		components.month = monthNumber;
//		components.day = monthNumber;
//
//		NSDate *date = [calendar dateFromComponents:components];
//
//		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//		dateFormatter.dateFormat = @"MMMM";
//		NSString *dateString = [dateFormatter stringFromDate:date];
//		return  dateString;
	}
	
	return  nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
	
	// @"2018-03-15T16:37:29Z"
	//yyyy-MM-dd'T'HH:mm:ssZ
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
	NSDate *dateF = [dateFormatter dateFromString:date];
	
	dateFormatter.dateFormat = @"dd";
	
	NSString * dateString = [dateFormatter stringFromDate:dateF];
	long result = [dateString longLongValue];
	return result;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
	//  Wed May 19 00:00:00 2021

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru_RU"];
	dateFormatter.dateFormat = @"EE";
	NSString *dateString = [dateFormatter stringFromDate:date];
	return  dateString;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
	NSDate *startDate = nil;
		 NSTimeInterval interval = 0.0;
		 NSCalendar *calendar = [NSCalendar currentCalendar];
		 [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate: &startDate interval: &interval forDate: [NSDate date]];
		 NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitSecond value: (NSInteger)interval toDate: startDate options:NSCalendarMatchNextTime];

		 return [date compare:startDate] == NSOrderedDescending && [date compare:endDate] == NSOrderedAscending;
}

@end
