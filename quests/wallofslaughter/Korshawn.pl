 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Korshawn
## ID: 300039
## ZONE: wallofslaughter
##
############################################

sub EVENT_SAY
{
	if($faction <= 2)	#must be warmly to do the quest
		{
		if($text=~/hail/i)
			{
			quest::me("The old dragorn studies you for a moment before he begins speaking in a low gravely voice, 'So, $name, is it true what my kin whisper? That you have come to fight the Muramites? Hmm, you're ten years too late. Half of Kuua's warriors who would have fought by your side are now nothing more then [bones]. The other half have already sworn allegiance to Mata Muram. I'm not so sure which half is better off.");
			}
		if($text=~/bones/i)
			{
			quest::say("Many dragorn have fallen to the armies of the Muramites. As a chaplain of Dranik's forces, it was my responsibility to guide the passing of the dying warriors and bury their bodies so that they will be honored even in death. I buried each member of my unit, one by one, until only I remained. Consumed with despair, I abandoned the war effort to seek a life of solitude and anonymity.' The dragorn gazes off into the distance before continuing, 'Your arrival has been the first hope many of us have had in a long time. I wish I could join you as you make your stand against the Muramites, but I've long ago hung up my battle [heirlooms], swearing never to fight again.");
			}
		if($text=~/heirlooms/i)
			{
			quest::say("I still have my battle dressings. They are part of an ancient set handed down from Dranik's chaplains before me. Perhaps you'd be interested in cloth armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]? The pieces are light and supple and served me well in the field. I can give you one piece for each service you perform in the interest of the children of Dranik.");
			}
		if($text=~/hands/i)
			{
			quest::say("Harbinger's Spire was once a dragorn lookout tower which the Muramites have since bent to their own purposes. I studied there as a young chaplain, and I shudder to look upon what has those discordlings have done to it in these past years. Mata Muram uses the spire as a beacon to receive the tidings of his domain. Some of his captains possess crystal shards which can be used to control the beacon rising from Harbinger's Spire. If you are able to steal one of these crystals, it would mean a break in the Muramite chain of communication. Return with one of these spire control shards as well as two discordling finger bones. If enough shards are taken from the Muramites, they will be forced to abandon the tower.");
			}
		if($text=~/wrists/i)
			{
			quest::say("We were created by a single great dragon, the great father known as Dranik. The first dragorn created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. This banner was carried by my kin through many battles and it has seen us through much strife. The last dragorn armies to carry the banner fell to the Muramites over a decade ago. No one can say where the Blood Standard of Dranik's Sons has gone, but the recovery of such an artifact will leave me in your debt. Return with this banner along with two hooked chimera claws to use as nails. I will ensure that the standard hangs over the mass graves of those who died fighting the Muramites. It's the least I can do to honor their deaths.");
			}
		if($text=~/arms/i)
			{
			quest::say("I respect your willingness to help, but this will not be an easy task. As you may know, the armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but also the landscape as well. Many of our old landmarks no longer stand, and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, it may help me to infer the location of the ancient barrows of my kin. I need to find them before the Muramites manage to pillage the graves of my ancestors. Return with one of the old maps as well as two jagged noc tusks so I can hollow them out and create a safe place to keep the map. Do this for me and I can reward your efforts with my cloth arm wraps.");
			}
		if($text=~/head/i)
			{
			quest::say("When Discord first impinged upon our world, sentiments of treachery and paranoia crept into our lives. Dragorn turned on dragorn and soon longstanding friendships ended in bitter squabbling. One dragorn, Noble Yemall the Arcane, kept his wits long enough to realize what was happening. Before the Muramites came, Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were ultimately in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord. No one knows what has happened to this text, but if you are able to recover it, I may be able to understand why so many dragorn met their end. Bring me this treatise along with two rugged murkglider skins to make a book cover. I will reward you with my former battle hood.");
			}
		if($text=~/chest/i)
			{
			quest::say("Before the Muramites came, the High Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest, each carried scepters that were said to be carved from the bones of the first dragorn sons and etched in ancient runes. It is said that these scepters will glow as long as their owner is alive. I have not seen the council since the Muramites overran our city, but I have heard that their scepters were handed out by Mata Muram as war trophies. If you can recover one of these scepters along with three Kuuan oil candles so I can study the runes, I will reward you with my former battle tunic!");
			}
		if($text=~/legs/i)
			{
			quest::say("As you may know, Kuua was not the first world touched by Discord. There have been many others, for I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years long after the ruins of the city itself have been buried by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three Dragorn Muramite insignia necklaces, I can reward you with my former battle leggings. I have no need of them any longer, and I can use that ember to light the pyres of my kin who have fallen to the Muramites. It would be an honorable tribute to both my kin and the unknown city that have both fallen to Discord.");
			}
		if($text=~/feet/i)
			{
			quest::say("When Discord first descended upon Kuua, many of my own kin turned traitor. There is talk of a traitors' stone, etched with the names of all dragorn who conspired with the enemy in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitor stones, along with two ikaav braids so I can hang the stones for all to see, it may enrage the remaining dragorn who are unhappy with Mata Muram's rule. In time they may gather the spirit of will to once again rise up against the Muramites. Your reward shall be the cloth slippers I wore back when I, too, fought against the enemies of Dranik.");
			}
		}
	else
		{
		quest::emote("does not respond to you."); #made up text
		}
		}

