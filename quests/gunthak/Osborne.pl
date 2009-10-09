#zone: gunthak NPC: Osborne (224199)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  #quest::say("WHAT! I didn't do anything, leave me alone! Oh. . . You're here about a drogmor. . .very sorry I didn't realize. The red ones are very. . .energetic? But I've been trained to handle them. If you've got a wild one you want to get rid of, show me your drum and I'll see what I can do with it.");
  quest::emote("'s eyes dart around the lighthouse crazily. 'WHAT! I didn't do anything, leave me alone! Oh . . . You're here about a drogmor . . . very sorry I didn't realize. The red ones are very . . . energetic? But I've been trained to handle them. If you've got a wild one you want to get rid of, show me your drum and I'll see what I can do with it.'");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,59515 => 1)) {
    quest::summonitem(21820);
  }
  elsif(plugin::check_handin(\%itemcount,59516 => 1)) {
    quest::summonitem(21821);
  }
  elsif(plugin::check_handin(\%itemcount,59517 => 1)) {
    quest::summonitem(21822);
  }
  elsif(plugin::check_handin(\%itemcount,59518 => 1)) {
    quest::summonitem(21823);
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}