//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Matt Amerige on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>



@interface FISJukeboxViewController ()

@property (strong, nonatomic) FISPlaylist *playlist;

@property (weak, nonatomic) IBOutlet UITextField *songNumberTextField;
@property (weak, nonatomic) IBOutlet UITextView *songsTextView;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.playlist = [[FISPlaylist alloc ] init];
	self.songsTextView.text = self.playlist.text;
}

- (IBAction)_playButtonTapped:(id)sender
{
	NSUInteger input = self.songNumberTextField.text.integerValue;
	
	if (![self _isNumber:self.songNumberTextField.text] ||
			input > self.playlist.songs.count ||
			input < 1) {
		self.songNumberTextField.text = @"";
		NSLog(@"INVALID INPUT. Input must be a number that is between 1 and the number of songs in the playlist");
		return;
	}
	
	// subtracting 1 to account for 0-based array
	FISSong *song = self.playlist.songs[input - 1];
	
	NSLog(@"Song:\n %@", song);
	[self setUpAVAudioPlayerWithFileName:song.fileName];
	[self.audioPlayer play];
}

- (IBAction)_stopButtonTapped:(id)sender
{
	[self.audioPlayer stop];
}

- (IBAction)_titleButtonTapped:(id)sender
{
	[self.playlist sortSongsByTitle];
	self.songsTextView.text = self.playlist.text;
}

- (IBAction)_artistButtonTapped:(id)sender
{
	[self.playlist sortSongsByArtist];
	self.songsTextView.text = self.playlist.text;
}

- (IBAction)_albumButtonTapped:(id)sender
{
	[self.playlist sortSongsByAlbum];
	self.songsTextView.text = self.playlist.text;
}


- (BOOL)_isNumber:(NSString *)maybeNumber
{
	NSCharacterSet *badCharacterSet = [NSCharacterSet decimalDigitCharacterSet].invertedSet;
	
	NSRange alphabetRange = [maybeNumber rangeOfCharacterFromSet:badCharacterSet];
	
	if (alphabetRange.location == NSNotFound && alphabetRange.length == 0) {
		return YES;
	}
	
	return NO;
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
	NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
	NSError *error = nil;
	self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	if (!self.audioPlayer)
	{
		NSLog(@"Error in audioPlayer: %@",
					[error localizedDescription]);
	} else {
		[self.audioPlayer prepareToPlay];
	}
}


@end
