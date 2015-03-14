 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Jurrock
## ID: 336095
## ZONE: dranik
##
############################################

sub EVENT_SAY
{
	if($faction <= 2)
		{
		if($text=~/hail/i)
			{
			quest::say("Honor to you and yours, stranger. It has been a long time since we have had a visitor as helpful as you. Perhaps after what you have done you would consider doing just a bit more. If you were willing, I would ask a [favor] or two of you.");
			}
		if($text=~/favor/i)
			{
			quest::say("Since the coming of Mata Muram and his legion, I have suffered through much that I wish had never happened. Not only have I seen my brethren and friends fighting amongst themselves, I have also seen the fall of my beloved city to an evil conqueror. When the Muramites came through Dranik, they had no remorse about sacking homes along their way and taking whatever they could get their hands on. Several of my most treasured [possessions] were lost in this fashion.");
			}
		if($text=~/possessions/i)
			{
			quest::say("Throughout my life I have collected a large array of items. As time goes on I have come to realize that the knowledge I have accumulated through my many years is more valuable than all of those possessions. In light of this I would like to pass my knowledge on to future generations. There were several [items] in my home that I had planned to use to help in this endeavor.");
			}
		if($text=~/items/i)
			{
			quest::say("I had several [tapestries] that hung on my walls depicting various moments of dragorn history. I had looked forward to telling the stories of those scenes to all who chose to view them. I also had an extensive library in my home filled with all manner of books. There were [four] that are the most important in these times though.");
			}
		if($text=~/four/i)
			{
			quest::say("The four I am referring to were volumes of a detailed encyclopedia of the history of the dragorn people. It recorded all of the important and legendary events from the fall of Dranik to the beginning of The Darkening. If these were returned it would help ensure the knowledge they contain is not lost forever.");
			}
		if($text=~/Tapestries/i)
			{
			quest::say("There were three all together in my home. One was an enormous work of art showing the father Dranik giving life to the dragorn people. It was wondrous and inspiring to behold. The second tapestry was of a beautiful waterfall and stream found deep in the mountains of Kuua. Even though it was just a picture, it exuded an undeniable sense of peace. The third tapestry was of one of my favorite dragorn heroes, Jayruk the Hunter. It showed Jayruk standing over the corpses of his favorite kill, the bazu. If you could return these to me I would be inexpressibly grateful to you.");
			}
		}
	else
		{
		quest::emote("does not respond to you."); #made up from memory
		}
}

sub EVENT_ITEM
{
	if($faction <= 2)
		{
		if (plugin::check_handin(\%itemcount, 36520 => 1, 36518 => 1, 36517 => 1, 36519 => 1)) #turn in from jurrocks books
			{
			quest::say("The glory of Dranik upon you! I cannot tell you what this means to me. Here you must take this earring as payment for your help. It has been in my family for generations, but I believe my ancestors would like you to have it."); #Text borrowed from ring turn in as this text not available
			quest::faction(410,1); #dranik loyalists
			quest::faction(432,-3); #overlord mata muram
			quest::exp(100000);
				if($class eq "Warrior" || $class eq "Paladin" || $class eq "ShadowKnight" || $class eq "Monk" || $class eq "Bard" || $class eq "Rogue" || $class eq "Ranger" || $class eq "Beastlord" || $class eq "Berserker")
					{
					quest::summonitem(71145); #Gilded Earring of Travels
					}
				if($class eq "Cleric" || $class eq "Druid" || $class eq "Shaman" || $class eq "Magician" || $class eq "Enchanter" || $class eq "Wizard" || $class eq "Necromancer")
					{
					quest::summonitem(71146);
 #Beaded Earring of Travels

					}
			}
		if(plugin::check_handin(\%itemcount, 36516 => 1, 36515 => 1, 36514 => 1)) #turn in for jurrocks tapestries
			{
			quest::say("The glory of Dranik upon you! I cannot tell you what this means to me. Here you must take this ring as payment for your help. It has been in my family for generations, but I believe my ancestors would like you to have it.");
			quest::faction(410,1); #dranik loyalists
			quest::faction(432,-3); #overlord mata muram
			quest::exp(100000);
				if($class eq "Warrior" || $class eq "Paladin" || $class eq "ShadowKnight" || $class eq "Monk" || $class eq "Bard" || $class eq "Rogue" || $class eq "Ranger" || $class eq "Beastlord" || $class eq "Berserker")
					{
					quest::summonitem(71143); #Dragorn Engraved Platinum Ring
					}
				if($class eq "Cleric" || $class eq "Druid" || $class eq "Shaman" || $class eq "Magician" || $class eq "Enchanter" || $class eq "Wizard" || $class eq "Necromancer")
					{
					quest::summonitem(71144);
 #Dragorn Runed Platinum Ring
					}
			}
		}
		plugin::return_items(\%itemcount);
}
#END of FILE