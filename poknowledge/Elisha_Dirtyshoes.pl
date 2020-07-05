#Elisha_Dirtyshoes.pl
#Willamina's Needles
# items: 28086, 28087


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::say("Well, good day to you, good traveler. I am Elisha Dirtyshoes, a humble citizen of New Tanaan. Though I have never braved the dangers of an adventurer's life, I make a suitable and humble life here in this beautiful city. If you are a potter, then perhaps my wares might interest you?");
  }
  if($text=~/ring/i) {
    quest::emote("sighs and says, 'Tis a painful memory, for sure. My love for Narik fell once I met Onirelin, but my love for him was not reciprocated. Now I am left with no one to share my life, with only this ring as a reminder. Narik may have it back if he desires it, but then I shall be left truly alone. Boiron Ston once held a door open for me, such a handsome dwarf he is. If he could only find more time to spend with me, giving up this ring would be no problem at all. Do you think he likes me? Could you ask him and find out?'");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28086 => 1)) {#Letter to Elisha
    quest::emote("reads the letter and says, 'Oh happy day! Boiron will be visiting me soon. You may take Narik's ring back to him now. If you'll excuse me, I have some cleaning up to do.'");
    quest::summonitem(28087);#Narik's Ring
    quest::exp(250);
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202133 -- Elisha_Dirtyshoes 

