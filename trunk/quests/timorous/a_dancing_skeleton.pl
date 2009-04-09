#############
#Quest Name: Talon Southpaw's fate
#Author: BWStripes
#NPC's Involved: 1
#Items involved: 1
#############
###NPC 1
#Name: a_dancing_skeleton
#Race 161 (Iksar skeleton), Texture of 0, Size 6, gender of 2
#Location XYZ: 3122.8, 5725.5, 7.9 in Timorous Deep (spawned)
#Level: 29
#Type: Mob/Quest NPC
#Reward: 17037: hand with one only a thumb (container)
# monk shackle of rock - started in East Cabilis
#############
###Item 1
#Name: hand with one only a thumb (container)
#ID: 17037
###
# Updated by BWStripes
# The text and dialog was in the original file, credit to original author. I've never tried collecting the fingers. -Stripes
#
### NPC: a dancing skeleton
#Original submission:
#Submitted by: Senzo aka Fatty Beerbelly
#

sub EVENT_SAY {
  if($text=~/gomoz/i) {
    quest::emote("stops in suprise.");
    quest::say("Gomoz!! Why, that is me! I was heading off to be with the elements when I was captured by this smelly ogre. Actually, he is not as smelly as most.");
    quest::stoptimer(10);
    quest::stoptimer(11);
    quest::stoptimer(12);
    quest::stoptimer(100);
    quest::settimer(100,40); # Get the conversation out the way in 40s, or depop
  }
  if($text=~/talon southpaw/i) {
    quest::say("Master Talon Southpaw!! He was my master. Dead, he became. Off to the elements. I keep his special hand with me. Perhaps I should have it returned. Maybe I shall find a young adventurer to [return the hand to Cabilis].");
    quest::stoptimer(100);
    quest::settimer(100,30); # Get the conversation out the way in 30s, or depop
  }
  if($text=~/return the hand to cabilis/i) {
    quest::say("Yes!! Return the hand. Here it is. Missing four it is. Within the tower of past pain and torture is where the four lie. Taken by bones similar to myself.");
    quest::summonitem(17037); # hand with one only a thumb
    quest::settimer(100,4);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 5) {
  quest::settimer(10,2); #start dancing in 2s
  quest::emote("shambles to its feet and begins to jig somewhat grudingly.");
  }
}

sub EVENT_TIMER {
  if($timer eq 10) {
    #If I'd wanted a career in dancing, I'd have better hips
    quest::stoptimer(10);
    quest::settimer(11,2);
    quest::doanim(58);
  }
  if($timer eq 11) {
    #do the monkey with me
    quest::stoptimer(11);
    quest::settimer(12,2);
    quest::doanim(45);
  }
  if($timer eq 12) {
    #shake it, baby
    quest::stoptimer(12);
    quest::settimer(13,2);
    quest::doanim(58);
  }
  if($timer eq 13) {
    #falldowndead
    quest::stoptimer(13);
    quest::settimer(100,2);
    quest::doanim(16);
  }
  if($timer eq 100) {
    #danceover
    quest::stoptimer(100);
    quest::depop();
  }
}

#END of FILE Zone:timorous  - a_dancing_skeleton
  #Item_IDs : taken from : http://eqitems.13th-floor.org/
  #END of FILE : Zone : timorous : NPC_ID : none : a_dancing_skeleton
