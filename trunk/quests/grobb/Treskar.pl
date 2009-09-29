#############
#Quest Name: Treskar's Secret Mission
#Author: BWStripes
#NPC's Involved: 1
#Items involved: 1
#############
###NPC 1
#Name: Treskar
#Race 9 (Troll), Texture of 0, Size 0, gender of 0
#Location XYZ: -906.0, 485.0, 3.0 in Grobb
#Level: 60
#Type: SK Guildmaster
#Reward: itemid 2308: Froglok Skin Mask
#############
###Item 1
#Name: Huge Mushroom Head
#ID: 12190
#NPC: 46061 - Spore_Guardian
###

###Shadowblade added text and handins for the Treskar tasks 1-4.  Need proper
###dialogue for task assignment and handin.

#Description: Kill the mushroom guardian, and return his head. The guardian was a rare spawn, usually on the east side of the zone wandering N/S.
#It proc'd a 'whirl till you hurl' spinstun effect, which is why it was incredibly diffcult.

#Quest for SK GM Treskar in Grobb
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You dare speak to Master Treskar!! You be [sent by Hukulk] or you be hurtin'!! Me have no time to waste with ugly one like you!!");
  }
  if($text=~/sent by hukulk/i) {
    quest::say("Ha!! Hukulk accept puny troll now?!! Ha!! You join us and you join fight. Nightkeep enemy is $name enemy!! You help smash [other weak shadowknights]. Them weak. We true power!! You bash good and maybe you do [secret mission] for Treskar. Or I has sum other [work] fer you.");
  }
  if($text=~/other weak shadowknights/i) {
    quest::say("Ha! Dem Ogre Greenbloods are weaklings. Dems your enemy. Frogloks are your enemy. Smash all Greenbloods! Smash all Frogloks!");
  }
  if($text=~/secret mission/i) { #Should have a faction check. However, since the Trolls haven't eaten you, we'll let you do it.
    quest::say("Nightkeep hear bashers see fungus man spore guardian at Innothule. Him protect young fungus man spores so they grow big, BIG an' attack trolls!! You go find spore guardian. Smash hi big red head!! Bring Treskar that huge mushroom head of his to prove he walk no more. You do this and me give you froglok skin mask.");
  }
  if ($text=~/work/i) {
    quest::say("So you not want to smash the weak Greenbloods. Dats ok, you can bring me three ruined wolf hides and a fire beetle eye. Dat help you git big enuff to smash dem.");
  }
  if ($text=~/another/i) {
    quest::say("You dun gud on the other job. I am feeling hungry, I want to make me a pie. You bring me two snake eggs and I give you a present.");
  }
  if ($text=~/next/i) {
    quest::say("I need you to go bash dem bad orcs. The Deathfist have ruined our lands and we will not allow it. Bring me three slashed belts of the Deathfist.");
  }
  if ($text=~/final/i) {
    quest::say("Here is your last task. When this done, you ready to bash Greenbloods. I need two meats from wolves and 2 snake scales.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12190 => 1)) {
    quest::say("Ha! Dats one big dead head. You smashed him guud. Take dis mask, Shadowknight uv Nightkeep - I seez great tings for you."); #Guessed Dialog as quest was revised when removed to Neriak
    quest::summonitem(2308);
    quest::faction(66,50); #Da Bashers (Grobb general guards)
    quest::faction(22,-20); #Broken Skull Clan
    quest::faction(292,50); #Shadowknights of Night Keep (Troll SK)
    quest::faction(22,-10); #Green Blood Knights (Ogre SK)
    quest::exp(10000); # Appropriate for ~level 10?
  } 
  elsif (plugin::check_handin(\%itemcount, 13782 => 3, 10307 => 1)) {
    quest::say("Dats gud, here take dis armor to helps you be stronger. Come sees me when you want [another] job");
    quest::summonitem(2104);
    quest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 13088 => 2)) {
    quest::say("Dis is good.  I go make a pie now. Here is sumting for your help. Come see me agin when you want your [next] job.");
    quest::summonitem(quest::ChooseRandom(2145, 2140, 2144, 2137, 2137, 2138, 2147, 2139, 2146, 2142, 2148, 2143)); #Random raw-hide armor
    quest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 13916 => 3)) {
    quest::say("Very good! We turn you into a basher yet. Here you go. Come see me when you want your [final] task.");
    quest::summonitem(ChooseRandom(6031, 5070, 5071, 7024, 5042, 5047, 6033));#Random tarnished weapon
    quest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 13403 => 2, 13070 => 2)) {
    quest::say("Dats what I needed. Here you go.");
    quest::summonitem(ChooseRandom(6014, 5023, 6013, 7009, 5013, 5021));#Random rusty weapon
    quest::exp(1000);
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    plugin::return_items(\%itemcount);
  }
}
#End - SK GM Treskar, Grobb