sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Hey there. Come to take a swim?");
		}
	if($text=~/mission/i)
		{
		quest::say("Well, since you are so inquisitive I will tell you. The orders say to go to Maidens Eye and investigate reports of Vampyres in the area. Vampyres! Are the kidding?! I am just a Centurion! I know, I will continue to keep this area secure while you go investigate. Bring me sufficient proof of their existence in the area. Four piles of vampyre ashes should cover it. Well, get going! This mission isnt going to finish itself.");
		}
}

sub EVENT_ITEM
{
  my $combine = quest::ChooseRandom(5303,5304,5305,5313,6303,6311,6312,7300,7301,7311,7499);
  if (plugin::check_handin(\%itemcount, 6514 => 1)) {
    quest::say("Bah, why do I always get stuck with the hard jobs. Here I am, out here patrolling the area in all this danger! They send me to even more threatening conditions? The life of a soldier is a hard one I tell ya! Oh well, off to do these orders I suppose. A shame no one will help me I am sure there is fame and fortune in the [mission]. More for me I suppose.");
  }
  if (plugin::check_handin(\%itemcount, 2692 => 4)) {
    quest::say("Hah! I knew that we could do it! Oh, you can take my weapon for helping me out again. I will just tell the Hand it was lost in battle. I guess that I better take this evidence back to the Hand, right after one more lap!.");
    quest::summonitem($combine);
    quest::faction(284,2); #Seru
  }
  else {
    plugin::return_items(\%itemcount);
  }
}


#End of File zone: dawnshroud ID: 174060 -- Centurion_Peran
#By Kovou
