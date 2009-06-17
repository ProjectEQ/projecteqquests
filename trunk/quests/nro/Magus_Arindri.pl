#BeginFile: nro\Magus_Arindri.pl
#
#

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(plugin::check_hasitem($client, 41000)) { #Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("You endured the burning heat of the desert to come and use our magic! I'm so excited. We have been getting a lot of customers. We've only lost a few. I sometimes wonder if Vayzl has incorrectly used the spell on purpose to see the odd traveler explode into a spray of magic. I do respect her, but I just don't understand dark elves, I guess. I am far too precise and careful to make any mistakes . . . Well, not a second time. Tell me where you would like to go and I will send you there. I can send you to any of the other camps in [Butcherblock], [Commonlands], [Everfrost], [Nedaria's Landing], or [South Ro].");
      }
      if($text=~/commonlands/i) {
        quest::movepc(22,-105,-1640,5,0); #East Commonlands
      }
      if($text=~/butcherblock/i) {
        quest::movepc(68,-2500,-1105,1,0); #Butcherblock Mountains
      }
      if($text=~/nedaria/i) {
        quest::say("I'm sorry, $name. The Gates of Discord zones are not yet available.");
        #quest::movepc(); #Nedaria's Landing
      }
      if($text=~/everfrost/i) {
        quest::movepc(30,-5040,1880,-59,0); #Everfrost Peaks 
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

#EndFile: nro\Magus_Arindri.pl