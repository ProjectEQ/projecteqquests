sub EVENT_SAY {
   if($text=~/hail/i)   {
	quest::say("Greetings $name. Lately the creatures of Lake of Ill Omen have be causing problems for us. Are you [interested] in helping me reduce the threat from this creatures?");
   }
   if($text=~/interested/i)   {
	quest::say("Good. Bring me a Brittle Iksar Skull, a Sabertooth Cub Canine, and a Large Scorpion Pincer. And i shall reward you with a spell.");
   }
}

sub EVENT_ITEM {
  $spellnum = quest::ChooseRandom(15338,15344,15339,15340,15225,15229,15346,15491,15502,15341,15342,15347,15348,15331,15221,15343); #I am not 100 percent sure on this spells list. It is simply everything he sells I gathered from the information available that this is correct. 
  if (plugin::check_handin(\%itemcount, 12739 => 1, 12659 => 1, 12426 => 1)) {
    quest::say("Good Work $name. This will surely hold back those vile creatures for some time. Here is your spell.");
    quest::summonitem($spellnum);
    quest::exp(10);
  }
  plugin::return_items(\%itemcount);
}

#Dialogue is made up since I was not able to find the correct dialogue on Alla's
#End of File zone:cabwest ID: 82038 -- Keeper Bile
#By Kovou