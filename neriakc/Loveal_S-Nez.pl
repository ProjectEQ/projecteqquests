#Loveal_S-Nez.pl
#Sir Lindeal's Testimony/Thex Mallet/SK Trainer
# items: 18828, 2317, 13390, 5374, 18889, 13009, 13005, 13002

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("What is this I see before me? A would-be hero of the Dead? You reek of false bravado. I have seen others much stronger than you meet their fate at the end of a blade. I see no reason to continue our conversation. How can one such as you assist with my [delegated duties]?");
		}
	elsif($text=~/delegated duties/i)
		{
		quest::say("Why do you ask? I know why. Glory has captured your affections. Those who seek glory find death. Still, you may be of some use. Before I assign you a task, I must be assured of your power. I require you to [perform a test].");
		}
	elsif($faction > 5)
		{
		quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
	elsif($faction > 4)
		{
		quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		}
	elsif($text=~/perform a test/i)
		{
		quest::say("In the Lavastorm Mountain Range there have been sightings of a paladin, one Sir Lindeal. He has compromised our routes between.. well, that is none of your concern. All you need to know is that this paladin of the Temple of Marr must be sent to his everlasting life. Do so and prove your worth to us. I await your proof. Use no assistance. If you are truly his equal then I shall know. I know all.");
		}
	elsif($text=~/Thex Mallet/i)
		{
		quest::say("All you can know is that the Thex Mallet is desired by our Queen. If we are not successful in its retrieval, it will be our heads which adorn her trophy room. We have learned its location and believe it to be broken into three separate pieces.");
		}
	elsif($text=~/Queen Cristanos Thex/i)
		{
		quest::say("The Queen of the Teir'Dal is the most powerful of all. It is she who should sit on the throne and not King Naythox. The Dead are her humble servants. We await the day when she shall finally take her rightful position as ruler of Neriak.");
		}
	elsif($text=~/King Naythox Thex/i)
		{
		quest::say("A competent and powerful warrior, but a warrior nonetheless. He has suppressed the true glory of the Teir'Dal. Perhaps it is time for a new ruler of Neriak.");
		}
	elsif($text=~/appointed tasks/i)
		{
		my $deadfaction = $client->GetModCharacterFactionLevel(239); # Faction: The Dead
		if ($deadfaction < 150)
			{
			quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
			}
		else
			{
			quest::say("Very well. You have gained the appropriate power. I require you to journey to the Commonlands and seek out Kizdean Gix. He is a member of a very important force. Tell him 'Utalk Adarev Otcin'. Remember this password.");
			}
		}
	}

sub EVENT_ITEM 
	{
	my $deadfaction = $client->GetModCharacterFactionLevel(239); # Faction: The Dead

	if ($faction < 5)
		{
		if($deadfaction > 149 && plugin::check_handin(\%itemcount, 18828 => 1))#Testimony
			{
			quest::say("So you have succeeded where others have failed. You show promise. Take this then. You shall be a valuable asset to the Dead and soon this shall be of value to one so great. This will help you on your way. Are you still interested in my [appointed tasks]?");
			quest::summonitem(2317);#Cloak of the Undead Eye
			quest::givecash(0,0,5,1);#5 gold, 1 platinum
			quest::exp(33750);#1% level 16 exp
			quest::ding();
			#Factions verified per ZAM
			quest::faction(239, 25); #The Dead
			quest::faction(303, 3); #Queen Cristanos Thex
			quest::faction(278,-3); #King Naythox Thex
			quest::faction(275,-3); #Keepers of Art
			quest::faction(245,-3); #Eldritch Collective
			quest::faction(1522,-50); #Primordial Malice		
			}

		elsif(plugin::check_handin(\%itemcount, 13390 => 1))#Thex Mallet
			{
			quest::say("Oh how grand it is!! Look at it!! I feel the power trembling within. Who would have thought such an item would be abandoned? You have performed supremely. Queen Cristanos shall reward me greatly and I shall reward you greatly. Here is my weapon from years past.. the Reaper of the Dead. I believe it has one soul still trapped within.");
			quest::summonitem(5374);#Reaper of the Dead
			quest::exp(33750);#1% level 16 exp
			quest::ding();
			#Faction verified per ZAM
			quest::faction(239, 100); #The Dead
			quest::faction(303, 15); #Queen Cristanos Thex
			quest::faction(278,-15); #King Naythox Thex
			quest::faction(275,-15); #Keepers of Art
			quest::faction(245,-15); #Eldritch Collective
			quest::faction(1522,-200); #Primordial Malice		
			}

		elsif(plugin::check_handin(\%itemcount, 18889 => 1))#Letter To Loveal Of The Dead
			{
			quest::say("I see my expeditionary unit has encountered problems. I must send a dragoon unit to Befallen at once. I must not allow the [Thex Mallet] to fall into the hands of some simple adventurer. Here is payment for your quick service.");
			quest::givecash(4,0,0,0);#4 Copper
			quest::summonitem(13009,2);#Bandages
			quest::summonitem(13005,2);#Iron Rations
			quest::summonitem(13002);#Torch
			}
		}

	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}
