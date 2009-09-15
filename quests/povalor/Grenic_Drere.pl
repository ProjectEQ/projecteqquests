sub EVENT_SAY 
{ 
	if($text=~/Hail/i)
	{
		quest::say("Mortals. this far into the planes?  Something that I never thought that I would see.  Regardless that does not help my situation any does it?");
	}
	elsif($text=~/situation/i)
	{
		quest::say("Not that it is your business. but this is where I call home.  I have lost track of the years that I have spent here.  This valley is my home. for I was exiled from [Mithaniel's Temple].  It is not a story that I am proud of and do not wish to share with you.  So be one with you.");
	}
	elsif($text=~/mithaniel's temple/i)
	{
		quest::say("Only a mortal would be as thick headed to know not when to take their leave.  He and his legions call his temple The Halls of Honor.  Paladins that have served him well on Norrath have the opportunity to ascend into his ranks.  They are in training to make sure that they are always prepared to defend what they believe is the right and honorable thing to do.  Mithaniel is an extremely proud being. and will accept any challenge that you may have to offer him.  If you are willing to challenge him. I may have some [information] you will find useful.");
	}
	elsif($text=~/information/i)
	{
		quest::say("There are other methods to enter the Halls of Honor than those that are readily apparent. and as a former soldier of Marr I can offer you access into the Halls; however as with all such arrangements there must be something [paid] for something earned.");
	}
	elsif($text=~/paid/i)
	{
		quest::say("I was not the only member of my squad that was sent into exile. my brothers in arms. were the impetus for our exile.  I was but a mere pawn.  They now reside in the Plane of Justice as bodiless shades.  Their punishment was too lax for their actions; I want their eternal souls to be mine.  Find a smith who will teach you to create a box of souls. weaken the shades. then capture their souls and return all three to me."); 
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 29281 => 1) && plugin::check_handin(\%itemcount, 29292 => 1) && plugin::check_handin(\%itemcount, 29293 => 1) && plugin::check_handin(\%itemcount, 29294 => 1))
	{
		quest::say("Hmm, this is minor vindication, but vindication nonetheless. I will never again fight with my old compatriots, but now I know the punishment of those responsible for my exile is fitting for their crime. We did have an agreement, and while stripped of my rank I still have my honor. This ring is what all Soldiers of Marr wear to enter the Halls of Honor, it serves no use for me any longer, it is yours now.");
		quest::summonitem(29214);
		quest::set_zone_flag(211);
	}
}
#END of FILE Zone:povalor  ID:208029 -- Grenic_Drere 