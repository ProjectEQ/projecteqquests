 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Trelak
## ID: 300040
## ZONE: wallofslaughter
##
############################################

sub EVENT_SAY
{
	if($faction <= 1)	#must be ally to do the quest
		{
		if($text=~/hail/i)
			{
			quest::me("Greetings stranger. What can I, Trelak do for you? Surely you are the strangers that I have heard whispers about . . . the ones that have struck back against our enemies? Perhaps we can aid each other? I am an armor smith that has crafted many fine pieces for the more prestigious officers in the dragorn militia. Many of these pieces have unique magical qualities that I crafted into them. If you are [willing] to recover them, I can recapture most of this magic and create new pieces for you.");
			}
		if($text=~/I am willing/i)
			{
			quest::say("Good, very good. When The Darkening came upon us, I could see by the ferocity and viciousness of the invaders that they would not be easy to defeat. So I took as much as I could and hid out here preparing for the time when our warriors would have need of me. If you help me, I will craft superior pieces of plate armor fit for our mightiest fighters for you. I can provide a [helm], [sleeves], [bracers], a pair of [gloves], a [breastplate], some [leggings], and a pair of [boots].");
			}
		if($text=~/helm/i)
			{
			quest::say("Before I can make you a plate helm worthy of Makyah himself, I will need you to bring me some food. I was so busy with taking all of my tools that I did not have time to stock myself with enough sustenance to see me through this ordeal. From time to time I have seen kvy archers eating from a small food sack. I think if you bring me two of these sacks I can continue my work for quite awhile. Your main task though will be to bring me a certain piece of metal I have long had my eye on. There was a certain dragorn elder by the named of Patorav, a wiser and kinder noble did not exist. Wherever he went, he always carried with him a fine [walking stick].");
			}
		if($text=~/sleeves/i)
			{
			quest::say("Though I managed to bring nearly all of my tools before the Muramites overran our lands, I did forget to bring the enchanted tongs my mentor gave me. I secretly returned only to watch the Muramites destroy my shop and steal what was left. I saw the leader of this pack of dark thieves place my tongs in an embossed leather sack . . . Which was probably stolen as well. I want you to bring me this sack so I may retrieve my tongs and perhaps other possessions he stole from me. I also want you to repay those brutes for wrecking my shop and home. Bring me back two noc right hands so I know they will no longer steal from me or my people ever again.");
			}
		if($text=~/bracers/i)
			{
			quest::say("As a smith I am always looking for new materials and techniques to improve my craft. Many times we come across objects that are highly magical in nature and often we are able to capture this mystical essence and reuse it for our own purposes. The riftseekers have something I very much want. It was these very same beings that betrayed my people to the Muramites, but that is not important now. I know that the riftseeker's heart is not akin to a heart that beats within you or me. It is magical. Find and bring me one of those hearts. Your must also bring me two large pieces of Kuuan Ore as my stock is running a bit low. Return with these and I will make you a bracer much like the ones dragorn warriors wear into battle.");
			}
		if($text=~/gloves/i)
			{
			quest::say("One of my people's most famous warriors was Makyah the Fierce, who had no equal when it came to the battle arts. Enemies would routinely pause momentarily when he strode upon the field. After the portal exploded though, no trace of Makyah was found. I am more interested in his axe though, which may yet hold salvation for my people. It is my hope that the enchantments and techniques used to create the axe might be used for other purposes. Find and return Makyah's axe to me so I may use it to help my people. To remove the enchantments properly though, I will also need two yearning crystals. With the proper ceremony, gems such as these can be used to transfer charms from one object to another. Come back when you have recovered these and I will give you a pair of gloves that I was crafting in honor of a dragorn elder.");
			}
		if($text=~/breastplate/i)
			{
			quest::say("Many good friends and loved ones perished in the invasion. One of my good friends was a famous hunter, Jayruk. He and I went on many hunting expeditions together protecting our lands from some of the more wild and dangerous beasts. I was not skilled enough to take care of a bazu mind you, but at least I could remove the threat of a few murkgliders. Jayruk, however, had no equal. I could regale you for hours of tales of how he narrowly escaped death, but I shan't waste time. Simply know that I wish to pay my respects to my good friend and for this I require the hunting vest he so loved. I will also need three dragorn ceremonial candles too. Return to me with the vest and the three candles and I will give you a plate breastplate that I was crafting for myself.");
			}
		if($text=~/leggings/i)
			{
			quest::say("When I tried to go back to my shop to retrieve my tongs, I found it overrun with a mob of thieving Muramites. At that moment I, a mere smith, vowed revenge for destroying what it took me a lifetime to build. I did not know how or when I would accomplish this until I crossed paths with you. You will be my instrument, exacting the revenge I cannot achieve on my own. Find the leader of this particular group of Muramites and repay it ten fold. Return to me with the medal it smugly wore -- a medal it no doubt stole from some other hapless dragorn. You also must bring me three blackened discordling tails as proof that the rest of this group has been slain as well. Do this and I will give you a pair of plate leggings that I have been working on for some time now.");
			}
		if($text=~/boots/i)
			{
			quest::say("As much of my customers were dragorn warriors, over time I came to befriend many of them. Though most of them perished during the fighting, some were captured by the Muramites and tormented in their Proving Grounds. This was once a serene place where our elders would meditate . . . A place of peace and tranquility that my people looked toward Dranik's spirit for guidance. Now it is a place inhabited by the foulest horrors where resistant dragorns are tortured. One such dragorn was a noble warrior named Ethask. Thrown into the labyrinth unarmed, he fought off a horde of discordlings and kyvs, breaking their bodies with his bare hands. Seriously wounded, he still managed to find an exit through sheer force of will. Just as he was about to exit that black pit, a soaring [Muramite] cowardly struck him down from behind. Mortally wounded with the axe still lodged between his shoulders, Ethask crawled through the exit only to perish on the other side.");
			}
		if($text=~/walking stick/i)
			{
			quest::say("This was no ordinary walking stick. The top held a jewel of some mystery for I would always see Patorav whispering to it, but I am more interested in the bottom tip, for it you see was sheathed in a strange metal. I witnessed Patorav striking the ground with the tip only to see it penetrate any surface it encountered. The hardest stone, the most durable metal, nothing could withstand his walking stick. Thus, I have always held an interest in it as the enchantments contained therein may prove to be beneficial to my craft. Though Patorav fell during the noble's march through the causeway, his stick may yet exist. Find it and bring it back with the food and I'll reward you.");
			}
		if($text=~/muramite/i)
			{
			quest::say("I know little of this particular Muramite save that he received a medal for his dastardly deeds. Find and slay this Muramite so the spirit of Ethask may find the peace it longs for. Return once you have done this with the Muramite Cruelty Medal as proof that this monster shall trouble my people no more. Also bring me two kyv hunter rings to celebrate Ethask's victories.");
			}
		}
	else
		{
		quest::emote("does not respond to you."); #made up text
		}
		}

