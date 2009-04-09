# Necromancer Epic NPC -- Jzil_GSix
sub EVENT_SPAWN { 
  quest::settimer("depop",300);
  }

sub EVENT_SAY { 
  if($text=~/hail/i) {   
    quest::say("Ah, so you have come to be tested. Many fine things can be your

reward. There are three tests which I can administer. Shall you take the test of

flight, power, or mind? "); 
    }
  if($text=~/flight/i) { #necromancer test of flight
    quest::say("So, you wish the test of flight? So be it. You must return to me a

Verdant Tessera, an Ebon Shard, and a Griffons Beak to reap your rewards. May the

darkness guide your steps.");
    }
  if($text=~/test of power/i) { #necromancer test of power
    quest::say("The test of power it is. Prove yourself worthy of power and bring

me a silver disc, spiroc feathers, and a black silk cape. Only then will you know

true power.");
    }
  if($text=~/mind/i) { #necromancer test of mind
    quest::say("So, the test of mind it shall be. You must return to me, from this

place of air and mist a Rogous Globe, some Djinni Blood, and some Fine Cloth

Raiments. Then, and only then, you shall have the reward that you deserve!");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20932 => 1, 20780 => 1, 20781 => 1)) {

#necromancer test of flight using verdant tessera, ebon shard, griffon's beak
    quest::summonitem(27712); #bloody griffon-hide wrist guard
    quest::exp(1000000);
    quest::say("Very good. Now take this and leave me.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20938 => 1, 20782 => 1, 20783 => 1)) {

#necromancer test of power using silver disc, spiroc feathers, black silk cape
    quest::summonitem(1278); #cloak of spiroc feathers
    quest::exp(1000000);
    quest::say("Very good. Now take this and leave me.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20945 => 1, 20784 => 1, 20785 => 1)) {

#necromancer test of mind using rogous globe, djinni blood, fine cloth raiment
    quest::summonitem(1279); #bloodsoaked raiment
    quest::exp(1000000);
    quest::say("Very good. Now take this and leave me.");
    quest::depop();
    }
  else {
    quest::say("Fool! I do not need these!");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
    quest::depop();
    quest::stoptimer("depop");
} 