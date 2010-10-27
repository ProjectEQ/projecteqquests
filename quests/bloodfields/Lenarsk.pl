 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Lenarsk
## ID: 301029
## ZONE: bloodfields
##
############################################

%rhead = ("Druid" => 70888, "Monk" => 70895, "Beastlord" => 70951);
%rchest = ("Druid" => 70893, "Monk" => 70900, "Beastlord" => 70956);
%rhands = ("Druid" => 70891, "Monk" => 70898, "Beastlord" => 70954);
%rlegs = ("Druid" => 70894, "Monk" => 70901, "Beastlord" => 70957);
%rarms = ("Druid" => 70889, "Monk" => 70896, "Beastlord" => 70952);
%rfeet = ("Druid" => 70892, "Monk" => 70899, "Beastlord" => 70955);
%rwrists = ("Druid" => 70890, "Monk" => 70897, "Beastlord" => 70953);

sub EVENT_SAY {
if($faction <= 1)	#must be warmly to do the quest
{
 if($text=~/hail/i)
	{
	quest::say("Hail to you stranger. Though I must be careful, I now know that you are sympathetic to our plight. I, Lenarsk, was a most-favored tailor to the nobles and famous hunters. They would come from far away seeking my shop, clamoring for my wares. But alas, the Muramites changed all of this when they infected our lands. Fate can be harsh at times. And yet here you are. Perhaps our mutual goals will encourage us to walk the same [path] together.");
	}
 if($text=~/path/i)
	{
	quest::say("By now it is apparent that I hold no favor toward those Muramites and I also know that you don't look upon them kindly either. Therefore, I have a proposition for you. I know that you alone will not be enough to rid our lands of these invaders, but any sorrow you can cause them will bring me unending joy. Help me in my cause to wound the Muramites and I will repay your courageous deeds with some of my unfulfilled [orders].");
	}
 if($text=~/orders/i)
	{
	quest::say("Why, as I said, customers from many lands would seek me out to create handsome one-of-a-kind pieces. I'm sure I still have a few of these left waiting for owners that will never arrive. Yes, I believe I have something for your [head], [arms], [wrists], [hands], [chest], [legs], and [feet]. I will give these to you if you help me.");
	}
 if($text=~/head/i)
	{
	quest::say("I have a wonderfully woven cap that was meant for the son of a noble. Alas, both father and son fell victim to the wicked Muramites and were forcibly marched through the causeway to their deaths. In exchange for the cap, I seek the walking stick of a certain dragorn elder that also perished during the march. I have heard rumors that the stick was enchanted such that were it to be lost it would find its way back to its owner. You must bring back Patorav's walking stick to me. Also, the Muramite guards that gleefully killed our leaders were given awards. Find me two Muramite Noble's March awards as well.");
	}
 if($text=~/arms/i)
	{
	quest::say("When the Muramites invaded, some took over my shop and either stole or destroyed everything. Why, I even lost a beautiful leather pouch I had been creating for one in my family. I can't stand the thought of that Muramite with a gift meant for a loved one. Please return this pouch to me so I know that my hard work did not benefit one as evil as a Muramite. I also ask of you to bring me back two spiked discordling collars so I know that at least some of those that destroyed my shop have been dealt with.");
	}
 if($text=~/wrists/i)
	{
	quest::say("Very little is known to us about the riftseekers. We do know they do wield powerful magic that can create portals that have appeared in our lands. I believe they are wholly creatures of magic. I have heard whispers that the heart of these beings is not the heart of a mundane beast. No, in fact, I have heard that their heart is pure magic. Bring me one of these hearts so I may find out if any of the magic within it may be used to enchant the pieces of leather raiment I create. In addition I am running low on quality feran hides so I will need you to bring me back a couple of those as well.");
	}
 if($text=~/hands/i)
	{
	quest::say("I have a pair of gloves that has the suppleness of leather, but the strength of iron! I am willing to part with these if you retrieve an artifact. Find the axe that was once wielded by Makyah the Fierce. Never did a more magnificent warrior stride the field of battle and when he was lost, so was a large portion of my people's hopes. Return the axe to me so that once my people see that it was found, we may find the hope and courage necessary to defeat our foes. You will also need to bring me two fine chimera hides so I may craft a sheath worthy of an axe wielded by a legend.");
	}
 if($text=~/chest/i)
	{
	quest::say("As celebrated as I am as a master crafter, my mentor was so much more. One of the last pieces he created before passing away was a vest for Jayruk the Hunter. Many times did Jayruk narrowly cheat death, not by the strength of spear or swiftness of bow, but by the sharpness of his mind. There was a time when a trap they laid for a pack of feral bazu failed to contain them. Enraged, the bazu began a charge toward some homes and would have surely decimated all in their path were it not for Jayruk's [quick thinking].");
	}
 if($text=~/quick thinking/i)
	{
	quest::say("He quickly managed to anger the lead bazu and trick the pack into following him. Blinded by rage, the pack charged after Jayruk as he led through them a narrow ravine. Hidden by brush was a long drop which Jayruk managed to avoid by deftly jumping to one side and clinging onto the cliff face as the bazu fell one by one to their demise. A few days later though, Jayruk disappeared without a trace. Find and return this vest so that I may study the technique that created it. In addition, to honor the memory of Jayruk, bring me three bracelets made out of bazu nails.");
	}
 if($text=~/legs/i)
	{
	quest::say("After our forces fell and the Muramites swept through our lands, they pillaged everything in sight. They stormed into my home and shop, stealing what they could and destroying everything else. One particularly nasty Muramite took great pleasure in the destruction of my home. I want you to seek it out and exact revenge. You will recognize him by an amulet he proudly wears. Return to me with this as proof that you have accomplished the task I have lain out for you. Three of the henchmen with this Muramite leader were disgusting discordlings that tormented me needlessly. See to it that this trio pays for their twisted deeds by also bringing me three discordling hooves.");
	}
 if($text=~/feet/i)
	{
	quest::say("I had a customer who was a famous hunter in his day. Though not the most celebrated hunter I've served, Vrago was still widely recognized as a hero for tirelessly protecting our people from the wild beasts that roam our lands. He and his cadre once saved my life as I was returning from a trip. As repayment for saving my life, I was creating some boots for him. Before I could fulfill my debt to him, the Muramites captured him and tortured him in their twisted Proving Grounds. I have been told by witnesses to this horror that the one that carried out his execution was awarded a cruelty medal for capturing him. Find the bearer of this medal and repay my debt to Vrago by dispatching him. Return the medal to me and I will give you the boots I had intended for him. To complete the boots though, I will also need two chimera gut strings.");
	}
  }
}

