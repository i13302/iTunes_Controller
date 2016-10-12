use strict;
use warnings;

use Win32::OLE;
use Win32::Clipboard;

my $clip=Win32::Clipboard();
my $itunes =Win32::OLE->new("iTunes.Application") or die "iTunes�I�u�W�F�N�g���쐬�ł��܂���B";

my $track = $itunes->CurrentTrack;

if($track eq ''){
	printf "not playing";
	exit 1;
} 

#printf "Album : %s\n", $track->Album;
#printf "Artist: %s\n", $track->Artist;
#printf "Name  : %s\n", $track->Name;
#printf "Time  : %s\n", $track->Time;

my $text=sprintf("
	#nowplaying \n 
	Title \"%s\"\n 
	Album \"%s\"\n 
	Artist \"%s\"",$track->Name ,$track->Album,$track->Artist);


$clip->Set($text);

print "Copyed to Clipboard !\n";