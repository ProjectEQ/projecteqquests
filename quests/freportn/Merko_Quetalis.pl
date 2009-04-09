sub EVENT_SAY 
{ 
	if($text=~/Hail/i)
	{
		quest::say("Hail. good citizen!  You have entered the Hall of Truth.  What is it you seek?  Many citizens come to request aid in dealing with the local rogues or the oppression of our sworn enemies. the Freeport Militia.  A few valiant ones have been [summoned to the Hall of Truth].");
	}
	
	if($text=~/i have been summoned to the hall of truth/i)
	{
		quest::say("You have been summoned? You do not have the look of nobility. You must be a [squire]. There are many squires who have been summoned to our Hall. Not all pass the [Test of Truth]."); 
	}
	
	if($text=~/I am a squire/i)
	{
		quest::say("Then I welcome you, Squire . Being a squire is the first step to becoming a true knight of the Hall of Truth. Remember always to protect and serve the meek. I have a [small task] which suits a squire perfectly.");
	}
	
	if($text=~/What small task/i)
	{
		quest::say("Venture to the Commonlands and seek out our noble friend Altunic Jartin. He lives and works out of his home. Hand him this note.");
		# Give player "A Note (Note To Altunic)".
		quest::summonitem("18896");
	}
	
	if($text=~/earned the Token of Generosity/i)
	{
		quest::say("Go to the deserts of North Ro. Seek out the desert tarantulas. Stand and face this dreaded creature. If you are lucky, you will find a venom sac. This is what I require. When you return, hand it to me.");
	}
	
	if($text=~/what test of truth/i)
	{
		quest::say("Only when a squire is ready, may he tempt his fate. All he need do is hand the tokens of bravery and generosity to me. If the squire survives his ordeal, then he or she shall enter the order of the Knights of Truth. The squire will be given the Testimony of Truth and become a respected knight.");
	}
	
	if($text=~/Who is Willia/i)
	{
		quest::say("She is my niece. Lucan ordered her to kill my wife.. She did. She now belongs to the Freeport Militia. As part of the militia, she must die!! Let no militia member stand in the way of nobility.");
	}
}

sub EVENT_ITEM 
{ 
	# Check for A spider venom sac.
	if(plugin::check_handin(\%itemcount, 14018 => 1))
	{
		quest::say("You have earned the token of bravery. Now you must ask yourself if you are ready to face true fear. You will have but one chance. If you feel you are powerful enough to easily slay that desert tarantula, then hand me both tokens earned and you shall face the Test of Truth.");
		
		# Give player "Token of Bravery"
		quest::summonitem("12144");
		
		# Freeport Militia Faction
		quest::faction(105, -1);
		# Steel Warriors Factions
		quest::faction(311,1);
		# Knights of Truth Faction
		quest::faction(184,1);
	} 	
	# Check for "Token of Bravery" and "Token of Generosity"
	elsif(plugin::check_handin(\%itemcount, 12144 => 1, 13865 => 1))
	{
		quest::say("Go to the open sewer across the way. Inside you shall find your opponent. Victory shall bring your final token. Return it to me. Remember our ways and remember our foes. Send them to their judgement in the afterlife. Be swift with your thoughts. May Marr be with you.");
		
		# Freeport Militia Faction
		quest::faction(105, -1);
		# Steel Warriors Factions
		quest::faction(311,1);
		# Knights of Truth Faction
		quest::faction(184,1);
	} 	
	# Check for "Token of Truth"
	elsif(plugin::check_handin(\%itemcount, 13866 => 1)) 
	{
		quest::say("You have performed well. You have shown your allegiance to truth and cast aside the Freeport Militia. The militia will surely despise you from now on. This is how they treat the Knights of Truth. Beware. The followers of Marr stand alone in this city.");
		
		# Give player "Testimony"
		quest::summonitem("18828");
		quest::givecash("0","0","6","0");
		
		# Freeport Militia Faction
		quest::faction(105, -1);
		# Steel Warriors Factions
		quest::faction(311,1);
		# Knights of Truth Faction
		quest::faction(184,1);
	}
	
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8036 -- Merko_Quetalis 