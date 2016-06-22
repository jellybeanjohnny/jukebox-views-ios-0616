//
//  FISSong.m
//  JukeboxViews
//
//  Created by Matt Amerige on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

- (instancetype)init
{
	return [self initWithTitle:@"" artist:@"" album:@"" fileName:@""];
}

- (instancetype)initWithTitle:(NSString *)title
											 artist:(NSString *)artist
												album:(NSString *)album
										 fileName:(NSString *)fileName
{
	if (!(self = [super init])) {
		return nil;
	}
	
	_title = title;
	_artist = artist;
	_album = album;
	_fileName = fileName;
	
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Title: %@\nArtist: %@\nAlbum: %@\nFileName: %@", self.title, self.artist, self.album, self.fileName];
}

@end
