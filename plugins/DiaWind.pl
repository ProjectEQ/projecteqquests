#::: Author: Akkadius
#::: This plugin can work as an extensive drop in replacement for quest::say
#::: This plugin also offers extensive options for easily formatting windows. 
#::: Usage: plugin::DiaWind("Window text");
#::: For explanation of use, see: http://wiki.eqemulator.org/p?The_DiaWind_Plugin&frm=Perl_Plugins_Master_Reference

sub DiaWind { 
	my $Text = $_[0]; my $npc = plugin::val('$npc'); $client = plugin::val('$client'); $name = plugin::val('$name');
    my $Opt = 0;
	if(!$PopId){ $PopId = 999; } 
	$Text=~ s/~/<\/c>/g;
	$Text=~ s/\{y\}/<c \"#CCFF33\">/g;
	$Text=~ s/\{lb\}/<c \"#00FFFF\">/g;
	$Text=~ s/\{r}/<c \"#FF0000\">/g;
	$Text=~ s/\{g}/<c \"#00FF00\">/g;
	$Text=~ s/\{gold}/<c \"#FFFF66\">/g;
	$Text=~ s/\{orange}/<c \"#FFA500\">/g;
	$Text=~ s/\{gray}/<c \"#808080\">/g;
	$Text=~ s/\{tan}/<c \"#daa520\">/g;
	$Text=~ s/\{bullet}/•/g;
	$Text=~ s/\$name/$name/g;
	$Text=~ s/\{linebreak}/--------------------------------------------------------------------/g;
	$Text=~ s/\{rowpad}/<tr><td>{tdpad}<\/td><td>{tdpad}<\/td><\/tr>/g; 
	$Text=~ s/\{tdpad}/----------------------/g; 
	$Text=~ s/\{in}/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/g;
	my ($mvoice) = $Text =~ s/mysterious//g;
	my ($achievement) = $Text =~ s/achievement//g;
	my ($noquotes) = $Text =~ s/noquotes//g; if($noquotes){ $quo = ""; } else{ $quo = "'"; }
	my ($nobracket) = $Text =~ s/nobracket//g;
	my ($nosound) = $Text =~ s/nosound//g;
	my ($cname) = $Text =~ /{(.*)\>/; $Text =~ s/{$cname\>//g;
	if(!$nobracket){
		($bracket) = $Text =~ /\[([^\]]+)\].*/;
		($bracket2) = $Text =~ /\[(.*)\>/;
	}

	my ($anim) = $Text =~ /\+(.*)\+/; $Text=~ s/\+$anim\+//g;
	my ($Timer) = $Text =~ /\=(.*)\=/; $Text=~ s/\=$Timer\=//g;
	my $response = ""; my $ClickQueue = ""; my $Options = "";
	my @popupid = $Text =~ /popupid\:(\d+)/g;
	if($popupid[0]){ $PopId = $popupid[0]; my $string = "popupid:" . $popupid[0]; $Text=~ s/$string//g; }
	my @wintype = $Text =~ /wintype\:(\d+)/g;
	if($wintype[0]){ if($wintype[0] == 1){ $Opt = 1; }; my $string = "wintype:" . $wintype[0]; $Text=~ s/$string//g; }
	if(!$nobracket){
		if($bracket){ $response = $bracket; 	}
		if($bracket2){ $response = $bracket2; 	}
		@data = ($Text =~ m/\[([^\]]+)\]/g);
		foreach $val (@data){ $Options .= "" . quest::saylink($val, 1) . " - ";}
		if($data[1]){ $client->Message(15, " --- Select Response from Options --- "); $client->Message(0, "[" . substr ($Options, 0, -3) . "]"); }
	}
	if($anim){ if($anim > 0){ quest::doanim($anim); } else{ plugin::DoAnim($anim);} }
	my $string = quotemeta("[" . $bracket2 . ">"); $Text=~ s/$string//g;
	if($Timer > 0){ $ClickQueue = "<c \"#F07F00\">This message will disappear in " . $Timer . " second(s)...</c>"; }
	elsif($response ne ""){ $client->SetEntityVariable("npcresponse", $response); 
		if($Opt == 1){ $ClickQueue = "<c \"#F07F00\">Click 'Yes' to continue'...</c>"; }
		else{ $ClickQueue = "<c \"#F07F00\">Click 'OK' to respond with '" . $response . "'...</c>"; }
	}else{ $client->SetEntityVariable("npcresponse", ""); 
		if($Opt == 1){ $ClickQueue = "<c \"#F07F00\">Click 'Yes' to continue'...</c>";}
		else{ $ClickQueue = "<c \"#F07F00\">Click 'OK' to continue...</c>"; }
	}
	if($achievement){} elsif($cname){ $Speaking = $cname . " says"; } elsif($mvoice){ $Speaking = "A Mysterious Voice says"; } else{ if($npc){ $Speaking = $npc->GetCleanName() . ' says'; } }
	if($achievement){ $Title = "New Achievment!"; } else{ $Title = "Dialogue: " . $Speaking; }
	if($achievement){ $Timer = 5; quest::popup($Title,  $Text . "" . $ClickQueue . "", $PopId, $Opt, $Timer); }
	else{ quest::popup($Title,  "<c \"#CCFF33\">" . $Speaking . "</c><br><br>" . $quo . "" . $Text . "" . $quo . "" . "<br><br>" . $ClickQueue . "", $PopId, $Opt, $Timer); }
	$PopId = undef; $achievement = undef;
} 

#::: Used for include of EVENT_POPUPRESPONSE
#::: http://wiki.eqemulator.org/p?The_DiaWind_Plugin#to-activate-this-plugin
sub DiaWind_Process_Response{
	my $popupid = plugin::val('$popupid');
	my $client = plugin::val('$client');
	if($popupid == 999){
		my $nresponse = $client->GetEntityVariable("npcresponse");
		if($Debug){ $client->Message(15, "Debug Silent Message: '" . $nresponse . "'"); }
		if($nresponse ne ""){ $client->SilentMessage($nresponse); } return;
	}
}