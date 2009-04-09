#NPC: Watchman_Dexlin (13112) Zone: northkarana
#
#Quest: Tiny Skeletons
#Involves:  Watchman_Dexlin (northkarana)
#           Narron_Jenork (akanon)
#           a_tiny_skeleton (northkarana)
#                
#by Qadar



sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("It is about time I met up with someone who I can tolerate.  Most of the residents within these plains shun gnomes.  I will happy to leave if I could just find those [pesky skeletons].");
  }
  if($text=~/pesky skeletons/i){
    quest::say("I was sent here by the Gemchoppers to seek out a pocketful of skeletons.  They are a creation of a one of Ak'Anon's exiled citizens.  He practiced the dark circle of magic and came to find the necromancers of Antonica.  He created and imported undead brownies to this realm.  We must find them to study them.  I can't seem to find them!!  If only I could find a [brave fighter] to assist me.");
  }
  if($text=~/brave fighter/i){
    quest::say("Very good. Take this tin box.  Fill each slot with the remains of the tiny undead, should you find them here.  I know not how many there exists, but I am sure that if I return this full tin box shall suffice.  Be quick, I have other matters to to tend to.  I shall depart when next my sun dial points to eight");
    quest::summonitem(17986);                     # give empty Tin Box
    quest::setglobal("skelup","0","3","F");       # Resets $skelup to 0 for check on next line
    quest::signalwith(13120,2);                   # Signals Tiny Skeletons - "asks them" if any of them are spawned, if so they set $skelup = 1 (prevents triggering multiple spawns)
    quest::settimer(1,10);                        # Spawn skeletons after a short delay (if none are up)
  }
}

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount, 12376) => 1){
    quest::say("Good Work. Unfortunately, I must investigate other matters in the name of Ak'anon.  Here.  You deliver the tin box to Lord Jenork of the Gem Choppers.  He shall reward you. Be safe my friend.  I must go now. Farewell.");
    quest::faction(115,15);      # Gem Choppers
    quest::faction(210,15);      # Merchants of Ak'Anon
    quest::faction(176,15);      # King Ak'Anon
    quest::faction(71,-15);      # Dark Reflection
    quest::exp(10000);
    quest::ding;
    quest::summonitem(12378);    # Give Undead Brownie Bones for turnin to Narron Jenork (Ak'Anon) 
    quest::depop();              # Despawn upon turnin
  }
  else {
    quest::say("I have no use for this.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER{
  if($timer == 1){
    if($skelup == "0"){                                 # If there are no tiny skeletons currently spawned
      quest::setglobal("skelatk","$name","3","F");      # Set global $skelatk with name of player to attack
      quest::spawn(13120,106,0,-1839.87,829.51,-9.38);  # Spawn tiny skeletons
      quest::spawn(13120,106,0,-2149.24,1035.51,18.42);
      quest::spawn(13120,106,0,-1713.59,1075.06,-10.47);
      quest::spawn(13120,106,0,-1690.69,363.48,3.60);
      quest::spawn(13120,106,0,-2604.56,222.71,10.02);
      quest::signalwith(13120,1);                       # Signal tiny skeletons - tell them to attack player $skelatk
    }
    else{                                               # If any tiny skeletons are still spawned
                                                        # Currently - don't do anything (don't spawn more)
    }
  }
  quest::stoptimer(1);
}