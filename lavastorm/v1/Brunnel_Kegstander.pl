# items: 7882, 7885, 7886, 7888, 7889, 7890, 7891, 7892, 7893, 7894, 7895, 7896, 7897, 7898, 7899, 7900, 7901
sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("ello there. I set sail from me home on a quest and I be happy to report I've had me a bit o' success! I found me the secret to making [Forged Firebrand Weapons]. It's me own secret though and I ain't tellin");
		}

	if($text=~/forged firebrand weapons/i) 
		{
		quest::say("Oh, I'll tell ye about them that's for sure! They have in 'em the very power of fire! I'm a brewer by trade that's for sure but I decided to take up smithin' as me livelihood after I came across the secret. It's me own secret by the way. Think ye'd be willin' to do a [bit of trading] with me?");
		}

	if($text=~/bit of trading/i) 
		{
		quest::say("Well that's a might nice of ye! Ye bring me a Fiery Ore, some Imp Blood and an Essence of Fire. I uh. . . I just like collectin' them things, they have nuthin to do with me recipe. Anyway, I'll trade ye fer whatever weapon I have.");
		}

	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 7882 => 1, 7885 => 1, 7886 =>1))  # fiery ore, imp blood, essence of fire
		{
		quest::say("Well Brell bless ya! These are great, here take this one.");
    	quest::summonitem(quest::ChooseRandom(7888,7889,7890,7891,7892,7893,7894,7895,7896,7897,7898,7899,7900,7901)); #Random Forged Firebrand Weapon
    	quest::ding();
		}

	else 
		{
		quest::say("I have no use for this, $name.");
		plugin::return_items(\%itemcount);
		}
	}