sub EVENT_ITEM {
 my $ihands = $rhands{$class};
 my $iwrists = $rwrists{$class};
 my $iarms = $rarms{$class};
 my $ihead = $rhead{$class};
 my $ichest = $rchest{$class};
 my $ilegs = $rlegs{$class};
 my $ifeet = $rfeet{$class};
 	
	if($faction <= 1) #must be ally to do this quest
	{
	if (plugin::check_handin(\%itemcount, 51481 >= 1, 51502 >= 2))
		{
		quest::say("Makyah's Axe! Now that this is returned to us, I hold hope that it may be wielded in our stuggle, to bolster our people's hope once more. Thankyou $name."); #made up
		quest::exp(100000);
		quest::summonitem($ihands);
		}
	if (plugin::check_handin(\%itemcount, 51480 >= 1, 51501 >= 2))
		{
		quest::emote("looks in wonder at the heart you present him, 'Would you have a look at that. Simply Amazing! I must study this immediately lest it's power dim. Here take these."); #made up
		quest::exp(100000);
		quest::summonitem($iwrists);
		}
	if (plugin::check_handin(\%itemcount, 51479 >= 1, 51500 >= 2))
		{
		quest::emote("seems lost in a moment of sorrow as you hand him the pouch. 'Thankyou $name. You do not know how much this gladdens me, and saddens me, to have this returned..."); #made up
		quest::exp(100000);
		quest::summonitem($iarms);
		}
	if (plugin::check_handin(\%itemcount, 51475 >= 1, 51496 >= 2))
		{
		quest::say("Excellent effort $race. This was exactly the walking stick i sought. Here take these as offered."); #made up
		quest::exp(100000);
		quest::summonitem($ihead);
		}
	if (plugin::check_handin(\%itemcount, 51476 >= 1, 51497 >= 3))
		{
		quest::emote("unfolds the vest and begins to run his eyes over it, paying attention to details that only a master crafter would see. 'Yes, this is indeed the vest my master created for Jayruk. I would recognize it anywhere. Now, perhaps I may learn some of the secrets my mentor did not have time enough to pass along to me. And the nails you have brought me pay tribute to the great hunter that Jayruk was. Though this vest I am about to give you is not the equal of the one Jayruk wore, it is certainly close.");
		quest::exp(100000);
		quest::summonitem($ichest);
		}
	if (plugin::check_handin(\%itemcount, 51477 >= 1, 51498 >= 3))
		{
		quest::emote("laughs softly under his breath, 'Though normally I would not celebrate the death of something so needlessly, I am not saddened at all that these 4 are no longer amound the world of the living. Take these as a token of my gratitude."); #made up
		quest::exp(100000);
		quest::summonitem($ilegs);
		}
	if (plugin::check_handin(\%itemcount, 51478 >= 1, 51499 >= 2))
		{
		quest::say("I hope this brings poor Vrago some measure of peace. Take these and use them to aid in you in the destruction of the Muramite armies. I am sure this too would bring Vargo peace."); #made up
		quest::exp(100000);
		quest::summonitem($ifeet);
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