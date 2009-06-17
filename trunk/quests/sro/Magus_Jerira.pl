#BeginFile: sro\Magus_Jerira.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("And how are you today, $name?  Ready to do some traveling? Hurry up, then. I have lots of things I need to do today. Tell me where you would like to go and I will send you there. I can send you to any of the other camps in [Everfrost], [Commonlands], [Nedaria's Landing], [North Ro], or [South Ro]. Hopefully I won't burn my hands this time! Long story, but my cohort, Gaelan Charhands, didn't tell me one of the words of the spell as a joke. Apparently it's funny for a beautiful gnome like myself to get her hands singed. I'll get him back some day!");
      }
      if($text=~/everfrost/i) {
        quest::movepc(30,-5040,1880,-59,0); #Everfrost Peaks 
      }
      if($text=~/commonlands/i) {
        quest::movepc(22,-105,-1640,5,0); #East Commonlands
      }
      if($text=~/nedaria/i) {
        quest::say("I'm sorry, $name. The Gates of Discord zones are not yet available.");
        #quest::movepc(); #Nedaria's Landing
      }
      if($text=~/north ro/i) {
        quest::movepc(34,900,2650,-24,0); #Northern Desert of Ro
      }
      if($text=~/butcherblock/i) {
        quest::movepc(68,-2500,-1105,1,0); #Butcherblock Mountains
      }
    }
    else { #PC does not have Adventurer's Stone
      quest::say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it. Perhaps you should talk to another at this camp to see if they have any use for you.");
    }
  }   
  else { #PC is not at appropriate level yet
    quest::say("You will have to excuse me, I am quite busy."); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

#EndFile: sro\Magus_Jerira.pl