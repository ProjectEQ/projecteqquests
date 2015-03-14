#BEGIN File: cabeast\Zreezas.pl (106119)
#Quest file for Cabilis East - Claw of the Mature Patriarch (#5)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Sorry, I am busy trying to track down a traitor planning on overthrowing the Patriarchs. Unless you are [willing to help], I will have to send you on your way.");
  }
  if($text=~/help/i) {
    quest::say("Clues have lead me to believe that some corrupt individuals are working in the City of Mist and Kaesora. I have been searching in spiritual areas for clues to this traitor's name. Return to me any information which may help in my investigation.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 48062 => 1, 48063 => 1)) { #Hidden Plans (Top Half, Bottom Half)
    quest::say("Good work, $name.");
    quest::emote("fits the pieces of the plans together and studies them for a moment.");
    quest::say("Ah, so the plot thickens. It seems that the rumored attacks are set to be conducted soon. Seek out Ixthal and tell him about these attacks. If he does not believe you, show him these plans as proof.");
    quest::summonitem(48064); #Lativ's Plans
    quest::exp(15000);
  }
  plugin::return_items(\%itemcount);
}

#END File: cabeast\Zreezas.pl (106119)