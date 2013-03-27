sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You are on the grounds of the Brood of Kotiz. If you do not belong, you must leave at once. There shall be no [third rank skullcap] for you.");  
  }
  if ($text=~/third rank skullcap/i) {
    quest::say("I offer the third rank apprentice skullcap to those who wear the second. If that is you, then you will do the [bidding of the tower].");
  }
  if ($text=~/bidding of the tower/i) {
    quest::say("Take this glass canopic. Within it you shall place a brain for me. The brain I seek is that of a sarnak crypt raider. Any shall do. The ones we seek should be near the Lake of Ill Omen. When you obtain the brain, you must quickly put it into the glass canopic with [embalming fluid]. When these are combined, the canopic shall seal and if you return it to me with your second rank skullcap, I shall hand you the next and final skullcap."); 
    quest::summonitem(17023);
    quest::say("You shall get no skullcap until I have the preserved raider brain and your second circle apprentice skullcap.");
  }
  if ($text=~/embalming fluid/i) {
    quest::say("Embalming fluid is created through brewing, but do not drink it!! You can learn about the process of brewing on our grounds."); 
  }
}

sub EVENT_ITEM {
  # preserved sarnak brain && necro skull cap 2, gives skull cap 3
  if (plugin::check_handin(\%itemcount, 12411 => 1, 4261 => 1)) { 
    quest::say("You have done well. Here is your final apprentice skullcap."); 
    quest::exp(150); 
    quest::faction(193,20);
    quest::faction(24,20);
    quest::summonitem(4262);
    quest::givecash(0,0,10,0);
  }
  elsif (plugin::check_handin(\%itemcount, 14794 =>1 )) {
    quest::emote("takes the note and after reading a few lines opens his eyes wide in astonishment. He looks up at you and stares at you a while before he says,");
    quest::say("You spoke to the Brothers? A common soldier such as yourself interested in silly stories to frighten broodlings? Fine, then. You shall know confidence, if you live. If you have the strength to stride into a lair, go before the owner, and kill that thing in its own home, you will acquire a small part of the virtue we as necromancers must master to ply our art. In the Frontier Mountains lives a unit of the troublesome burynai. Invade their home and destroy their leader. Bring me proof and two fire emeralds.");
  }
  elsif (plugin::check_handin(\%itemcount, 14810 =>1, 10033 =>2 )) {
    quest::say("Well done, here is your reference.");
    quest::summonitem(14813);
    quest::ding();
    quest::exp(10000);
     
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:cabwest  ID:3433 -- Master_Rixiz 

