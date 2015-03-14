# Shroud of the Dar Brood

sub EVENT_SAY {
  if ($faction <= 4) {
    if ($text=~/hail/i) {
      quest::say("I do not have time for you now, $name. My son is lost, and you can not help me.");
    }
    if ($text=~/son/i) {
      quest::say("Have you seen him? I must find him, he has been gone far to long! If you have harmed him, I will slay you and all of your race! Tell me where he is!");
    }
  }
}

sub EVENT_ITEM {
  if ($faction <= 4) {
    if (plugin::check_handin(\%itemcount, 27260 => 1)) {
      quest::say("This...this is not what I had hoped for. My whelp is lost, but I take some comfort in knowing that you helped destroy his killer. Zlandicar has been a blight upon our race since the beginning. Here is your reward, as I promised. It will protect you in more ways than are obvious. Leave me now, it is time to mourn.");
      quest::summonitem(27261);
      quest::exp(150000);
      quest::faction(42,10);   #Claws of Veeshan
      quest::faction(362,10);  #Yelinak
      quest::faction(189,-30); #Kromzek
    }
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: westwastes ID: 120057 NPC: Harla_Dar