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

#Description: Kill the mushroom guardian, and return his head. The guardian was a rare spawn, usually on the east side of the zone wandering N/S.
#It proc'd a 'whirl till you hurl' spinstun effect, which is why it was incredibly diffcult.

#Quest for SK GM Treskar in Grobb
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("You dare speak to Master Treskar!! You be [sent by Hukulk] or you be hurtin'!! Me have no time to waste with ugly one like you!!");
  }
  if($text=~/sent by hukulk/i){
    quest::say("Ha!! Hukulk accept puny troll now?!! Ha!! You join us and you join fight. Nightkeep enemy is $name enemy!! You help smash [other weak shadowknights].  Them weak.  We true power!!  You bash good and maybe you do [secret mission] for Treskar.");
  }
  if($text=~/other weak shadowknights/i){
    quest::say("Ha! Dem Ogre Greenbloods are weaklings. Dems your enemy. Frogloks are your enemy. Smash all Greenbloods! Smash all Frogloks!");
  }
  if($text=~/secret mission/i){
    #Should have a faction check. However, since the Trolls haven't eaten you, we'll let you do it.
    quest::say("Nightkeep hear bashers see fungus man spore guardian at Innothule. Him protect young fungus man spores so they grow big, BIG an' attack trolls!! You go find spore guardian. Smash hi big red head!! Bring Treskar that huge mushroom head of his to prove he walk no more. You do this and me give you froglok skin mask.");
  }
}

sub EVENT_ITEM {
if($itemcount{12190} == 1){
  quest::say("Ha! Dats one big dead head. You smashed him guud. Take dis mask, Shadowknight uv Nightkeep - I seez great tings for you."); #Guessed Dialog as quest was revised when removed to Neriak
  quest::summonitem("2308");
  quest::faction(66,50); #Da Bashers (Grobb general guards)
  quest::faction(22,-20); #Broken Skull Clan
  quest::faction(292,50); #Shadowknights of Night Keep (Troll SK)
  quest::faction(22,-10); #Green Blood Knights (Ogre SK)
  quest::exp("10000"); # Appropriate for ~level 10?
  } else {
    plugin::return_items(\%itemcount); #function from file plugins/check_handin.pl
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight'); #function from file plugins/guildmasters.pl
  }
}

#End - SK GM Treskar, Grobb
