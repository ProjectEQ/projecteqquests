#############
#Quest Name: Murder of Hurrietta
#Author: ?? (Update by BWStripes)
#NPC's Involved: 1
#Items involved: 6
#############
###NPC 1
#Name: Garuc_Anehm
#Race 1 (Human), Texture of 3, Size 0, gender of 0
#Location XYZ: -655.0, 357.0, -35.0 in Qeynos Catacombs
#Level: 61
#Type: SK GM
##
#Reward Item: 1-5
#Name: Random Patchwork armor
#ID: 2104, 2106, 2108, 2111, 2112
###
# Item 6
# Name: Rat Shaped Ring
# ID: 13301
# Quest Item
#############
###Item
#Name: Hurrieta's Bloody Dress
#ID: 13134
###

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Welcome to the Shrine of Bertoxxulous! You appear to be [new to the shrine]. I do not remember seeing you around.");
  }
  if($text=~/new to the shrine/i){
    quest::say("New blood to spread Bertoxxulous' disease? We presently need the help of a [young shadowknight]. There are certain deeds which must be carried out.");
  }
  if($text=~/young shadowknight/i){
    quest::say("Then let your supreme task be the extermination of the Priests of Life. Know that they threaten the will of our Lord Bertoxxulous. For every fallen paladin and cleric of the Temple of Life. you shall rise within our ranks.  So... do you [loathe paladins]?");
  }
  if($text=~/loathe paladins./i){
    quest::say("As do we all. The paladins of Qeynos come from either the Hall of Thunder or the Temple of Life. We have put a bounty upon their heads. Destroy these knights and return either the Order of Thunder or the prayer beads of these inferior men. There has even been a report from [Commander Kane].");
  }
  if($text=~/commander kane/i){
    quest::say("Kane Bayle is the Commander of the Qeynos Guard. He has found it advantageous to befriend the Bloodsabers. We share a [common goal]. He assists us in many ways. He has some new information to reveal.  Go and tell him you are a Bloodsaber. Do not speak with him while he is on duty!!");
  }
  if($text=~/common goal/i){
    quest::say("Kane Bayle and the leaders of this shrine all wish to overthrow the rule of Antonius Bayle. He, for power, and we for the glory of Bertoxxulous. From this city, our diseased lord shall appear and tread across the land spitting death from his mouth and deforming the land. His glory shall be eternal!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13134 => 1)) {
    my $garuc_reward = quest::ChooseRandom(2104, 2106, 2108, 2111, 2112, 13301);#Updated to issue random patchwork armor, or a rat-shaped ring
    my $garuc_randomSP = int(rand(20));
    my $garuc_randomCP = int(rand(20));
    quest::say("Hahaha.. I see you actually killed a respected, well-known citizen of Qeynos. No loss for them, but you are certainly a gain for our shrine. Maybe this shall do you some good. If not now, then surely later. You may need it when the Qeynos Guards hunt you down."); 
    quest::summonitem($garuc_reward);
    quest::givecash($garuc_randomCP,$garuc_randomSP,0,0);# Random from 20cp20sp
    quest::faction(135,-5); #Guards of Qeynos
    quest::faction(257,-5); #Priests of Life
    quest::faction(183,-5); #Knights of Thunder
    quest::faction(21,3);   #Bloodsabers
    quest::exp(500);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat  ID:45070 -- Garuc_Anehm