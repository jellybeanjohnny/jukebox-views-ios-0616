//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by Matt Amerige on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject

@property (strong, nonatomic) NSMutableArray *songs;
@property (strong, nonatomic) NSString *text;

- (instancetype)init;

- (void)sortSongsByTitle;
- (void)sortSongsByArtist;
- (void)sortSongsByAlbum;
- (FISSong *)songForTrackNumber:(NSUInteger)trackNumber;

@end
