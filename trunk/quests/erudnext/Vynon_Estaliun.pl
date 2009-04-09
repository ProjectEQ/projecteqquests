sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("I welcome you to the temple of the Peacekeepers. The ways of peace and tranquility are ours to uphold. May you find a place among us. We have much work to do. If you are a paladin of this temple. you must [desire to face fear].");
  }
  if($text=~/i desire to face fear/i){
    quest::say("Very well. You shall face it. In Toxxulia Forest. you shall seek out Kerra Ridge. Once found. you will bring me the tail of a catfisher. Somehow. you shall find a way. They are weak. but they only work near the opposite side of the bridge. along the water's edge."); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13884 => 1)) {
    quest::say("Good work. I knew you could do it. Take this as reward.");
    quest::summonitem(13053);
    quest::faction( 247, 10);
    quest::faction( 145, 10);
    quest::faction( 143, -15);
    quest::exp(100);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:erudnext  ID:98043 -- Vynon_Estaliun 
