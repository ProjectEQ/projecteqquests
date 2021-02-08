# items: 18331, 29844
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I am Governor Markil Jurbac. It is my primary duty to uphold the law in Katta Castellum. How may I be of assistance to you?");
  }
  sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 18331 => 1)) {#Sealed Message
      quest::emote("Markil Jurbac lowers his head and mourns the loss of Halle. 'Tis the greatest shame of all when good people are lost to the most cowardly of deeds. I will seek Governor Tilbok's council in this matter... I have never been able to wrap my head around this kind of treachery and he may very well have more information. Give this dossier to Tilbok, it has all of the information he will need.");
      quest::faction( 1503, 1); # Faction: Validus Custodus
      quest::faction( 1502, 1); # Faction: Katta Castellum Citizens
      quest::faction( 1504, 1); # Faction: Magus Conlegium
      quest::faction( 322, -1); # Faction: Miners Guild 628
      quest::faction( 1506, -1); # Faction: Coterie of the Eternal Night
      quest::faction( 1483, -1); # Faction: Seru
      quest::faction( 1484, -1); # Faction: Hand of Seru
      quest::faction( 1485, -1); # Faction: Eye of Seru
      quest::summonitem(29844); #Dossier
    }
  }
}
