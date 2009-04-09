sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20695 => 1)) {
  quest::emote("grabs the heart as you toss it to him before realizing what it is. As soon as it touches his hands, his body convulses, a sickly light emanating from his eyes and oozing cracks appear in his skin. As he melts into the ground, a small glowing ball floats where he once stood.");
quest::depop();
quest::summonitem(20698);
}
 }