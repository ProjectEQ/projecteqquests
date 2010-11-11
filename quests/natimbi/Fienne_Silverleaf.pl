# Fienne's Wildlife Specimens

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("nods briskly at you.");
    quest::say("You are welcome here. Have you had a chance to observe the [wildlife] yet?"); 
  }
  if ($text=~/wildfire/i) {
    quest::say("There is a myriad of strange new creatures in this land, and all are quite interesting. There is one in particular that I cannot seem to decipher. I cannot ascertain what sort of creature they are precisely, we have been calling them stonemites. It is most disconcerting to a scientist such as myself. If you could catch me a few [specimens] it would be most appreciated."); 
  }
  if ($text=~/specimins/i) {
    quest::say("That is actually the majority of my problem. They have the most peculiar makeup. I have been unable to capture any alive, and their structure is very delicate. If you could continue attempting to get the pieces intact, it would be VERY helpful. I believe with the legs, shell, meat, and eye I should have enough material to make an astute analysis. I have a lovely string of pearls for your trouble."); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 54085 => 1, 54084 => 1, 54087 => 1, 54086 => 1)) { # Intact stomemite shell, legs, eye and meat
    quest::say("Wonderful! I should be able to garner quite a bit of information with these specimens. Here are those pearls I mentioned."); 
    quest::exp(12000);
    quest::summonitem(54092); # Strand of Sea Pearls
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE zone:natimbi ID:280043 -- Fienne_Silverleaf.pl