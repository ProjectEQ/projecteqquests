# items: 19315, 19322, 19318, 19319, 19329, 19320, 19324, 19317
sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("And a fine day to you, too, $name! What is it that brings you here? Fortune? Adventure? In either case. it will be more fun than the duty I have. I am to acquire what scrolls I can for the High Council of Erudin. And you're also in luck, as I seek the services of a mighty adventurer like yourself. Do you wish to [aid me in my duty]?");
  }
  if($text=~/aid you in your duty/i){
    quest::say("Then you will do this for me. Venture beyond this outpost to the most distant lands and the darkest dungeons. Within them. the creatures with the greatest power will have scrolls. The residents here will be able to give you general locations of the most dangerous places. I wish to obtain the scrolls of Atol's Spectral Shackles, Tears of Druzzil, Inferno of Al'Kabor, and lastly, Pillar of Frost. Make haste, as the High Council cannot be kept waiting! Fear not. I shall [reward] you well.");
  }
  if($text=~/reward/i){
    quest::say("I am not empty-handed. I have already located some of the most rare scrolls. I'll part with one of my four for what you return to me. Fare thee well!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19315 => 1) || # Atol's spectral shackles
      plugin::check_handin(\%itemcount, 19322 => 1) || # Inferno of Al Kabor
      plugin::check_handin(\%itemcount, 19318 => 1) || # Pillar of frost
      plugin::check_handin(\%itemcount, 19319 => 1)) { # Tears of druzzil
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19329,19320,19324,19317)); # Item(s): Spell: Tears of Solusek (19329), Spell: Abscond (19320), Spell: Thunderbolt (19324), Spell: Tishan`s Discord (19317)
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}


#END of FILE Zone:firiona  ID:84166 -- Barnal_Flamehand 

