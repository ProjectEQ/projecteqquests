#BeginFile: natimbi\Magus_Releua.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("If you'd like to go to [Nedaria]'s Landing or to the Queen of Thorns in [Abysmal Sea], I can use my Farstone magic to send you. Speak up and tell me where you wish to travel.");
      }
      if($text=~/nedaria/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4580); #Teleport Nedaria
      }
      if($text=~/abysmal sea/i) {
        quest::emote("begins to cast a spell.");
        #quest::selfcast(); #Translocate Abysmal missing???
        quest::movepc(279,0,-199,140); #Abysmal Sea
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

#EndFile: natimbi\Magus_Releua.pl