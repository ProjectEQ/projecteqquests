#BeginFile: poknowledge\#Ruandia.pl
#Quest file for Plane of Knowledge - Ruandia: Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name."); #Real text still needed
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22691 => 1)) { #Drawing of Rune
    quest::emote("takes the drawing from you and studies it for a moment. Her face turns pale as a look of fear overcomes her. 'You must stop your quest for whatever this rune deals with. It will only lead to your demise. This rune has many meanings; the main meaning essentially being 'discord'. I am hesitant to tell you more about it, but I am sure Kazen would not be pleased.' Ruandia writes some directions onto the drawing. 'I am not responsible for the outcome of your quest. Keep that in mind.'");
    quest::summonitem(10138); #Ruandia's Instructions
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: poknowledge\#Ruandia.pl (202272)