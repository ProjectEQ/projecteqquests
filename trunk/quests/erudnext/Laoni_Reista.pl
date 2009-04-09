sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Very good to make your acquaintance. $name. If you are a [new knight]. then let it be known. for I am seeking young knights of Deepwater.");
  }
  if($text=~/i am a new knight/i){
    quest::say("You do seem a bit young. We shall have to test your mettle. Within this temple. you shall learn to swim as fast as the swordfish and attack with the bravery and skill of the shark. Are you willing to [assist with the cleansing of the ocean]?");
  }
  if($text=~/i will assist with the cleansing of the ocean/i){
    quest::say("Go to the waters near the harbor. We have heard of Qeynos' rogue guild attempting to smuggle our valuable Vasty Deep water from Odus by way of swimmers. We require proof of their involvement. It is said they often carry special coins. Return one of these coins to me."); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13881 => 1)) {
    quest::say("Good work. You have shown these rogues who are the better swimmers. Now we have proof of their involvement. You are a fine addition to the temple. Take this small reward. Go, and serve Prexus.");
    quest::faction( 79, 10);
    quest::faction( 145, 10);
    quest::faction( 143, -15);
    quest::exp(100);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:erudnext  ID:98052 -- Laoni_Reista 
