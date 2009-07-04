@FlavorText = { "I wish I was a real boy...", "We need to do something about our spider problem here, sheesh!", "Tunare and Nork sitting in a tree, k-i-s-s-i-n-g.", "Cavedude! That's the man that programmed me for evil!", "I am so sick of mushrooms.", "I saw some tiny robot walking around earlier, he was sooooo cute.", "I'm metal, cold and living in a mushroom patch, I blame Reno for all this.", "Word on the street is Daryn's really a dark elf.", "If I see that Dr. Jones guy again I'm going to give him a piece of my mind.", "I hate things smaller than me." };

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::setnexthpevent(16);
	}
	elsif($combat_state == 1)
	{
		my $random_select = rand(1);
		if($random_select == 0)
		{
			quest::say("Ooooh, toys for me?");
		}
		else
		{
			quest::say("I'm ready to play!");
		}
	}
}

sub EVENT_SPAWN
{
	quest::settimer("random_talk", (rand(480)+120));
	quest::setnexthpevent(16);
}

sub EVENT_TIMER
{
	if($timer eq "random_talk")
	{
		quest::stoptimer("random_talk");
		quest::settimer("random_talk", (rand(480)+120));
		if($npc->IsEngaged() != 1)
		{
			my $rand_select = rand(9);
			quest::say("$FlavorText[$rand_select]");
		}
	}
}

sub EVENT_HP
{
	if($hpevent == 16)
	{
		quest::say("I'm a charging my lasers!");
		$npc->CastSpell(4674, $npc->GetID(), 10, 0);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("random_talk");
	quest::say("I don't want to play with you anymore...");
}