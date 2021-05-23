#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
	if (ratingArray.count == 0 || ratingArray == nil) {
		return 0;
	}
	NSMutableArray *results = [[NSMutableArray alloc] init];
	NSMutableArray *stepArray = [[NSMutableArray alloc] init];
	NSUInteger count = ratingArray.count;
	
	for (int i = 0; i < count; i++) {
		for (int j = i + 1; j < count; j++) {
			for (int k = j + 1; k < count; k++) {
				if (i < j && j < k) {
					if (((ratingArray[i].intValue < ratingArray[j].intValue) &&
							 (ratingArray[j].intValue < ratingArray[k].intValue)) ||
							((ratingArray[i].intValue > ratingArray[j].intValue) &&
							 (ratingArray[j].intValue > ratingArray[k].intValue))) {
						
						[stepArray addObject:ratingArray[i]];
						[stepArray addObject:ratingArray[j]];
						[stepArray addObject:ratingArray[k]];
						
						[results addObject:stepArray];
						[stepArray removeAllObjects];
					}
				}
			}
		}
	}
	
	return results.count;
}

@end
