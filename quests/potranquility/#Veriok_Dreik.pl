##Veriok_Dreik.pl
#Alternate PoP Flag: Bypass Hedge & Terris Thule
#Alternate PoP Flag: Bypass Keeper of Sorrows
#This is bypass, it *does* count as having completed the flagging events that are being bypassed.  It's "In lieu of".
#I hope I got all the flags, I'm not super familiar with them all. -Kilelen

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		#Just too freakin many conditions to && them all together while keeping the logic straight and keeping it readable and reasonable to work with.
		#So doing it this way.
		if ((defined $qglobals{pop_pot_saryrn_final} && $qglobals{pop_pot_saryrn_final} == 1)) {
			if ((!defined $qglobals{pop_pot_tt_hedge_bypass}) || ((defined $qglobals{pop_pot_tt_hedge_bypass}) && ($qglobals{pop_pot_tt_hedge_bypass} == 1))) {
				if (!defined $qglobals{pop_ponb_terris} || !defined $qglobals{pop_ponb_poxbourne} || !defined $qglobals{pop_pon_hedge_jezith} || !defined $qglobals{pop_pon_construct}) {
					quest::say("Excellent work $name, I hear great things of you from Odaen. I have more work for you if you wish to help. Do you [believe] that we can help another suffering soul?");
				}
			}
			
			if (defined $qglobals{pop_pot_tt_hedge_bypass} && $qglobals{pop_pot_tt_hedge_bypass} == 2) {
				quest::say("$name we have done it! I heard all about your adventures into the Plane of Nightmare from Kelletia. Do you believe it? I always believed that you believed that we could do it and look we have done it! Our work here is done friend.");
				quest::set_zone_flag(221);#flag for potorment.  If you were 85%ed in to get saryrn, you wouldn't have the flag, and this quest would get it for you.  We don't have 85% rules yet, afaik, but being prepared is good.
				
				#Flags we're aquiring.
				quest::setglobal("pop_ponb_terris",1,5,"F");
				$client->Message(15, "You have received a character flag!");
				quest::setglobal("pop_ponb_poxbourne",1,5,"F");
				$client->Message(15, "You have received a character flag!");
				quest::setglobal("pop_pon_hedge_jezith",1,5,"F");
				$client->Message(15, "You have received a character flag!");
				quest::setglobal("pop_pon_construct",1,5,"F");
				$client->Message(15, "You have received a character flag!");
				
				#Get rid of the bypass global, it's not needed anymore.
				quest::delglobal("pop_pot_tt_hedge_bypass");
			}
		}
		else {
			quest::say("Greetings fellow adventurer, I can see that you're interested in curing the [illness] that seeps through Norrath.");
		}
	}
	
	if ($text=~/I believe/i) {#Despite the previous text in brackets, Gordish-Dev, Eq Designer says "The trigger for that should be "I believe". "
		quest::say("We will see how much you believe in my powers and your abilities. This man Thelin over here is lost in a world of Nightmares. Thelin was once a great man who opened a portal to the Plane of Nightmare is now a weak man trapped inside his own [nightmares].");
	}
	
	if ($text=~/nightmares/i) {
		quest::say("Thelin had used all of his energy to open the portal to the Plane of Nightmare. He went home that day and fell asleep clutching a [jeweled dagger] that was once given to him. While sleeping, he had this terrible nightmare and he started to toss and turn from the vision that was sent to him. He tossed and turned so much that he landed on the dagger and critically injured himself. The elders found him in time and were able to save him but he has slipped into a coma and is in an endless world of nightmares.");
	}
	
	if ($text=~/jeweled dagger/i) {
		quest::say("Ah yes the jeweled dagger. It was precious to him and he always kept it by his side. I believe that retrieving the dagger is the key to saving him. I have a scout inside the Plane of Nightmare trying to recover it for me. Terris Thule has broken it into many pieces and scattered it inside a maze so Thelin couldn't use it to escape his nightmares. Our scout has been gone for awhile now and I'm getting worried. Can you [find her] and assist her in bringing the jeweled dagger back to me?");
	}
	
	if ($text=~/find her/i) {
		quest::say("Excellent her name is Kelletia. She is one of our best scouts.");
	}
	
	if ($text=~/illness/i) {
		quest::say("$name, look at these people. Their minds are being tormented, they are diseased and their souls are decaying more and more each day. You only see four in front of you but tomorrow it might be eight and the day after it could be hundreds. Who knows, it might even be [you] on your sick bed.");
	}
	
	if ($text=~/me/i) {
		quest::say("Yes $name even you. You have to believe that I can help these people. You need to believe that I can help you. You need to believe that you can help me. I believe you can help me. Will you [help me] save these people?");
	}
	
	if ($text=~/help you/i) {
		quest::say("Then let's get started! This man Tylis suffers from mental torment. Look at him ______ he is in pain. His illness is no ordinary illness. Someone is controlling his mind and we need to stop the source ofthis torment. You can find the one who controls his mind inside the Plane of Torment. We want to learn more about how his brain works. Destroy the source and bring me back his brain so we can set those under his spell free.");
	}
}

sub EVENT_ITEM
{
	# For Keeper of Sorrows bypass, when we get the Crazed Mind Tormentor into the db.
	if(plugin::check_handin(\%itemcount, 51614 => 1)) {#Brains of the Tormentor
		# Gotta have Saryrn done
		if ((defined $qglobals{pop_pot_saryrn_final} && $qglobals{pop_pot_saryrn_final} == 1)) {
			quest::say("A fine step towards curing this illness, $name.  I thank you.");#Text made up.
			#Keeper of Sorrows Flag
			quest::setglobal("pop_pot_newleaf",1, 5, "F");
		}
		
		else {
			plugin::return_items(\%itemcount);# Give it back, need to have Saryrn or no flag.
		}
	}
	
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
}#END of FILE Zone:potranquility ID:203428 --#Veriok_Dreik.pl
