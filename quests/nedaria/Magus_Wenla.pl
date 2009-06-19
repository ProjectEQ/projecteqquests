#BeginFile: nedaria\Magus_Wenla.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("Greetings, $name. I can provide travel to other magi in [Butcherblock], [Commonlands], [Everfrost], [North Ro], and [South Ro]. I can also send you to [Natimbi], the shores of Taelosia, or to the Queen of Thorns in [Abysmal Sea]. Just tell me where you'd like to go.");
      }
      if($text=~/butcherblock/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4179); #Teleport Butcherblock
      }
      if($text=~/everfrost/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4180); #Teleport Everfrost
      }
      if($text=~/commonlands/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4176); #Teleport East Commons
      }
      if($text=~/north ro/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4177); #Teleport North Ro
      }
      if($text=~/south ro/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4178); #Teleport South Ro
      }
      if($text=~/natimbi/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4964); #Translocate Natimbi
      }
      if($text=~/abysmal sea/i) {
        quest::emote("begins to cast a spell.");
        #quest::selfcast(); #Translocate Abysmal missing???
        quest::movepc(279,-199,0,140); #Abysmal Sea
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

#EndFile: nedaria\Magus_Wenla.pl