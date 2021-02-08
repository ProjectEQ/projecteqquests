# items: 1528, 1530, 19076, 12096, 22502, 1529
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I'm not in any mood for conversation. My favorite hat was torn right from my head by a gigantic bat the other night and I am quite upset.");
  }
  if($text=~/other tasks/i) {
    quest::say("I will sew you your own personal dreadful cap if you bring me the necessary components. I will need the pelt of a feared beast, some gold thread, and an imbued amber.");
  }
  if($text=~/hat/i) {
    quest::say("It is a marvelous cap sewn from the finest textiles and imbued with the divine power of our lord of fear. Cazic Thule!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1528 => 1)) {
    quest::emote("gasps in astonishment");
    quest::say("You...you..found my hat!! This is the most I can repay you but perhaps I can reward you further for some [other tasks]?");
    quest::summonitem("1530");#black lace sash
    quest::faction("265","1");
    quest::faction("231","-3");
    quest::faction("233","-3");
    quest::faction("242","-3");
    quest::faction("254","-3");
  }
  if(plugin::check_handin(\%itemcount, 19076 => 1,12096 => 1, 22502 => 1)){#Mighty Bear Paw's Belt Gold Thread and Imbued Amber
    quest::say("Well done $name, here is your new hat wear it with pride");#couldnt find the text
    quest::summonitem(1529);#Dreadful Cap       
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:paineel  ID:75009 -- Azzar_Habbib
