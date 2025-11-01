sub EVENT_SAY {
    my $aabuy = 25; # This is the cost of each doubloon. Change this number to how many AAs you want each one to cost.
	my $aasell = 25; # This is how many AAs you get back for trading a single(up to 4 below) doubloon to this npc.
    my $aaint = $client->GetAAPoints();

    if ($text=~/Hail/i && $aaint >= $aabuy) {
        plugin::Whisper("Ye be welcome $name, would ye like to " . quest::saylink("buy") . " a doubloon fer the low, low price o' $aabuy AA points today? You can trade these back in for 25 AA points by handing me a doubloon.  Make sure to hand them to me one at a time, since I can't count so well");
    } 
        
	if ($text=~/Buy/i && $aaint >= $aabuy) {
		$client->AddAAPoints(-$aabuy);
		quest::summonitem(79910); # Item: Douhbloon
#		quest::summonitem(79910); you can add more of these lines to increase how many doubloons you get
		}
		
     elsif($text=~/Hail/i && $aaint < $aabuy) {
         plugin::Whisper("Ye dun 'ave enough AA points to exchange'em fer a single doubloon. Get back `ere when ye 'ave atleast $aabuy AA points!");
    }
}

sub EVENT_ITEM
{
	my $aasell = 25; # This is how many AAs you get back for trading a single(up to 4 below) doubloon to this npc.
	if(plugin::check_handin(\%itemcount, 79910 => 1)) # Doubloon # Adjust this 1 to up to a 4 to increase how many doubloons it takes to get AAs back.
	{
		$client->AddAAPoints($aasell);
		plugin::Whisper("Thank ye fer yer patronage!");
	}
}
