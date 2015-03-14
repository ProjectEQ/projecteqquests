# Shorvocks Armor (Tier 1)
#location draniks scar -175, -1055.
#Appearance: http://eqbeastiary.allakhazam.com/search.shtml?id=16451

sub EVENT_SAY {
   if($faction < 3) {
      if($text=~/hail/i) {
      quest::say("Shhh. Keep your voice down. What I am about to say, I share with you in strictest confidence. I have heard it whispered that you are an enemy of the Muramites? If this is so, I have much need of your [help].");
      }
      if($text=~/How can I help/i) {
      quest::say("My name is not Shorvock, but rather Durhosk. I was one of the captains of the force lead by Rurof the Negotiator against the Muramites. Although Rurof and the rest of our company perished in the explosion of Dranik, I myself survived by a stroke of luck for I was away patrolling our rank's southern flank. Still, the shockwave knocked me unconscious for many hours. By the time I awoke, everyone was dead or gone. Left with no choice, I fled into the countryside, assuming the alias 'Shorvock.' Ever since then, I've been searching for other [survivors] of Rurof's army.");
      }
      if($text=~/What Survivors?/i) {
      quest::say("I have heard rumors that a few of my companions survived as well and have since set up raiding parties to waylay the Muramites. If only I could find them again! I would be more vocal in my search, but I fear the Muramites will recognize me and end my life. If you can help me in my quest, I can reward you with chain armor for your [hands], [wrists], [arms], [head], [chest], [legs], or [feet]. It is part of my old battle mail, which I can no longer wear because its splendor will draw too much attention.");
      }
      if($text=~/Hands/i) {
      quest::say("Harbinger's Spire was once a dragorn lookout tower which Mata Muram has since claimed and bent to his own purposes. He uses the spire as a beacon to receive news on his domain. Some of his captains possess infused crystal shards which can be used to send up beacons from Harbinger's Spire. Return to me with one of these infused spire control shards along with two darkshorn Kyv hoods. The hoods will help me hide my identity and the crystal shard will produce a break in the Muramite chain of command, allowing me greater freedom . . . at least for a few days. Do this for me and I can reward you with my finely crafted pair of chain gloves.");
      }
      if($text=~/Wrist/i) {
      quest::say("My kin believe that all the dragorn were created by the death of a single dragon, Dranik, the great father. The first dragorn to walk Kuua created many things in his honor. Among these creations was a fearsome battle standard painted with a drop of blood from each of Dranik's firstborn sons. The last dragorn armies to carry the banner fell to the Muramites. No one can say where the Blood Standard of Dranik has gone, but the recovery of such an artifact would leave me in your debt. Return with this banner along with two shed ikaav skins to hide it in. One of my men, a sergeant named Tibor, used to carry this standard into battle. Although he is probably dead, it would honor his memory if you recovered this standard born by my lost friend. I'd be happy to reward your efforts with my chain bracer.");
      }
      if($text=~/Arms/i) {
      quest::say("The armies of Mata Muram are but one aspect of Discord's deep shadow. The Darkening ravaged not only the denizens of Kuua, but also the landscape as well. Many of our old landmarks no longer stand and the sky -- once blue and vast -- now seethes with ash and storms. If you can find a map of Old Kuua, one drawn before the coming of Discord, I may be able to use it to find my way again. I have many miles to cover if I am to find my lost men and the terrain looks so alien to me. Return with such a map along with two Kuuan Lodestones so I can make a compass. Your efforts will be rewarded with my chain armwraps. Best of luck.");
      }
      if($text=~/Head/i) {
      quest::say("When Discord first impinged upon our world, sentiments of treachery and paranoia crept into our lives. Dragorn turned on dragorn and longstanding friendships ended in bitter squabbling. One dragorn, Noble Yemall the Arcane, kept his wits enough to realize what was happening. Before the Muramites came, Yemall toiled tirelessly to counter the effects of Discord. Although his efforts were ultimately in vain, it is said that he was able to author a treatise before the Muramites seized him. This treatise, entitled The Duskfall Chronicles, contains his reflections on the nature of Discord. No one knows what has happened to this text, but if you are able to recover it, I may be able to understand Discord and avoid mistakes of the past. Bring me this treatise along with two deepshadow feran pelts so that I may make a book cover. Do this for me and I will reward you with my chain coif.");
      }
      if($text=~/Chest/i) {
      quest::say("Before the Muramites came, the Council of Eight ruled over Dranik. The eight nobles, lead by Jelvan the Eldest each carried scepters that were said to be carved from the bones of the first dragorn sons. It is said that these scepters will glow as long as their owner is alive. I have not seen or heard from the council since the Muramites overran our city, but I have heard that these scepters were handed out by Mata Muram. If you can recover one of these scepters along with three ragged discordling skins to hide it in, I can smuggle this relic of the dragorn away from the Muramites. They should not be in control of such a relic. Relieve our enemies of this relic and I can reward you with my chain vest.");
      }
      if($text=~/Legs/i) {
      quest::say("Kuua was not the first world touched by Discord. There have been many others. I know this because I have heard the Muramites tell stories of past conquests. One of the stories they tell is that the last ember of a Discord-ravaged city will burn for many years, long after the ruins of the city itself have been covered over by time. Some say it's the city's spirit slowly dying. Others claim it to be a side effect of the Discord's lingering magic. Regardless, these embers are highly valued by the legions of Discord, for Mata Muram rewards them to his fiercest captains as war trophies. If you can bring me one of these embers along with three locks of a chimera's mane, I can make a charm to bribe my way past any Muramite who may find me. My enemies are everywhere and I need insurance in case they see through my guise. Do this for me and you shall be rewarded with my old chain leggings.");
      }
      if($text=~/Feet/i) {
      quest::say("When Discord first descended upon Kuua, many of my own kin turned traitor. These traitors did considerable damage to our defense efforts for they worked against us without our knowledge. There is talk of a traitors' stone which is etched with the names of all dragorn who conspired with the Muramites in those dire days. The Muramite captains carried these stones and used them to determine which dragorn to slay outright and which to spare with a life of slavery. If you can bring me one of these Kuuan traitors' stones, along with two Muramite dispatches, I can use them to learn who to trust and who to avoid on my quest to find my missing legion. There are many who would turn me in if they knew my true identity, but this stone should help me sort friend from foe. Bring this stone to me and I can reward you with my chain boots.");
      }
   }
else {
   quest::say("The sun, moon, and stars all align at night.");
    }
}