sub EVENT_ITEM
{
	if($faction <= 2) #must be warmly to do this quest
	{
	if (plugin::check_handin(\%itemcount, 51446 => 1, 51474 => 2)) #hands
		{
		quest::say("bows before you. 'Thank you, $name. You have helped prevent the Muramites from using my former home as part of their information network. You've also brought me the fingers of two discordlings, the very beasts that are responsible for the tower's construction. As promised, I offer my cloth gloves as your reward.");
		quest::experience(10000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70835);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70828);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70814);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70821);
				}
		}
	if (plugin::check_handin(\%itemcount, 51445 => 1, 51473 => 2)) #wrists
		{
		quest::say("You've recovered the banner! And to think I thought it lost for good! I'll be sure this flies over the graves of my fallen kin. May its glory rekindle the spirits of the dragorn still under the Muramite whip! As promised, my cloth wrist band shall be your reward!");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(707834);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70827);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70813);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70820);
				}
		}
	if (plugin::check_handin(\%itemcount, 51444 => 1, 51472 => 2)) #arms
		{
		quest::say("Thank you $name. Please take this as a reward for your efforts."); #made up text Correct text unavailable
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70833);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70826);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70812);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70819);
				}
		}
	if (plugin::check_handin(\%itemcount, 51440 => 1, 51468 => 2)) #head
		{
		quest::say("You've recovered The Duskfall Chronicles! Perhaps with time the dragorn will learn to resist the poison of Discord to once again stand against a common enemy. May so many of my kin never die in vain again. Thank you, $name. As promised, here is my cloth battle hood as your reward.");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70832);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70825);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70811);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70818);
				}
		}
	if (plugin::check_handin(\%itemcount, 51441 => 1, 51469 => 3)) #chest
		{
		quest::say("Yes, this is it the scepter of Yumall! I recognize the markings! Alas, the glow has left the scepter which means Yumall no longer draws breath. At least now I know to prepare a burial ritual in his honor. As promised, here is my former battle tunic. In the days when I still fought for Dranik, this tunic turned many blades that otherwise would have found my heart.");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70837);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70830);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70816);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70823);
				}
		}
	if (plugin::check_handin(\%itemcount, 51442 => 1, 51470 => 3)) #legs
		{
		quest::say("You've recovered a map of Old Kuua! With this I may yet find the burial grounds of my ancestors. Hopefully before the Muramites get there to pillage what remains of my kins' riches! Thank you, $name. As promised, here are my former arm wraps. I have no more need of them, but I'm sure they will serve you well.");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70838);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70831);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70817);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70824);
				}
		}
	if (plugin::check_handin(\%itemcount, 51443 => 1, 51471 => 2)) #feet
		{
		quest::say("Excellent work, $name. I shudder to think what names could be etched on this stone, but I thank you for your efforts nonetheless. As promised, here are my slippers as your reward. May they keep you fleet of foot and out of harm's way.");
		quest::exp(100000);
			if($class eq "Enchanter")
				{
				quest::summonitem(70836);
				}
			if($class eq "Magician")
				{
				quest::summonitem(70829);
				}
			if($class eq "Necromancer")
				{
				quest::summonitem(70815);
				}
			if($class eq "Wizard")
				{
				quest::summonitem(70822);
				}
		}
	}
	plugin::return_items(\%itemcount);
}
#END of FILE