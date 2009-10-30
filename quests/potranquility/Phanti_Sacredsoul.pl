sub EVENT_SPAWN
{
	quest::settimer("try_sit", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_sit");
}

sub EVENT_SAY
{
	if($text=~/Hail/i)
	{
		quest::say("Oh, hello. I am sorry, I did not see you approach. I have been giving all of my attention to poor [Phanti] here.");
	}
	elsif($text=~/Phanti/i)
	{
		quest::say("A few days ago Phanti started to get very ill, while she was preparing herself for another trip into [Saryrn's domain]. We are not sure exactly was caused her to fall into this malaise, although we do have our [suspicions].");
	}
	elsif($text=~/Saryrn's domain/i)
	{
		quest::say("Torment, the Plane of Pain. She was doing some research on the denizens there, should you [help] us, I could grant you and your companions entry. The key will not do Phanti any good for quite some time.");
	}
	elsif($text=~/Help/i || $text=~/Suspicions/i)
	{
		quest::say("Recently, the portal from the Plane of Disease has been unusually active. People have been reporting strange sounds from around the portal at night, and a few of our trackers have seen strange, almost rodent like, footprints. Our best guess is that one of the denizens of the Plane of Disease managed to make its way into our plane. If this is true, it may explain the unnaturally quick manifestation of the disease. Perhaps, the bile from one of the rodents will help us learn of the cause, and hopefully a cure.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 29315 => 1))
	{
		quest::emote("pours the bile into a small flask, there is a puff of green smoke, which turns white as it floats into the sky. 'This is good news. It appears that this is the cause for her disease, but I have neither the tools, nor the knowledge to create a cure. There is rumor of an indigo orc who may prove useful to us in this area, but he is imprisoned in the Plane of Justice. Ask him about rare diseases. He was known to have cured many, prior to his imprisonment.");
		$client->SummonItem(29302);
	}
	
	if(plugin::check_handin(\%itemcount, 29302 => 1, 29295 => 1))
	{
		quest::say("Hmm, it looks like I will need both the cure and the purified bile in order to heal Phanti.");
		my @grp = plugin::GetGroupMembers($client);
		foreach $ent (@grp)
		{
			if($ent)
			{
				if(!$ent->KeyRingCheck(29213))
				{
					my $char_id = $ent->CharacterID();
					$ent->KeyRingAdd(29213);
					$ent->SummonItem(29213);
					quest::targlobal("pop_alt_access_potorment", "1", "F", 0, $char_id, 0);
				}
			}
		}
	}
}