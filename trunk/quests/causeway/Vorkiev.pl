#Vorkiev.pl
#Vorkiev's Plate Armor (Tier 1)
#Must be warmly to get and complete this set of quests. -Kilelen

sub EVENT_SAY
{
	#Must be warmly+ and a plate class.
	if (($faction <= 2) && (($class eq "Warrior") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Bard") || ($class eq "Cleric"))) {
		if ($text=~/Hail/i) {
			quest::say("Hello, $name. I am Vorkiev, a former smith of Dranik. Word of your battles against the Muramites has passed from ear to ear across Kuua. You bring hope to the dragorn who long to be free from the shadow of Mata Muram! Perhaps we can be of [service] to one another?");
		}
		
		if ($text=~/service/i) {
			quest::say("A decade ago my forge created great suits of armor to protect Kuua's strongest warriors. When the Muramites came, however, they sought to conscript me to make armor for their captains. Rather than comply, I fled into the wilderness to live as an exile. I have no regrets about my decision, but I do long for the old days, back when the land was green and the dragorn stood side by side against their enemies, instead of kowtowing to these forsaken Muramites. There many tasks I need accomplished that I am unable to see through myself due to my exile. If you can help me, I can reward you with finely crafted plate armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]. What say you?");
		}
		
		if ($text=~/hands/i) {
			quest::say("I appreciate your enthusiasm. Be careful though, this will not be easy for I require a rare item that is entrusted only to the Muramite captains. Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send messages from Harbinger's Spire. If you can capture one of these infused spire control shards along with the satchels of two discordling messengers, it may disrupt the Muramite chain of command long enough to afford me a chance to return home for a day. I have not seen many of my kin since The Darkening fell upon Kuua and I long to know if any of them are still alive. Recover these items for me and you shall be rewarded with my finest plate gauntlets.");
		}
		
		if ($text=~/wrists/i) {
			quest::say("Did you know that dragorns were created by the death of a single dragon named Dranik, the great father? The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. Return with this banner along with two Ashlock branches, so I can remake the haft. From there, I can reward you with a powerfully crafted wristguard.");
		}
		
		if ($text=~/arms/i) {
			quest::say("The armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but the landscape as well. Many of our old landmarks no longer stand and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, I will be in your debt. Return with this map along with two ukun quills so I can take notes on the map. My exile is long and there is no end in sight. I would like to reorient myself out here in the wilderness. Do this for me and I can reward you with some of my finely crafted arm guards.");
		}
		
		if ($text=~/head/i) {
			quest::say("When Discord first impinged upon our world, sentiments of treachery and paranoia crept into our lives. Dragorn turned on dragorn and longstanding friendships ended in bitter squabbling. One dragorn, Noble Yemall the Arcane, kept his wits enough to realize what was happening. Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were ultimately in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord and was likely seized by the Muramites. Retrieve this treatise along with two bristling ukun hides to use as book covers so I can bind the book and protect it from the elements. Hopefully the knowledge in this book will help me to survive in Kuua on my own, now that Discord is seeping further and further across our world. Do this for me and my best plate helm shall be your reward.");
		}
		
		if ($text=~/chest/i) {
			quest::say("The chest piece is the most-prized piece of my collection. For this I will require a special favor from you. Before the Muramites came, the High Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest, each carried scepters that were said to be carved from the bones of the first dragorn sons. It is said that these scepters will glow as long as their owner is alive. I have not seen or heard from the council since the Muramites overran our city, but I have heard that these scepters were handed out by Mata Muram as trophies. If you can recover one of these scepters along with three shorn murkglider tentacles to disguise it from the searching Muramites, I can keep it with me. Its soft glow will remind me that there is still hope for Dranik.");
		}
		
		if ($text=~/legs/i) {
			quest::say("Kuua was not the first world touched by Discord. There have been many others. I know this because I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three Dranik incense burners to hold it in, I will reward you with my finest set of plate greaves.");
		}
		
		if ($text=~/feet/i) {
			quest::say("When Discord first descended upon Kuua, many of my own kin turned traitor. Most dragorn who marched against Dranik were already in exile and seeking vengeance for their punishment, but a handful were established dragorn who conspired against us from within. These established dragorn did the most damage to our defense efforts as they worked against us without our knowledge. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitors' stones, along with two kyv bowstrings so that I can hang this rock of traitors for all to see. Although the dragorn have been occupied for the better part of a decade now, this may still cause stir up trouble for the Muramites. Do this for me and I can grant you my plate boots as a reward.");
		}
	}
}

sub EVENT_ITEM
{
	#Must be warmly+ and a plate class.
	if (($faction <= 2) && (($class eq "Warrior") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Bard") || ($class eq "Cleric"))) {
		#Hands
		if(plugin::check_handin(\%itemcount, 51146 => 1, 51453 => 2)) {#Spire Control Shard, 2x Discordling Message Satchel
			quest::say("Well met, $name. You may have well disrupted the Muramite chain of command long enough to afford me a chance to go looking for my surviving brothers. The Muramites are on the watch for me, but now they will be scrambling for word from their master. To thank you for your efforts, here are the plate gloves I have promised you.");
			if ($class eq "Warrior") {
				quest::summonitem(70744);#Armsmaster's Gloves
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70758);#Oathbound Gauntlets
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70772);#Heartstiller's Mail Gloves
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70793);#Traveler's Mail Gloves
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70751);#Sanctified Gloves
			}
			quest::exp(10000);
		}
		#Wrists
		elsif(plugin::check_handin(\%itemcount, 51445 => 1, 51452 => 2)) {#Dranik Blood Standard , 2x Ashlock Branch
			quest::say("The Blood Standard of Dranik! So it was not destroyed! Well done, $name. I make sure this banner remains in the hands of those still loyal to the old ways. May it fly over the free armies of Kuua once again. Here is the wristguard I have promised. May they serve you well in your future battles against the Muramites!");
			if ($class eq "Warrior") {
				quest::summonitem(70743);#Armsmaster's Bracer
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70757);#Oathbound Bracer
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70771);#Heartstiller's Mail Wristguard
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70792);#Traveler's Mail Wristband
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70750);#Sanctified Wristguard
			}
			quest::exp(10000);
		}
		#Arms
		elsif(plugin::check_handin(\%itemcount, 51444 => 1, 51451 => 2)) {#Map of Old Kuua, 2x Ukun Quill
			quest::say("A map of Old Kuua! How this map makes me long for the old days, back when we were a free race! My thanks, $name. This map may help relearn the new landscape in the context of the old. Here is a set of ornate arm guards as your reward.");
			if ($class eq "Warrior") {
				quest::summonitem(70742);#Armsmaster's Sleeves
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70756);#Oathbound Armguards
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70770);#Heartstiller's Mail Sleeves
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70791);#Traveler's Mail Sleeves
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70749);#Sanctified Sleeves
			}
			quest::exp(10000);
		}
		#Head
		elsif(plugin::check_handin(\%itemcount, 51440 => 1, 51447 => 2)) {#Duskfall Chronicles, 2x Bristling Ukun Hide
			quest::say("Well met, $name. Hopefully this book will contain some valuable information on the nature of Discord. To survive on my own, I must first understand the poison affecting the land. As promised, here is the helm as your reward for such a dangerous mission.");
			if ($class eq "Warrior") {
				quest::summonitem(70741);#Armsmaster's Helm
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70755);#Oathbound Helm
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70769);#Heartstiller's Mail Helm
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70790);#Traveler's Mail Cap
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70748);#Sanctified Headdress
			}
			quest::exp(10000);
		}
		#Chest
		elsif(plugin::check_handin(\%itemcount, 51441 => 1, 51448 => 3)) {#Dragorn Elder Scepter, 3x Shorn Murkglider Tentacle
			quest::say("Hope!  Take this.");#Text made up.
			if ($class eq "Warrior") {
				quest::summonitem(70746);#Armsmaster's Breastplate
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70760);#Oathbound Breastplate
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70774);#Heartstiller's Mail Chestguard
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70795);#Traveler's Mail Chestguard
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70753);#Sanctified Chestguard
			}
			quest::exp(10000);
		}
		#Legs
		elsif(plugin::check_handin(\%itemcount, 51442 => 1, 51449 => 3)) {#Dragorn City Ember, 3x Dranik Incense Burner
			quest::say("Hmm, I shudder to think what names I will find scribed on this rock, but I thank you for your work none the less. Hopefully, this list can be used to stir some more dissention among the dragorn that have sworn loyalty to Mata Muram for the time being. Here are the plate boots I have promised. May they serve you well, $name.");
			if ($class eq "Warrior") {
				quest::summonitem(70747);#Armsmaster's Leggings
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70761);#Oathbound Legguards
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70775);#Heartstiller's Mail Leggings
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70796);#Traveler's Mail Legguards
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70754);#Sanctified Leggings
			}
			quest::exp(10000);
		}
		#Feet
		elsif(plugin::check_handin(\%itemcount, 51443 => 1, 51450 => 2)) {#Kuuan Traitor Stone, 2x Kyv Bowstring
			quest::say("So, the embers do exist! Excellent work, $name. I plan to hold this ember in the forge when crafting in the future. This will ensure that the ember's heat is used to forge armor for the enemies of the Muramites. Poetic justice, don't you think? For your efforts, here are the greaves as promised!");
			if ($class eq "Warrior") {
				quest::summonitem(70745);#Armsmaster's Boots
			}
			elsif ($class eq "Paladin") {
				quest::summonitem(70759);#Oathbound Boots
			}
			elsif ($class eq "Shadowknight") {
				quest::summonitem(70773);#Heartstiller's Mail Boots
			}
			elsif ($class eq "Bard") {
				quest::summonitem(70794);#Traveler's Mail Boot
			}
			elsif ($class eq "Cleric") {
				quest::summonitem(70752);#Sanctified Footwear
			}
			quest::exp(10000);
		}
	}
  plugin::return_items(\%itemcount);
}#END of FILE Zone:causeway ID:303068 --Vorkiev.pl