sub EVENT_ITEM {
   if($faction < 3) {
      if (plugin::check_handin(\%itemcount, 51460 => 2, 51446 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70849);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70800);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70807);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70765);
         }
      }
      if (plugin::check_handin(\%itemcount, 51459 => 2, 51445 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70848);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70799);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70806);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70764);
         }
      }
      if (plugin::check_handin(\%itemcount, 51458 => 2, 51444 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70847);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70798);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70805);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70763);
         }
      }
      if (plugin::check_handin(\%itemcount, 51454 => 2, 51440 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70846);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70797);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70804);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70762);
         }
      }
      if (plugin::check_handin(\%itemcount, 51455 => 3, 51441 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70851);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70802);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70809);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70767);
         }
      }
      if (plugin::check_handin(\%itemcount, 51456 => 3, 51442 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70852);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70803);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70810);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70768);
         }
      }
      if (plugin::check_handin(\%itemcount, 51457 => 2, 51443 => 1 )) {
         if($class eq "Berserker") {
         quest::summonitem(70850);
         }
         elsif($class eq "Rogue") {
         quest::summonitem(70801);
         }
         elsif($class eq "Shaman") {
         quest::summonitem(70808);
         }
         elsif($class eq "Ranger") {
         quest::summonitem(70766);
         }
      }
    else {
      plugin::return_items(\%itemcount);
    }
}
   else {
    quest::say("I do not know you well enough to entrust you with such an item, yet."); #Made up text
  }
}