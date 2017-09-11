#######################################################
#::: Author:					Akkadius
#::: Updated: 					4-18-2014
#::: FILE:						MP3.pl
#::: DESCRIPTION:				This plugin utilizes a database full of the EverQuest sound files and their lengths to utilize sound looping and other features
#::: Required Perl Modules:		DBI (MySQL) connectivity
#::: Required Plugins:			plugin::LoadMysql()
#::: Wiki: 						http://wiki.eqemulator.org/p?Perl_Plugins_Master_Reference#pluginu-mp3
######################################################

sub U_MP3{
	$client = plugin::val('$client');
	my $qglobals = plugin::var('qglobals');
	$connect = plugin::LoadMysql();
	$query_handle = $connect->prepare("SELECT `length` FROM `cust_sound_files` WHERE `filename` = '" . $_[0] . "'"); $query_handle->execute();
	while(@row = $query_handle->fetchrow_array()){ 
		if($qglobals->{$client->GetIP() . "_soundplay"} < time() || $_[1]{"interrupt"} == 1){
			$client->Message(15, "Play again... Duration " . $row[0] . " seconds... File " . $_[0] . "");
			if($_[1]{"interrupt"} == 1){ $client->PlayMP3(""); }
			if($_[1]{"delay_repeat"}){ $delay = $_[1]{"delay_repeat"}; } else { $delay = 1; }
			
			if($_[1]{"repeat_on_end"} == 1){ 
				quest::settimer("repeat_sound_file", $row[0] + $delay); 
				quest::setglobal($client->GetIP() . "_soundplay", ($row[0] + time()), 7, 'S3600');
				$client->PlayMP3($_[0]);
				$client->SetEntityVariable("sound_repeat", $_[0]);
			}
		}
		else{ $client->Message(15, "Not time to play again... " . ($qglobals->{$client->GetIP() . "_soundplay"} - time()) . " seconds left..."); }
	}		
}