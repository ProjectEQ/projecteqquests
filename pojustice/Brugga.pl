sub EVENT_SAY 
{
	my $lang_skill = $client->GetLanguageSkill(19);
	if($faction <= 4 && $langid == 19 && $lang_skill >= 100)
	{
		if($text=~/Hail/i)
		{
			quest::emote("'Ragh!' His eyes you with pure hatred. 'Indigo, my dark bowels. . . treachery it is, treachery against the clan. Gharol paid! Paid for it!' He shows you his hands and grins maliciously. 'Paid, he did!");
		}
		elsif($text=~/Rare disease/i)
		{
			quest::say("You have someone that needs killing, or someone that needs saving? It not matter to Brugga, but you smell of a hero, so Brugga think there someone need saving. Well Brugga have time, so you give Brugga the disease and Brugga see.", 19);
		}
	}
	else
	{
		quest::say("I wont deal with one such as you...", 19);
	}
}

sub EVENT_ITEM
{
	my $lang_skill = $client->GetLanguageSkill(19);
	if($faction <= 4 && $lang_skill >= 100)
	{
		if(plugin::check_handin(\%itemcount, 29302 => 1))
		{
			$client->SummonItem(29302); # Item: Purified Bubonian Bile
			quest::emote("dips his finger into the flask and tastes the liquid, 'Hmm, someone start work on this already and it still vile. This nothing that Brugga have trouble to cure, we just need stronger toxins to drive this one back. Brugga need a gnome made crawlerpoison, a venom sack from the Terror Matriarch, and the stinger from a Nettling Wraith, Brugga make you a cure.");
		}
		
		if(plugin::check_handin(\%itemcount, 29297 => 1, 29298 => 1, 29299 => 1))
		{
			quest::say("Yes, Brugga work with this.", 19);
			quest::emote("Brugga chants and makes strange gestures while mixing the objects in his mortar and pestle.");
			quest::say("Ok, Brugga finished now. You have your cure, give cure with the bile and that will heal. You go now, Brugga done talking.", 19);
			quest::exp(100000);
			$client->SummonItem(29295); # Item: Vial of Opaque Fluid
		}
	}
}