sub EVENT_ITEM
{
	if($faction <= 1) #must be ally to do this quest
	{
	if (plugin::check_handin(\%itemcount, 51475 >= 1, 51482 >= 2)) #helm
		{
		quest::emote("reaches out hungrily for the food sacks and the walking stick. 'Yes, this is Patorav's. I would recognize it anywhere. You can see just by looking at the metal that it hides some source of power. Why its appearance alone... how the metal looks as if it is reflecting moving storm clouds... fascinating. I most graciously thank you for this and the sacks of food. I had nearly finished this plate helm for a customer of mine, but I have heard he met a valiant end at the wall. Wear it honorably as he would have.");
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70853);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70867);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70881);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70902);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70860);
				}
				}
	if (plugin::check_handin(\%itemcount, 51479 >= 1, 51486 >= 2)) #sleeves
		{
		quest::emote("takes the items from you before handing you your reward."); #made up
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70854);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70868);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70882);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70903);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70861);
				}
				}
	if (plugin::check_handin(\%itemcount, 51480 >= 1, 51487 >= 2)) #bracers
		{
		quest::emote("widens his eyes as you hand him the riftseeker heart. As you hand it to him, his eyes fix on the small pulsing light within the center of the gem. 'Yes, I am sure I can make good use of this. You have done well. And these pieces of ore will help replenish my supply. For your hard work, here is the plate bracer I spoke of earlier.");
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70855);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70869);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70883);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70904);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70862);
				}
				}
	if (plugin::check_handin(\%itemcount, 51481 >= 1, 51488 >= 2)) #gloves
		{
		quest::emote("holds the axe up and begins to take a few mighty swings through the air in front of him. 'Yes, the axe of the fierce one himself. It will be a shame to remove some of these enchantments, but I am sure I can put them to better use for my people. I will use the two crystals you have just given me to safely remove some of the charms within the axe and put them in some of my newer designs. Here are the plate gloves I spoke of earlier.");
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70856);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70870);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70884);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70905);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70863);
				}
				}
	if (plugin::check_handin(\%itemcount, 51476 >= 1, 51483 >= 3)) #breastplate
		{
		quest::emote("takes the items from you before handing you your reward."); #made up
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70858);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70872);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70886);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70907);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70865);
				}
				}
	if (plugin::check_handin(\%itemcount, 51477 >= 1, 51484 >= 3)) #leggings
		{
		quest::emote("takes the items from you before handing you your reward."); #made up
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70859);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70873);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70887);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70908);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70866);
				}
				}
	if (plugin::check_handin(\%itemcount, 51478 >= 1, 51485 >= 2)) #boots
		{
		quest::emote("takes the items from you before handing you your reward."); #made up
		quest::exp(100000);
			if($class eq "Warrior")
				{
				quest::summonitem(70857);
				}
			if($class eq "Paladin")
				{
				quest::summonitem(70871);
				}
			if($class eq "ShadowKnight")
				{
				quest::summonitem(70885);
				}
			if($class eq "Bard")
				{
				quest::summonitem(70906);
				}
			if($class eq "Cleric")
				{
				quest::summonitem(70864);
				}
		}
	else
		{
		plugin::return_items(\%itemcount);
		quest::say("I am sorry $name, but these are not the items i was looking for."); #made up text
    		}
    		}
	else
		{
		plugin::return_items(\%itemcount);
		quest::emote("returns the items to you without responding."); #made up text
		}
}
#END of FILE