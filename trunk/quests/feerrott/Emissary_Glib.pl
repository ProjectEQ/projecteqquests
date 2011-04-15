sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::say("Gloop.. Are you the one? Who sent you?");
  
  }
  if ($text=~/The Greenblood Shaman sent me/i) {
    quest::say("Gloop.. Good. I am the secret emissary of the frogloks of Guk. I have come to help your community, provided, that is, that you help mine. Gloop.. I want you to track down and kill the troll hunters called 'slayers.' They are capturing our foragers in the swamps. Return their slayer necklaces to me and I shall pay you, but most important, find the slayer captain. Bring me his captain's necklace and I shall give you a secret. I must leave soon. If you need me, just ask Marda where I am.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13369 => 1)) {
    quest::say(".. Good work. That is one less troll slayer. My people shall learn of your good deed. Please search for the slayer captain. He must be stopped.");
    quest::faction( 233, 20);
    quest::exp(200);
    quest::givecash(0,0,7,5);
  }
  if (plugin::check_handin(\%itemcount, 13370 => 1)) {
    quest::say("'Oooh!! .. You have dispatched the slayer captain. It will take them time to reorganize the slayers. During this time the froglok foragers can gather more provisions for Guk. Please take this as a token of my people's appreciation. Your standing with my brethren has grown. As for Marda's information.. within Grobb lies my aide, Groak. He was captured. Tell him Glib sent you.");
    quest::faction( 233, 20);
    quest::exp(200);
    quest::givecash(0,0,1,0);
    quest::summonitem(quest::ChooseRandom(17928,13371));
  }
}