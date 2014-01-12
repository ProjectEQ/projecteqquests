##Veriok_Dreik.pl
#Alternate PoP Flag: Bypass Hedge & Terris Thule
#Alternate PoP Flag: Bypass Keeper of Sorrows
#Alternate PoP Flag: Bypass Grummus
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
					quest::say("Excellent work $name, I hear great things of you from Odaen. I have more work for you if you wish to help. Do you [" . quest::saylink("believe") . "] that we can help another suffering soul?");
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
				
				#Set the bypass to 3, so that  the next hail will give lead in for Grummus bypass.
				quest::setglobal("pop_pot_tt_hedge_bypass",3,5,"F");
			}
			
			if (defined $qglobals{pop_pot_tt_hedge_bypass} && $qglobals{pop_pot_tt_hedge_bypass} == 3) {
				quest::say("Excellent work $name, but there is no time to waste. [" . quest::saylink("Mylik") . "] needs our help.");
			}
		}
		else {
			quest::say("Greetings fellow adventurer, I can see that you're interested in curing the [" . quest::saylink("illness") . "] that seeps through Norrath.");
		}
	}
	
	if ($text=~/believe/i) {
		quest::say("We will see how much you believe in my powers and your abilities. This man Thelin over here is lost in a world of Nightmares. Thelin was once a great man who opened a portal to the Plane of Nightmare is now a weak man trapped inside his own [" . quest::saylink("nightmares") . "].");
	}
	
	if ($text=~/nightmares/i) {
		quest::say("Thelin had used all of his energy to open the portal to the Plane of Nightmare. He went home that day and fell asleep clutching a [" . quest::saylink("jeweled dagger") . "] that was once given to him. While sleeping, he had this terrible nightmare and he started to toss and turn from the vision that was sent to him. He tossed and turned so much that he landed on the dagger and critically injured himself. The elders found him in time and were able to save him but he has slipped into a coma and is in an endless world of nightmares.");
	}
	
	if ($text=~/jeweled dagger/i) {
		quest::say("Ah yes the jeweled dagger. It was precious to him and he always kept it by his side. I believe that retrieving the dagger is the key to saving him. I have a scout inside the Plane of Nightmare trying to recover it for me. Terris Thule has broken it into many pieces and scattered it inside a maze so Thelin couldn't use it to escape his nightmares. Our scout has been gone for awhile now and I'm getting worried. Can you [" . quest::saylink("find her") . "] and assist her in bringing the jeweled dagger back to me?");
	}
	
	if ($text=~/find her/i) {
		quest::say("Excellent her name is Kelletia. She is one of our best scouts.");
	}
	
	if ($text=~/illness/i) {
		quest::say("$name, look at these people. Their minds are being tormented, they are diseased and their souls are decaying more and more each day. You only see four in front of you but tomorrow it might be eight and the day after it could be hundreds. Who knows, it might even be [" . quest::saylink("me",0,"you") . "] on your sick bed.");
	}
	
	if ($text=~/me/i) {
		quest::say("Yes $name even you. You have to believe that I can help these people. You need to believe that I can help you. You need to believe that you can help me. I believe you can help me. Will you [" . quest::saylink("help you",0,"help me") . "] save these people?");
	}
	
	if ($text=~/help you/i) {
		quest::say("Then let's get started! This man Tylis suffers from mental torment. Look at him ______ he is in pain. His illness is no ordinary illness. Someone is controlling his mind and we need to stop the source ofthis torment. You can find the one who controls his mind inside the Plane of Torment. We want to learn more about how his brain works. Destroy the source and bring me back his brain so we can set those under his spell free.");
	}
	
	if ($text=~/mylik/i) {
		quest::say("Excellent! Let me tell you about Mylik. Much like Thelin, Mylik was a strong brave man too. Mylik stood in these lands and focused his energy and mana and opened the portal to the Plane of Disease. Bertoxxulous set a curse on those who dared open a portal to his plane and he defiled Mylik's soul with a potent toxin that has left him lying there slowly decaying away. Do you [" . quest::saylink("understand") . "] the amount of death that Bertoxxulous can spread over Norrath?");
	}
	
	if ($text=~/understand/i) {
		quest::say("Ok then pay attention $name. I have already sent in an old friend of mine to handle what needs to be done inside the Plane of Disease. What he doesn't know is that Bertoxxulous is aware that he has breached the portal and is planning on sending four guardians to eliminate him. Enter the Crypt of Decay and destroy the guardians. Bring me back proof of their death and I'll give you further instructions. Hurry $name, this task is vital to saving Milyk.");
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
			quest::summonitem(51614);# Give it back, need to have Saryrn or no flag.
		}
	}
	
	#Grummus bypass, need to have Saryn, Keeper of Sorrows, TT and Hedge done.
	elsif(plugin::check_handin(\%itemcount, 51618 => 1, 51619 => 1, 51620 => 1, 51621 => 1)) {#Orders from Bertoxxulous pg. 1, Orders from Bertoxxulous pg. 2, Orders from Bertoxxulous pg. 3, Orders from Bertoxxulous pg. 4
		# Gotta have Saryrn done, Keeper, TT and Hedge
		if (((defined $qglobals{pop_pot_saryrn_final} && $qglobals{pop_pot_saryrn_final} == 1)) &&
		   ((defined $qglobals{pop_pot_newleaf} && $qglobals{pop_pot_newleaf} == 1)) &&
		   ((defined $qglobals{pop_ponb_terris} && $qglobals{pop_ponb_terris} == 1)) &&
		   ((defined $qglobals{pop_ponb_poxbourne} && $qglobals{pop_ponb_poxbourne} == 1)) &&
		   ((defined $qglobals{pop_pon_hedge_jezith} && $qglobals{pop_pon_hedge_jezith} == 1)) &&
		   ((defined $qglobals{pop_pon_construct} && $qglobals{pop_pon_construct} == 1))) {
				quest::say("Go forth to the Crypt of Decay, $name.");#Text made up.
				#Grummus flags
				quest::setglobal("pop_pod_alder_fuirstel",1, 5, "F");
				quest::setglobal("pop_pod_grimmus_planar_projection",1, 5, "F");
				quest::setglobal("pop_pod_elder_fuirstel",1, 5, "F");
				quest::set_zone_flag(200);#CoDecay access
				$client->Message(15, "You have received a character flag!");
				$client->Message(15, "You have received a character flag!");
				$client->Message(15, "You have received a character flag!");
				$client->Message(15, "You have received a character flag!");
		}
		
		else {
			#Not the right flags, give em back.
			quest::summonitem(51618);# Orders from Bertoxxulous pg. 1
			quest::summonitem(51619);# Orders from Bertoxxulous pg. 2
			quest::summonitem(51620);# Orders from Bertoxxulous pg. 3
			quest::summonitem(51621);# Orders from Bertoxxulous pg. 4
		}
	}
	
  plugin::return_items(\%itemcount);
}#END of FILE Zone:potranquility ID:203428 --#Veriok_Dreik.pl
