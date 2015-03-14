 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Barowsar
## ID: 301028
## ZONE: bloodfields
##
############################################

%rhands = ("Monk" => 70786, "Beastlord" => 70842, "Druid" => 70779);
%rwrists = ("Monk" => 70785, "Beastlord" => 70841, "Druid" => 70778);
%rarms = ("Monk" => 70784, "Beastlord" => 70840, "Druid" => 70777);
%rhead = ("Monk" => 70783, "Beastlord" => 70839, "Druid" => 70776);
%rchest = ("Monk" => 70788, "Beastlord" => 70844, "Druid" => 70781);
%rlegs = ("Monk" => 70789, "Beastlord" => 70845, "Druid" => 70782);
%rfeet = ("Monk" => 70787, "Beastlord" => 70843, "Druid" => 70780);

sub EVENT_SAY {
if($faction <= 2)	#must be warmly to do the quest
{
 if($text=~/hail/i)
	{
	quest::say("Greetings, $name . I have heard your name spoken among the few dragorn that find their way here to visit Master [Lenarsk]. They say you are an enemy of the Muramites? If so, then let me greet you properly.' The dragorn bows deeply. 'Apprentice Tanner Barowsar at your service.");
	}
   if($text=~/Lenarsk/i)
	{
	quest::say("Though I call him master, Lenarsk has been more like a father to me. My true father, Noble Jelvan the Eldest, I have not seen since the Muramites captured the High Council of Eight. I was but a young hatchling then, and Lenarsk, my father's tanner, hid me within a tapestry and took me to safety into the wilderness. Now that I am old enough, he has taken me as an apprentice, teaching me to cut and shape leather into armor. If you would be interested, I have leatherwork for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]. You may find it useful in your battles against the Muramites. It is yours provided, of course, you can perform a favor in return.");
	}
 if($text=~/Hands/i)
	{
	quest::say("As you may know, Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send up beacons from Harbinger's Spire. Return to me with one of these spire control shards as well as two glistening murkglider pelts to hide it in. I have heard rumors of a small force of dragorn in Dranik's Scar that still stand against Mata Muram. If we can disrupt the Muramite communication network, we may buy these rebels time to plan their next attack. It's a small thing, but until I am old enough to fight, it's the best I can do to help them. In return for your help I will reward you with a masterwork set of leather gloves.");
	}
 if($text=~/Wrists/i)
	{
	quest::say("As you may know, my kin believe that all the dragorn were created by the death of a single dragon, Dranik -- the great father. The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. If you return with this banner as well as with two Dansk branches, I can remake a haft for this standard to fly again. In return, I can offer a finely crafted leather wristguard as your reward.");
	}
 if($text=~/Arms/i)
	{
	quest::say("I have little memory of Kuua before the Muramites came. I was but a hatching when they began to pour into our lands. I have heard stories though, stories of green mountains and fields of Dansk blossoms. If only I could see it all now. If you can find a map of Old Kuua, one drawn before the coming of Discord, I would like to study it to remind myself that this land was not always twisted by Discord. Bring me one of these maps along with two Dansk blossoms so that I may imagine the world of my elders. Do this and I can reward you with an ornate pair of leather armguards from Master Lenarsk's collection.");
	}
 if($text=~/Head/i)
	{
	quest::say("I was too young to remember fully, but when Discord first impinged upon our world, treachery and paranoia crept into the lives of my kin. Only one dragorn, Noble Yemall the Arcane, kept his wits long enough to realize what was happening. Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord. No one knows what has happened to this text, but if you are able to recover it, I can study its teachings and perhaps begin to understand why so many of my kin turned on one another. Bring me this treatise along with two Muramite ritual scrolls to help me understand the nature of Discord. Do this and I can reward you with a leather helm from Master Lenarsk's collection.");
	}
 if($text=~/Chest/i)
	{
	quest::say("One of my greatest regrets stems from the fact that I only have vague memories of my father, Jelvan the Eldest. I have not seen him since the Muramites came and then I was only a hatchling. It is said that he carried a scepter granted by Dranik himself. This scepter will glow as long as its owner is alive. If you can recover his scepter along with three tattered chimera pelts to conceal it in, I will be able confirm if he is still alive. I can reward you with an ornate leather chest plate that I made under the tutelage of Master Lenarsk.");
	}
 if($text=~/Legs/i)
	{
	quest::say("As you may know, Kuua was not the first world touched by Discord. I have heard many stories of past conquest told by the Muramites. They say that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit, slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three dragorn-crafted metal bowls to contain it, I can keep this precious item away from the Muramites. I do not think the last remnants of a destroyed world should be flaunted with such irreverence. Secure these from the Muramites and my leather leggings shall be yours.");
	}
 if($text=~/Feet/i)
	{
	quest::say("When Discord first descended upon Kuua, many of my own kin turned traitor. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitor stones, now found on some of my twisted brethen, along with two Muramite Dragorn slaver whips, I can bury these items for good. If the dragorn are going to make a united stand against the Muramites, we need to forget about the treacheries of the past and stand together as one united force. Burying this stone will bring us together as a people. Bring me these items and I can reward you with a finely crafted pair of leather boots. Good luck!");
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
 	
	if($faction <= 2) #must be warmly to do this quest
	{
	if (plugin::check_handin(\%itemcount, 51446 => 1, 51467 => 2))
		{
		quest::say("Fantastic work $race . The loss of the shard should prevent the opportunity we were waiting for. Please take these and wear them with pride."); #made up
		quest::exp(100000);
		quest::summonitem($ihands);
		}
	if (plugin::check_handin(\%itemcount, 51445 => 1, 51466 => 2))
		{
		quest::say("The Blood Standard of Dranik! I did not believe it still existed! This will bring hope to the few dragorn who still resist Mata Muram. I only wish I was ready to join them. Thank you. As promised, here is a leather wristguard as a reward.");
		quest::exp(100000);
		quest::summonitem($iwrists);
		}
	if (plugin::check_handin(\%itemcount, 51444 => 1, 51465 => 2))
		{
		quest::emote("looks at the map with yearning, 'Thankyou young $race, just seeing this brings some hope to my heart that one day what was may be again. Take these sleeves and use them to bring down the muramite."); #made up
		quest::exp(100000);
		quest::summonitem($iarms);
		}
	if (plugin::check_handin(\%itemcount, 51440 => 1, 51461 => 2))
		{
		quest::emote("takes the book and scrolls from you gratefully, 'Excellent, with these writings I should be able to begin to understand discord, hopefully giving me information we can use to our advantage. Here $name, take this as promised."); #made up
		quest::exp(100000);
		quest::summonitem($ihead);
		}
	if (plugin::check_handin(\%itemcount, 51441 => 1, 51462 => 3))
		{
		quest::say("He lives yet! You see it glows still, if only faintly.' Barowsar pauses for a moment in quite contemplation before continuing. 'Here $name, this was my finest work, and you deserve no loss for the favor you have done me this day."); #made up
		quest::exp(100000);
		quest::summonitem($ichest);
		}
	if (plugin::check_handin(\%itemcount, 51442 => 1, 51463 => 3))
		{
		quest::emote("quickly conceals the ember within the bowls. 'Good work. I will lay this ember to rest, so that the spirits of this forsaken place may rest at last. As promises here is your reward."); #made up
		quest::exp(100000);
		quest::summonitem($ilegs);
		}
	if (plugin::check_handin(\%itemcount, 51443 => 1, 51464 => 2))
		{
		quest::say("Well done $name. I understand the Muramites guard these well. I'll bury this stone so the dragorn of Kuua can move on from the horrors of the past and instead look to the future. As promised, here is a pair of finely crafted leather boots as your reward.");
		quest::exp(100000);
		quest::summonitem($ifeet);
		}
	}
	plugin::return_items(\%itemcount);
}