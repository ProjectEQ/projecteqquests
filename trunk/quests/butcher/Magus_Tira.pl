#BeginFile: butcher\Magus_Tira.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("And how are you today, $name?  Ready to do some traveling? Hurry up, then. I have lots of things I need to do today. Tell me where you would like to go and I will send you there. I can send you to any of the other camps in [Everfrost], [Commonlands], [Nedaria's Landing], [North Ro], or [South Ro]. Hopefully I won't burn my hands this time! Long story, but my cohort, Gaelan Charhands, didn't tell me one of the words of the spell as a joke. Apparently it's funny for a beautiful gnome like myself to get her hands singed. I'll get him back some day!");
      }
      if($text=~/everfrost/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4180); #Teleport Everfrost
      }
      if($text=~/commonlands/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4176); #Teleport East Commons
      }
      if($text=~/nedaria/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4580); #Teleport Nedaria
      }
      if($text=~/north ro/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4177); #Teleport North Ro
      }
      if($text=~/south ro/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4178); #Teleport South Ro
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

#EndFile: butcher\Magus_Tira.pl