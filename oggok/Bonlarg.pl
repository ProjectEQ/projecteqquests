# items: 12198, 13527, 12199
sub EVENT_SAY 
	{
	my $sf=$client->GetModCharacterFactionLevel(261); # Faction: Green Blood Knights

	if($text=~/Hail/i)
		{
		quest::say("Shadowknight master me be!!  $name prove to me that $name be worthy to be one with Greenblood and me give $name black shadow tunic.  You [want black shadow tunic]?");
		}
	elsif($sf < 201)
		{
		quest::say("Help Greenbloods you will. Give lizard tails to Grevak.  Den maybe we trust."); 
		}
	elsif ($text=~/i want black shadow tunic/i)
		{
		quest::say("You hunt lizard scouts.  Them sometimes carry special fife to talk to other lizards far away.  Greenbloods stop them.  Bring Bonlarg three lizard scout fifes and green stained skin tunic you gots when you first talk to Soonog.  Give all to Bonlarg and get tunic.");
		}
	}

sub EVENT_ITEM 
	{
	if  (plugin::check_handin(\%itemcount, 12198 => 3,  13527 => 1))
		{
		quest::say("Took you long time! It easy task, but me guess you still earn black shadow tunic. You wear to show all that you young shadowknight. It help you be smarter likes Bonlarg. It only for young Greenblood shadowknight. Maybe later green shadow tunic you earn or maybe dead you be!");
		quest::summonitem("12199");
		quest::exp("231");
		quest::ding();
		quest::faction(228,"1");  # Increase faction -- Clurg
		quest::faction(261,"1");# Increase faction -- Greenblood Knights
		quest::faction(308,"-5");# Decrease faction -- Shadowknights of Night
		quest::faction(312,"-2");# Decrease faction -- Storm Guard
		} 
		
	#do all other handins first with plugin, then let it do disciplines
  	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:oggok  ID:49033 -- Bonlarg 
