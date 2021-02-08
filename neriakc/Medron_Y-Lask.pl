# items: 19571, 16170, 19610
sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the Furrier Royale. Here you will find the finest skins from a variety of Norraths lesser creatures.");
		plugin::DoAnim("salute");
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 19571=> 1, 16170 => 2)) 
		{
		quest::emote("Medron Y`Lask stretches and fastened the basilisk skins across the shield frame and attaches a leather strap and grip to the back of the shield. Here is your new shield young Shadowknight. I have been paid in advance by the Lodge of the Dead for the shields assembly. May Innoruuk strengthen you in your service to Her Majesty Queen Cristanos.");
		quest::summonitem(19610); # Item: Scaled Femur Shield
		quest::exp(1000);
		quest::ding();
		quest::faction(236,5); # Dark Bargainers
		quest::faction(370,1); #Dreadguard Inner
		quest::faction(334,1); #Dreadguard Outer
		}
	}
#END of FILE Zone:neriakc  ID:42060 -- Medron_Y`Lask 

