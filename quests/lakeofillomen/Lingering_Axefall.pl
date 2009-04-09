# First Zerker. Event
# Lake of Ill Omen
# 
#
#
#
#
#
# 9/13/07
# Written: Wizardanim


sub EVENT_ITEM

{
	if (plugin::check_handin(\%itemcount, 60189 => 1)) #axe of the spirit
		{
		$axe=1;
		$beast=1;
		quest::say("Ah, yes. The signature axe of my good friend, McArik. Here to test your control, hm? I hope you have better luck than I did. As you can see, I didn't fare so well against the enemy I was sent to [defeat]. Here, take these. I fashioned them for you from McArik's throwing axe. You will need them.");
		quest::summonitem(60191);
		quest::summonitem(60191);
		quest::summonitem(60191);
		}

	else
		{
		plugin::return_items(\%itemcount);
		}


}

sub EVENT_SAY

{

	if ($text=~/defeat/i && $class eq "Berserker" && $beast == 1)
		{
		quest::say("Argh, it has sensed my presence. It is near! You must protect me and save me from this beast. If you do, you will pass this test. You must yourself take a tooth from its mouth as evidence to show to McArik that you've passed this trial.  Tell me if you [need more axes].");
		quest::spawn2(85225,0,0,2158,70,102,60); #An_Impervious_Bloodbeast
		$phasetwo=1;
            $beast=undef;
		}


	if ($text=~/need more axes/i && $axe == 1)
		{
		quest::say("More Axes?");
		quest::summonitem(60191);
		quest::summonitem(60191);
		quest::summonitem(60191);
		}


	if ($text=~/ready for this challenge/i && $phasetwo == 1)
		{
		quest::say("The challange is for ye, and ye alone. If you have anyone try to assist ye, ye will fail. Do not attempt to cheat yerself of yer own development. Ye must seek out Mardic Crimsonsteel and get his guidance. He will prepare ye to fight a mirage of a berserker that has been created through years of refined magic. I cannot tell ye the source of such magic, but ye must know that I used that mirage as me sparring partner, constantly improving me skills against it and advancing. Perhaps now it's yer turn to face it... alone. Take this sealed note to Mardic. It will give him instructions for yer test.");
		quest::summonitem(60195); #A sealed note for mardic
		$phasetwo=undef;
		}

}



sub EVENT_SIGNAL

{
	if ($signal == 1)
		{
		$axe=undef;
		$phasetwo=1;
		quest::settimer(1,5);
		}
}
#EndFile lakeofillomen\Lingering_Axefall.pl ()