#Begin File qrg\Qaelin_Hailstorm.pl (3042)
#Quest file for Surefall Glade - Qaelin Hailstorm: Mark of Karana

sub EVENT_SAY {
  $deity = $client->GetDeity();

  if($text=~/hail/i) {
    quest::say("What do you need? I am terribly busy..."); #Made up text
  }
  if($text=~/mark/i) {
    if($deity == 207) { #Karana
      quest::say("Ah yes, here is a mark for worshippers of Karana."); #Made up text
      quest::summonitem(66172); #Mark of Karana
    }
    else {
      quest::say("I am sorry, but I can only help worshippers of Karana."); #Made up text
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#End file qrg\Qaelin_Hailstorm.pl (3042)