#BeginFile: ecommons\Magus_Zeir.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("Welcome, brave $name. You have to be brave to entertain the use of our magic. It's not that I don't trust the spell or my companions, it's just that the auras of the stones we found are so unstable and strange. We are still trying to learn the nature of the magic. It really is unlike any other magic we've seen on Norrath, and it's very powerful. One time, when I cast the spell on a young Vah Shir, she burst into a furry cloud of . . . Perhaps I shouldn't talk about that. Tell me where you would like to go and I will send you there. I can send you to any of the other camps in [Butcherblock], [Everfrost], [Nedaria's Landing], [North Ro], or [South Ro].");
      }
      if($text=~/everfrost/i) {
        quest::movepc(30,-5040,1880,-59,0); #Everfrost Peaks 
      }
      if($text=~/butcherblock/i) {
        quest::movepc(68,-2500,-1105,1,0); #Butcherblock Mountains
      }
      if($text=~/nedaria/i) {
        quest::say("I'm sorry, $name. The Gates of Discord zones are not yet available.");
        #quest::movepc(); #Nedaria's Landing
      }
      if($text=~/north ro/i) {
        quest::movepc(34,900,2650,-24,0); #Northern Desert of Ro
      }
      if($text=~/south ro/i) {
        quest::movepc(35,1030,-1440,-23,0); #Southern Desert of Ro
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

#EndFile: ecommons\Magus_Zeir.pl