#############
#Quest Name: A dufrenite for a boon
#Author: BWStripes
#NPC's Involved: 1
#Items involved: 1
#############
###NPC 1
#Name: Gem_Cutter_Skeleton
#Race 367 (Human Skeleton), Texture of 0, Size 6, gender of 2
#Location X,Y,Z: 9368.0, 580.0, 1068.2 in Dreadlands
#Level: 23,25,27 depending on pop, has PHs
#Type: Mob/Quest NPC
#Reward:
#12946: Dread Diamond
#############
###Item 1
#Name: Dufrenite
#ID: 10073
###

#This mob, usually KoS had to be charmed by an enchanter/bard before he would talk.
#Text is completely improvised. Yes, I know its actually the drumming anim, but its close.

#Quest for Guard Elron in North Qeynos
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::doanim(39);
    quest::emote("appears to be busy cutting a green gem; upon your greeting, it jumps, fleshless hands slipping carelessly and breaking the gem into powder.");
    quest::settimer("distracted",2);
  }
  if($text=~/green gem/i){
    quest::say("The greenest of gems I seek! Jade too brittle, emerald too hard, but [dufrenite]! Ahh, now there is a gem amongst gems.");
  }
  if($text=~/dufrenite/i){
    quest::say("Yes, dufrenite! Find me a dufrenite to replace the one you made me break. Now go!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,10073=>1)) {
    quest::emote("eyes sparkle as you hand it the gem.");
    quest::say("Yes! Yes! This is the greenest of gems!");
    quest::summonitem("12946");
    quest::say("Worth more to you crushed, that is! Find a spectral pestle, and crush it to dust!");
    quest::exp("3000");
    quest::settimer("cutting",4);
  }
  else {
    plugin::return_items(\%itemcount);
    quest::say("Ha! Worthless to me, this is! I return it!");
  }
}

sub EVENT_TIMER {
  if ($timer eq "distracted") {
    quest::doanim(20);
    quest::say("Blast it! Distracted me you have! Now I need a new [green gem]!");
    quest::stoptimer("distracted");
  }
  if ($timer eq "cutting") {
    quest::emote("carries on cutting gems, oblivious to your presence.");
    quest::doanim(39);
    quest::stoptimer("cutting");
  }
}

#END of FILE Zone: dreadlands -- gem_cutter_skeleton