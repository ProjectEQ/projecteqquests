sub EVENT_SAY {
	if($text=~/hail/i) 
	{
		quest::emote("continues to chant towards the altar as you approach. 'If you are in need of our aid speak to the disciple and bring me one of the soulstones that he sells. I must continue to delve into the twilight of our world in search of lost souls.'");
		
	}
}

sub EVENT_ITEM {
$failure = "This focus is not powerful enough to summon the remnants of your former self.  The disciple of Luclin can help you select an appropriate focus.";


	if(plugin::check_handin(\%itemcount, 76013 => 1)) #Minor Soulstone
	{
		if ($ulevel < 21)
		{
			EVENT_SUMMON();
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76013);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76014 => 1)) #Lesser Soulstone
	{
		if ($ulevel < 31)
		{
			EVENT_SUMMON();
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76014);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76015 => 1)) #Soulstone
	{
		if ($ulevel < 41)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76015);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76016 => 1)) #Greater Soulstone
	{
		if ($ulevel < 51)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76016);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76017 => 1)) #Faceted Soulstone
	{
		if ($ulevel < 56)
		{
			EVENT_SUMMON();
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76017);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76018 => 1)) #Pristine Soulstone
	{
		if ($ulevel < 71)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76018);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76019 => 1)) #Glowing Soulstone
	{
		if ($ulevel < 76)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76019);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76048 => 1)) #Prismatic Soulstone
	{
		if ($ulevel < 81)
		{
			EVENT_SUMMON();
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76048);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76065 => 1)) #Iridescent Soulstone
	{
		if ($ulevel < 86)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76065);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76274 => 1)) #Phantasmal Soulstone
	{
		if ($ulevel < 91)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76274);
		}
	}
	elsif(plugin::check_handin(\%itemcount, 76275 => 1)) #Luminous Soulstone
	{
		if ($ulevel < 96)
		{
			EVENT_SUMMON();	
		}
		else
		{
			quest::say($failure);
			quest::summonitem(76275);
		}
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_SUMMON {
$charid = $client->CharacterID();
$count = $client->GetCorpseCount();
# $corpse = quest::getplayerburiedcorpsecount($charid);
$x = $client->GetX();
$y = $client->GetY();
$z = $client->GetZ();
	
	if($count > 0)
	{
    		quest::summonallplayercorpses($charid,$x,$y,$z,0);

	}	
	quest::emote("takes your stone and places it on the altar. Shadows begin to drift across the floor and over the altar and finally onto the soulstone.  The priest's voice chants with intensity and is soon joined with several others as the shadows slowly coalesce into a wispy mass that feels familiar.  The two candles near the altar explode with light and there, before you, appears all that remains of your former life.");
}