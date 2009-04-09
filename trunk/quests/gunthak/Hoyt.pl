sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Greetings $name, I suppose you're here looking at the fine drogmors my friend Hizaklom has for sale.  Fine, fine beasts they are.  They'll most assuredly get you where you want to go, and safely at that! Of course, if you decide that you're not happy with one of them I'm sure we can work out a deal.  I'm in charge of the white variety.  Which are obviously the best I might add.  I won't touch any other color.  Give me your calling drum and I'll give you a fair price for it.");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,59500=> 1)){
    quest::summonitem(21820);
}
  elsif(plugin::check_handin(\%itemcount,59501=> 1)){
    quest::summonitem(21821);
}
  elsif(plugin::check_handin(\%itemcount,59502=> 1)){
    quest::summonitem(21822);
}
  elsif(plugin::check_handin(\%itemcount,59503=> 1)){
    quest::summonitem(21823);
}
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
