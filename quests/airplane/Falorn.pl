sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Do not waste my time, $name.  Do you wish to take the test of blades or not? Or do you have one of my old trinkets you wish to trade in?");
}
if($text=~/trinkets/i){
quest::say("Ahh, I've given out some lesser trinkets in the past that many have gotten bored with.  I'm willing to accept Aerated Pauldrons in trade for Pauldrons of the Blue Sky.");
}
if($text=~/blades/i){
quest::say("The test of blades is not easy.  I hope you are as powerful as you are brave.  What do you wish to strive for? Strength, force, or skill?");
}
  if ($text=~/strength/i) { #warrior test of strength
    quest::say("Remember, true strength lies not only in the body, but in the mind as well. Return to me a bronze disc, a small pick and a stone amulet. If you manage to do this my runed wind amulet will be yours.");
    }
  if ($text=~/force/i) { #warrior test of force
    quest::say("Foolishness or bravery Gendal?  We shall see. Return to me a pearlescent globe, a silver mesh and a spiroc air totem  In return, you will receive both my deepest respect and the aerated pauldrons.");
    }
  if ($text=~/skill/i) { #warrior test of skill
    quest::say("The test of skill it is. Go upward and retrieve these three items: an ivory tessera, a tiny ruby, and an azure ring. Return these to me and the azure ruby ring shall be yours.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20935 => 1, 20972 => 1, 20973 => 1)) {

#warrior test of strength using bronze disc, small pick, stone amulet
    quest::summonitem(14569); #runed wind amulet
    quest::exp(100000);
    quest::say("You have proven yourself worthy.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20942 => 1, 20974 => 1, 20975 => 1)) {

#warrior test of force using pearlescent globe, silver mesh, spiroc air totem
    quest::summonitem(4321); #aerated pauldrons
    quest::exp(100000);
    quest::say("You have proven yourself worthy.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20928 => 1, 20795 => 1, 20971 => 1)) {

#warrior test of skill using ivory tessera, tiny ruby, azure ring
    quest::summonitem(14551); #azure ruby ring
    quest::exp(100000);
    quest::say("You have proven yourself worthy.");
    quest::depop();
    }
    plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("depop"); 
  quest::depop();
}