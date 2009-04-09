sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I am Governor Markil Jurbac. It is my primary duty to uphold the law in Katta Castellum. How may I be of assistance to you?");
  }
  sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 18331 => 1)) {#Sealed Message
      quest::emote("Markil Jurbac lowers his head and mourns the loss of Halle. 'Tis the greatest shame of all when good people are lost to the most cowardly of deeds. I will seek Governor Tilbok's council in this matter... I have never been able to wrap my head around this kind of treachery and he may very well have more information. Give this dossier to Tilbok, it has all of the information he will need.");
      quest::faction( 350, 50);
      quest::faction( 168, 50);
      quest::faction( 206, 50);
      quest::faction( 220, -50);
      quest::faction( 55, -50);
      quest::faction( 284, -50);
      quest::faction( 139, -50);
      quest::faction( 96, -50);
      quest::summonitem(29844); #Dossier
    }
  }
}