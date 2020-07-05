# items: 52176, 52177
sub EVENT_SAY {
  if($text=~/hail/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
       quest::say("You haven't come to demand something of me, have you? I've been subjected to enough atrocities already. Please leave this old man in peace.");
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52176 =>1 )) {
    quest::emote("nods solemnly");
    quest::say("Hmm . . . I see. So Pandula is contemplating leaving this world. There is no doubt that these are hard times. Our people are strong however, and nothing will truly break our spirit. Please let Pandula know that the gods have not forgotten us. Bring her this holy symbol.");
    quest::summonitem(52177); # Item: Symbol of Faith
    quest::exp(10000);
    quest::faction(1770,10); # Faction: Yunjo Slave Resistance
    quest::faction(1771,-10); # Faction: Gladiators of Mata Muram
  }
  plugin::return_items(\%itemcount);
}
