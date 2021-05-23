#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
	

	
	NSMutableArray * array = [NSMutableArray new];
	NSMutableArray * array2 = [NSMutableArray new];
	NSMutableArray<NSString *> *stringArray = [NSMutableArray<NSString *> new];
	
	for (int i = 0; i < [string1 length]; i++) {
				 [array addObject:[NSString stringWithFormat:@"%C", [string1 characterAtIndex:i]]];
	}
	
	for (int i = 0; i < [string2 length]; i++) {
				 [array2 addObject:[NSString stringWithFormat:@"%C", [string2 characterAtIndex:i]]];
	}

//	while (array.count != 0 && array2.count != 0) {
//		NSLog(@"%@", array[0]);
//		NSLog(@"%@", array2[0]);
//
//		if ([array[0] compare:array2[0] options:NSCaseInsensitiveSearch] == NSOrderedAscending) {
//				[result addObject:array[0]];
//
//			[array removeObjectAtIndex:0];
//		} else if ([array[0] compare:array2[0] options:NSCaseInsensitiveSearch] == NSOrderedDescending) {
//				[result addObject:array2[0]];
//				[array2 removeObjectAtIndex:0];
//
//			} else if ([array[0] isEqualToString:array2[0]]) {
//				[result addObject:array[0]];
//				[array removeObjectAtIndex:0];
//
//			}
//	}
//// @"A CA" @"B CF";
//	// @"ABCACF"
//
//	array.count == 0 ? [result addObjectsFromArray:array2] : [result addObjectsFromArray:array];
//
//	NSString *resultString = [result componentsJoinedByString:@" "];
//	NSLog(@"%@", resultString);
//	return [resultString stringByReplacingOccurrencesOfString: @" " withString:@""];
	
//	for (int i = 0; i < 10; i++)
//	{
//		//	NSLog(@"%d", i);
//	}
//
//
//	NSInteger str1 = string1.length;
//	NSInteger str2 = string2.length;
//
//
	for (int i = 0; i <= array.count + array2.count; i++) {
		
		if (array.count != 0 && array2.count != 0) {
			if ([array[i] compare:array2[i] options:NSCaseInsensitiveSearch] == NSOrderedAscending) {
				[stringArray addObject: array[i]];
				[array removeObjectAtIndex:i];
				
			} else if ([array[i] compare:array2[i] options:NSCaseInsensitiveSearch] == NSOrderedDescending) {
				[stringArray addObject: array2[i]];
				[array2 removeObjectAtIndex:i];
				
			} else if ([array[i] isEqualToString:array2[i]]) {
				[stringArray addObject: array[i]];
				[array removeObjectAtIndex:i];
			}
			
			i--;
		}
	}

	array.count == 0 ? [stringArray addObjectsFromArray:array2] : [stringArray addObjectsFromArray:array];

		NSString *result = [stringArray componentsJoinedByString:@" "];
		return [result stringByReplacingOccurrencesOfString: @" " withString:@""];
}

@end
