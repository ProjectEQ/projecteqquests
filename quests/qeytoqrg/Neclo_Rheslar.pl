#BeginFile: Neclo_Rheslar.pl
#Quest for Qeynos Hills - Neclo Rheslar: Note to Neclo

sub EVENT_SAY {
  #Nothing identified to say!
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18823=>1)) { #Note to Neclo
    quest::say("Ah.. Hello friend.. So, I see Daenor sent you.. Uh huh, ok.. Here's something that will be very useful for you. Practice this well, friend.. It will help protect you in this harsh world.");
    quest::faction(240,10);  #Order of Three
    quest::faction(21,-10);  #Bloodsabers
    quest::faction(135,10);  #Guards of Qeynos
    quest::faction(235,-10); #Opal Dark Briar
    quest::exp(1000);
    quest::summonitem(15288); #Spell: Minor Shielding
  }
  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}


#END of FILE Zone:qeytoqrg  ID:4106 -- Neclo_Rheslar 

