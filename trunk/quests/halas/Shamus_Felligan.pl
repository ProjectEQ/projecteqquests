 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Shamus Felligan
## ID: 29070
## ZONE: halas
##
############################################

my $randomspell = quest::chooserandom(15270,15275,15075,15271,15279,15212,15079);
# : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : In that order

sub EVENT_SAY 
{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetin's! Justice speaks through us. We're the followers o' the Tribunal. We act as judge. jury and executioner fer all misled Northmen. Sometimes we must also execute our swift justice upon evil races. such as th' [ice goblins].");
		}
	if($text=~/what ice goblins/i)
		{
		quest::say("The ice goblins are a weak race. They pose no threat to our community. but lately we've heard rumors of ice goblins that can cast spells. They're said to be as weak as the goblin warriors. so I seek to employ the talents of our young shamans to [hunt the goblin casters].");
		}
	if($text=~/i will hunt the goblin casters/i)
		{
		quest::say("Aye. ye'll serve justice.  I must find the source o' their recent spellcasting ability.  I hear reports o' glowing necklaces upon these wicked beasts' necks. Get me one o' these casters' necklaces. Return them in any condition at all. Go! Justice awaits yer return."); 
		}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 13968 == 1)) #Shattered Caster Beads
    		{
		quest::say("Yes thankyou. This was exactly what i was after, maybe a little battered, but worth a little something none-the-less.");
		quest::exp(1600);
		quest::ding();
		quest::faction(213,2); #Merchants of Halas
		quest::faction(294,2); #Shamen of Justice
		quest::faction(33,-3); #Circle of Unseen Hands
		quest::faction(48,-3); #Coalition of Tradefolk Underground
		quest::faction(137,-3); #Hall of the Ebon Mask
			if($class eq "Shaman" || $class eq "Beastlord")
				{
				quest::summonitem($randomspell,1); #A Random Spell Listed Above
				}
		}
	if(plugin::check_handin(\%itemcount, 13969 == 1)) #Caster Beads
		{
		quest::say("Yes thankyou. This was exactly what i was after, and in pristine condition ta boot, Take this for your efforts.");
		quest::exp(6400);
		quest::ding();
		quest::faction(213,6); #Merchants of Halas
		quest::faction(294,6); #Shamen of Justice
		quest::faction(33,-9); #Circle of Unseen Hands
		quest::faction(48,-9); #Coalition of Tradefolk Underground
		quest::faction(137,-9); #Hall of the Ebon Mask
			if($class eq "Shaman" || $class eq "Beastlord")
				{
				quest::summonitem(6028); #Gavel of Justice
				}
		}
  else { 
    quest::say("Why do ye give me these items?"); 
    plugin::return_items(\%itemcount); 
  } 
}

#EoF