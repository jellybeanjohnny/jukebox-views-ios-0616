//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Matt Amerige on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

- (instancetype)init
{
	if (!(self = [super init])) {
		return nil;
	}
	
	_songs = [self generateSongObjects];
	[self setupText];
	
	return self;
}

/**
 Sorts by title and secondarily by artist
 */
- (void)sortSongsByTitle
{
	NSSortDescriptor *byTitleDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
	NSSortDescriptor *byArtistDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
	
	[self.songs sortUsingDescriptors:@[byTitleDescriptor, byArtistDescriptor]];
	
	[self setupText];
}

- (void)sortSongsByArtist
{
	NSSortDescriptor *byArtistDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
	NSSortDescriptor *byAlbumDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
	
	[self.songs sortUsingDescriptors:@[byArtistDescriptor, byAlbumDescriptor]];
	
	[self setupText];
}

- (void)sortSongsByAlbum
{
	NSSortDescriptor *byAlbumDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
	NSSortDescriptor *byTitleDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
	
	[self.songs sortUsingDescriptors:@[byAlbumDescriptor, byTitleDescriptor]];
	
	[self setupText];
}

- (FISSong *)songForTrackNumber:(NSUInteger)trackNumber
{
	if (trackNumber > self.songs.count || trackNumber < 1) {
		return nil;
	}
	
	// Track number begins at 1, subtract 1 to get the equivalent array index
	return self.songs[trackNumber - 1];
}

#pragma mark - Helper

- (void)setupText
{
	NSMutableString *result = [[NSMutableString alloc] init];
	
	NSUInteger index = 1;
	for (FISSong *song in self.songs) {
	
		[result appendFormat:@"%ld. (Title) %@ (Artist) %@ (Album) %@\n", index, song.title, song.artist, song.album];
	
		index++;
	}
	
	self.text = result;
}

- (NSMutableArray *)generateSongObjects
{
	NSMutableArray *songs = [[NSMutableArray alloc] init];
 
	[songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
																					 artist:@"Matoma vs Big Poppa"
																						album:@"The Internet 1"
																				 fileName:@"hold_on_be_strong"] ];
 
	[songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
																					 artist:@"Matoma ft. James Vincent McMorrow"
																						album:@"The Internet 2"
																				 fileName:@"higher_love"] ];
 
	[songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
																					 artist:@"Matoma ft. The Notorious B.I.G."
																						album:@"The Internet 3"
																				 fileName:@"mo_money_mo_problems"] ];
 
	[songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
																					 artist:@"The Notorious B.I.G."
																						album:@"The Internet 4"
																				 fileName:@"old_thing_back"] ];
 
	[songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
																					 artist:@"Matoma"
																						album:@"The Internet 5"
																				 fileName:@"gangsta_bleeding_love"] ];
 
	[songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
																					 artist:@"Enrique Iglesias ft. Sean Paul"
																						album:@"The Internet 6"
																				 fileName:@"bailando"] ];
 
	return songs;
}

@end
