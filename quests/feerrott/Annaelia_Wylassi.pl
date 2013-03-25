#Annaelia Wylassi is a gnome necromancer for the Whistling Fists quest line. By interacting with her, we can get one of the sets of bones that we need to combine in Cazic Thule's pack.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("If you have nothing other than a hail to offer me you best move along, I need concentration to study these odd bones that I unearthed. Funny thing about them though, they seem to resonate a hum. Quite unusual, you probably aren't [interested] in that though.");
 }
 elsif($text=~/interested/i){
  quest::say("Are you? I didn't take you for a necromancer. I tried to reanimate these remains but due to the vibration it was too unstable and collapsed. I have given up trying to animate them. I would need more supplies if I were to try again. I am too busy with other research to care though. If you are so interested you could go fetch the supplies for me. I suspect the bone structure is of a human, so I would need a vial of human blood. A jade inlaid coffin would be needed to perform the ritual in. Also a vial of clear mana to bind the bones with strong magic, and an essence emerald to complete the ritual.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 22514 => 1, 17355 => 1, 10252 => 1, 9963 =>1)){
  quest::say("I will now try the reanimation.' Streams of mana surround the bones but nothing happens. Annaelia looks annoyed. 'Worthless bones! Why do they hum like this? Grah, I don't care I have too much to study. You want them? Take them!'");
  quest::summonitem(7984);
  quest::exp(60000);
  quest::ding();
 }
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills