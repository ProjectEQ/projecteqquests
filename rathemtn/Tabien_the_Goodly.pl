# items: 1676, 1677, 1670
sub EVENT_SAY {
 if($text=~/hail/i){ #Part of Shaman Epic 1.0
  quest::say("Oh thank Marr you are here, $name. I was beginning to think I would be abandoned in my time of need. I have a [" . quest::saylink("task") . "] for you to complete in the name of my patron Mithaniel Marr.");
  }
 elsif($text=~/task/i){ #Part of Shaman Epic 1.0
  quest::emote("displays his shield that must once have been shining and regal but is now scoured in cuts, dents, and chipped paint. He says, 'This shield is known as Marr's Promise. It is a sacred relic that was actually used by one of Mithaniel's angels on the Plane of Valor. Its value to our church is immeasurable and I have been charged with the protection of it. However, a patriarch of the false god, Bertoxxulous, is after my shield and me. He must be stopped! Please, destroy him and bring me proof of his death.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 1676 => 1, 1677 => 1)) { #Part of Shaman Epic 1.0
  quest::say("Ahh, thank Mithaniel you have put Glaron and his terrible reign to an end! You have done the world a great service by carrying out my instructions. Take this gem and give it to the one who sent you. He will reward you as befits such an accomplished mercenary such as yourself. Oh, and Marr be with you!");
  quest::summonitem(1670); # Item: Marble Pebble
  quest::depop_withtimer();
 }
  plugin::return_items(\%itemcount);
}
