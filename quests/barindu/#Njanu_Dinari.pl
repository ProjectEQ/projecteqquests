# Help Kayin Escape

# Created by Gonner

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote(" glances around to make sure no one else is listening in. You look like someone with the strength to help a good [friend] of mine.");
  }
  if($text=~/friend/i) {
    quest::say("Kayin Wanjala has been a friend of mine for as long as I can remember and has been a bit hot-headed even longer. A few days ago, one of the guards lashed him for working too slow and Kayin hit the guard! I figured Kayin was done for, but the guard just laughed, hefted Kayin up over his shoulder, and dragged him off. I got word this morning that Kayin is still alive, but not for much longer. I know where he is [being kept].");
  }
  if($text=~/being kept/i) {
    quest::say("The guards took him to coliseum where he is being held as fodder for the games. Please, help my friend! I know he got himself into this bind, but he's really a good person and doesn't deserve to be fed to the hynids.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 64015 => 1)) { # Head of Ra'Tuk Hrux Vexkit V2
    quest::say("Kayin has escaped? That's wonderful news! I feared he had already been killed in the games. Please, take this ring as a token of my thanks. It was given to me by my father and Proteri Amari tells me there is some magic within the stone.");
    quest::summonitem(64016); # Crude Stone Ring
    quest::faction(231,5); # Nihil
    quest::exp(25000);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
# END of FILE Zone:Barindu  ID:283087, 283126, 283141 -- #Njanu_Dinari.pl