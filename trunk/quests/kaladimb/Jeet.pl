sub EVENT_SAY 
{ 
	if($text=~/Hail/i)
	{
		quest::say("What business do you have here?!!  This here is the mine and that means if you ain't a [member of Miner's Guild 628], you'd best be moving on!!");
	}
	if (($text=~/i am member of miners guild 628/i) && ($faction <= 4)) 
	{
  		quest::say("Well, then, get off yer rump and give us a hand!  If you don't have a mining pick, then get down there and use your fingernails!!  If you're new and you want to earn a pick, you can [volunteer to exterminate the rats] that have been infesting the mines!!");
	}
	elsif($text=~/i am a member of miners guild 628/i) 
	{
		quest::say("Don't take this personally,  but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
 	}
 	if (($text=~/I will volunteer to exterminate the rats/i) && ($faction <= 4)) 
 	{
   		quest::say("Well, someone has to do the dirty work around here.  Let it be you new miners.  Go patrol the mines and if you see any rats, bash them good!!  Return to me with four rat pelts and I will give you some armor as payment.  If you want a 628 mining cap, yer gonna have to smash that infernal [cleaner]!!");
 	}
 	if (($text=~/cleaner/i) && ($faction <= 4)) 
 	{
   		quest::say("Darn that blasted clockwork cleaner!!  No one in Kaladim even knows what it is! They all think it's some kinda rat in armor!!  Rat paladins?!!  The name fits.  We miners have seen many like it in the gnome city during heists, err.. visits.  We have to get rid of this one in Kaladim!!  If you smash it and get its scrap metal, I am authorized to give you a mining cap, if you are a member of Miner's Guild 628.");
 	}
}

sub EVENT_ITEM 
{
	if (plugin::check_handin(\%itemcount, 13054 =>4 )) 
	{
  		quest::say("Well done.");  
  		quest::summonitem(quest::ChooseRandom(2108,2124,2118,2116,2120,2123));
  		quest::exp(5000);
  		quest::faction(77,10);
  		quest::faction(220,10);
  		quest::faction(29,-5);
  		quest::faction(33,-5);
  	}
	if (plugin::check_handin(\%itemcount, 13218 =>1 )) 
	{
  		quest::say("Well done");
  		quest::summonitem(12165);
  		quest::exp(5000);
  		quest::faction(77,10);
  		quest::faction(220,10);
  		quest::faction(29,-5);
  		quest::faction(33,-5);
	}
	else
	{
  		#do all other handins first with plugin, then let it do disciplines
  		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  		plugin::return_items(\%itemcount);
  	}
}


sub EVENT_SIGNAL 
{
	quest::say("I am working on it, Mater!!");
}

#END of FILE Zone:kaladimb  ID:67018 -- Jeet 
