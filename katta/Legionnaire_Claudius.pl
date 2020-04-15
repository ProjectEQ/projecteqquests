sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("ZZZzzzzzzzzzzz");
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29845 => 1)) {#Field Orders
    quest::say("Huh? What? Oh, umm, let's see here... OK I best get these taken care of right away. Thank you.");
    quest::faction( 1503, 20); # Faction: Validus Custodus
    quest::faction( 1502, 20); # Faction: Katta Castellum Citizens
    quest::faction( 1504, 20); # Faction: Magus Conlegium
    quest::faction( 1505, -50); # Faction: Nathyn Illuminious
    quest::faction( 1525, -50); # Faction: Coterie Elite
    quest::faction( 1483, -50); # Faction: Seru
    quest::faction(1484,-50); # Faction: Hand of Seru
    quest::faction(1485,-50); # Faction: Eye of Seru
    quest::faction(1541,-50); # Faction: Hand Legionnaries
  }  
  }
}
