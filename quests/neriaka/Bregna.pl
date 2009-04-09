#Bregna , Neriaka, 40012
#Bregna's Big Mistake
#Need ending statement, mine sucks
#Need factions
#Changed to accommodate the Aid Garuuk/Hoop of the Traveler quest -Kilelen, 4/19/2007

sub EVENT_SAY
{
 
  if($text=~/Hail/i)
  {
  quest::say("Me says hi to you. What you want from me? Oh!! Me shaman trainer. You must be shaman. Are you [shaman Darkone]?");
  }

  if($text=~/shaman darkone/i)
  {
  quest::say("You choose rite if you bes a shaman. We's da best. You remember ta not get in Kaglari way. She get mad berry easy. She gets berry mad at Bregna if she finds out me make [big mistake].");
  }

  if($text=~/big mistake/i)
  {
  quest::say("Kaglari make me do the tasks for her. She tolds me to take crate of speshal poshuns to sumwun in Nektoolos forust. But I make mistake. I fall asleep under da trees becuz I was so tired. I wake up and poshuns are gone! Sumwun take the poshuns frum me. Dey leave dis note wit me. Me tinks dey play trick on me. Me tinks it be da stinkin' Halflings. Me needs ta gets dem back before Kaglari find out. I need sumwun to help me find da poshuns.");
  quest::summonitem(18651);
  }
}

sub EVENT_ITEM
{
  if($itemcount{77522} == 1)
  {
  quest::say("Phew!  Me are safe from Kaglari's beating.  Dank yoo, $name.  Take dis."); #Text made up, I have no reference.
  quest::summonitem(12212);
  }
  elsif (plugin::check_handin(\%itemcount, 26662 => 1, 29921 => 1, 26640 => 1, 26632 => 1)) {#Swirling Banshee Essence, Arachnae Fangs, A Wrulon Claw, A Blood Raven Tailfeather
  	quest::say("Me been waitin for doze. Dank yoo, $name.  Take dis.");
  	quest::summonitem(28740);
  }
} 