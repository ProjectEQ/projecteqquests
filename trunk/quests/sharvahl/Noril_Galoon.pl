#Noril_Galoon.pl  ID 155059

sub EVENT_SAY {
  if ($text=~/spare time/i) {
    quest::say("Shields and bucklers are very versatile. They can be used to deflect blows, knock your opponents off balance, and even offer a secondary form of attack. If you want me to help you to modify your shield, I'll need you to gather some rough ore pieces. They can be taken from the rhinobeetles that reside in the moor. Place them in a forge with a flask of water and your set of files to create bolts. Combine the full bag of bolts and return the product and the buckler to me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5545 =>1 )) {
    quest::emote("examines the hilt for a moment and hands the sword back to you.");
    quest::say("This looks like it will work fine.' He says. 'If you are up to doing me a favor, I can teach you how to modify your shield as well. Take this bag and these files and come back to me when you have some [spare time] and want to learn more about shields.");
    quest::summonitem(5545);
    quest::summonitem(17605);    
  }
  if (plugin::check_handin(\%itemcount, 5556 =>1, 3452=>1 )) {
  quest::say("Thanks for the Bag of Bolts $name.");
  quest::say("Thank you for making those for me. I was almost out. I'll modify your buckler immediately after I finish what I am doing here. Meanwhile, take this shopping list to Friaz. Do what you can to assist her. I need the bag of beetle horns she will give you if I am to work on your shield today.");
  quest::summonitem(18321);
    
  }
  if (plugin::check_handin(\%itemcount, 5549 =>1 )) {
    quest::say("Great work $name.  Thanks for the tools to finish your upgrade.  Here is your new shield.  Take your buckler, cloak and sword back to Armsman Khaigesh and show him the progress you have made.");
    quest::summonitem(5550);
    quest::exp(2000);
    quest::faction( 132,10 );
  }
  plugin::return_items(\%itemcount);
}
#endoffile  Noril_Galoon  ID 155059