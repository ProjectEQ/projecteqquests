#zone: gunthak NPC: Osborne (224199)
#Angelox
# items: 59515, 21820, 59516, 21821, 59517, 21822, 59518, 21823

sub EVENT_SAY { 
if ($text=~/Hail/i){
  #quest::say("WHAT! I didn't do anything, leave me alone! Oh. . . You're here about a drogmor. . .very sorry I didn't realize. The red ones are very. . .energetic? But I've been trained to handle them. If you've got a wild one you want to get rid of, show me your drum and I'll see what I can do with it.");
  quest::emote("'s eyes dart around the lighthouse crazily. 'WHAT! I didn't do anything, leave me alone! Oh . . . You're here about a drogmor . . . very sorry I didn't realize. The red ones are very . . . energetic? But I've been trained to handle them. If you've got a wild one you want to get rid of, show me your drum and I'll see what I can do with it.'");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,59515 => 1)) {
    quest::summonitem(21820); # Item: Bag of Platinum Pieces
  }
  elsif(plugin::check_handin(\%itemcount,59516 => 1)) {
    quest::summonitem(21821); # Item: Heavy Bag of Platinum
  }
  elsif(plugin::check_handin(\%itemcount,59517 => 1)) {
    quest::summonitem(21822); # Item: Big Bag of Platinum
  }
  elsif(plugin::check_handin(\%itemcount,59518 => 1)) {
    quest::summonitem(21823); # Item: Huge Bag of Platinum
  }
  plugin::return_items(\%itemcount);
}