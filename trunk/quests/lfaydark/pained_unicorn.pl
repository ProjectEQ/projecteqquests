sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("snorts and stamps at the ground. An unusual angry glimmer enters the eyes of what should be one of Tunare's most peaceful creatures. Its coat seems slickened and filthy in places.");
  }
  if($text=~/corruption/i) {
    quest::emote("tosses its head back, drool falling from its mouth. 'The priests of the sick channel filth and sickness into the lands. Too late did we notice to stop them. You can though. Here, in the ocean, and the underwater city of the old. Go to those places and find the corruptions. Bring them to me.'");
  }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 20691 => 1, 20692 => 1, 20693 => 1)){
  quest::say("Take my horn, symbol of Faydwer, now cleansed, to the gnome priest. It is anathema to him, to the corrupt forces in his soul, channeled into him by his dark god and will release the grip of corruption on the land. He is close, I can feel it.");
  quest::summonitem("20694"); 
 }
}
