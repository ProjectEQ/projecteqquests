#BeginFile: abysmal\Magus_Pellen.pl

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000) || $client->KeyRingCheck(41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("I can provide you with travel to [Natimbi] and [Nedaria]'s Landing with our Farstone magic. Just tell me where you'd like to go and I shall send you.");
      }
      if($text=~/nedaria/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4580); #Teleport Nedaria
      }
      if($text=~/natimbi/i) {
        quest::emote("begins to cast a spell.");
        quest::selfcast(4963); #Natimbi Gate
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

#EndFile: abysmal\Magus_Pellen.pl