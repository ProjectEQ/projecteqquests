# Discord Skin Samples
# http://everquest.allakhazam.com/db/quest.html?quest=2839

sub EVENT_SAY {
    #backdoor to reacquire Vaifan's Pocket Sampling Device
    if ($client->GetGlobal("SkinSampleA") ==1) {		
		if( $text =~ /deletecontainerglobal/i ) {
        quest::delglobal(SkinSampleA);
		quest::say( "Global deleted, you can be willing to help once more");
		}
		else {
        quest::say( "There is nothing more I can tell you. Please take the item you have received and get some samples for me.");
		}
		return;
    }
    # initial contact
    elsif ( $text =~ /hail/i ) {
        quest::say( "Greetings, traveler. My name is Alexsa and I'm currently looking into collecting samples from the strange beings that make up the Legion of Mata Muram ranks. Our initial encounters with them revealed that each one is innately resistant to certain weapon types and weak against others. So, by order of Morden, we must gather skin samples from each race and analyze them. Thanks to our tinkering sister, Vaifan, I now have a device which can readily examine samples. However, with news of our scouts missing and our resources being spread so thin, retrieving these samples is impossible for us. Since you've taken the time to listen, I'm wondering if you would be [willing to help] or [not]?" );
    }
    # quest accepted
    elsif ( $text =~ /willing to help/i ) {
        quest::say( "Oh wonderful! You don't know how helpful this will be. Take this device. It is what we use to examine samples. When you defeat a Muramite, remove his tongue, place it inside of here, and combine it with some distilling salts. Distilling salts can be found along the shores of Natimbi. Once you have combined the ingredients, it will give you a final sample which I will need you to return to me when you get the chance. Each time you hand me a sample, I will be able to reveal to you the innate strengths and weaknesses for that race. If you are successful in recovering a sample from every different race that has come through the portal, then I will talk to Morden about giving you a reward." );
        quest::summonitem(67594);    # Vaifan's Pocket Sampling Device
        quest::setglobal( 'SkinSampleA', 1, 5, 'F' );
    }
    elsif ( $text =~ /not/i ) {
        quest::say( "How unfortunate. No matter. I will find some way to get this information, with or without your help.");
    }
}

sub EVENT_ITEM {
	# Kyv Sample
	if ($client->GetGlobal("SkinSampleKyv") !=1 && $client->GetGlobal("SkinSampleA") ==1) {
		if (plugin::check_handin(\%itemcount, 67596 => 1)) {
			quest::say("Ah yes, the kyv. These stealthy beings are quite elusive. The fact that you were able to recover a sample from one of them is quite an accomplishment. Now, let's see... it appears that the kyv have no noticeable weapon weaknesses or resistances, but we do know they have the ability to deflect incoming arrows and thrown objects. It would seem that they are also resistant to poison based incantations, and quite weak to magic based spells.");
			quest::setglobal('SkinSampleKyv', 1, 5, 'F' );
			CheckFirst8();
		}
	}
	# Ukun Sample
	if ($client->GetGlobal("SkinSampleUkun") !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67597 => 1)) {
			quest::say("An excellent find here! It appears that this was retrieved from one of the beings called an ukun. They have frail bodies but their blood is a deadly poison. This would imply that they are probably very resistant to poison.");
			quest::setglobal('SkinSampleUkun', 1, 5, 'F' );
			CheckFirst8();			
		}
	}
	# Ikaav Sample
	if ($client->GetGlobal("SkinSampleIkaav") !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67598 => 1)) {
			quest::say("These snakelike beings are very deadly. The scales on their lower body are all but impervious to slashing weapons, but a well-placed arrow could do some serious damage. They are masters of magical energy making their defenses against such spells very good. However they do seem to be weak against elemental magic like cold.");
			quest::setglobal('SkinSampleIkaav', 1, 5, 'F' );
			CheckFirst8();			
		}
	}
	# Mastruq Sample
	if ($client->GetGlobal("SkinSampleMastruq") !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67599 => 1)) {
			quest::say("Great sample! It looks like this was taken from a being with a thickened hide. This particular being is called a mastruq and seems to be quite resistant to blunt objects, but an arrow or slashing weapon would get through that hide quite easily. Because of their thick hides cold based elemental magic would be quite ineffective while the opposite would hold true for fire magic.");
			quest::setglobal('SkinSampleMastruq', 1, 5, 'F' );
			CheckFirst8();
		}
	}			
	# Aneuk Sample
	if ($client->GetGlobal("SkinSampleAneuk") !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67600 => 1)) {
			quest::say("These odd-looking floating beings interest me the most. They seem to be quite adept with magic making them strong against magical incantations.");
			quest::setglobal('SkinSampleAneuk', 1, 5, 'F' );
			CheckFirst8();
		}
	}
	# Nok Sample
	if ($client->GetGlobal(SkinSampleNok) !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67601 => 1)) {
			quest::say("Looks like this came from the body of the race of beings called the noc. While their bony frames make them quite weak against crushing damage, their plated chests protect any major organs, reducing the effectiveness of arrows or slashing weapons. It would appear that their flesh is diseased which makes them resistant to disease based spells but their thin skin means that cold might be quite affective against them.");
			quest::setglobal('SkinSampleNok', 1, 5, 'F' );
			CheckFirst8();
		}
	}
	# Ixt Sample
	if ($client->GetGlobal("SkinSampleIxt") !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67602 => 1)) {
			quest::say("These centaur-like beings are quite bloodthirsty. They appear to be bred for fighting. Their fur covered lower half makes them very resistant to the element of cold but while that fur can protect them from one element it also makes them very vulnerable to fire.");
			quest::setglobal('SkinSampleIxt', 1, 5, 'F' );
			CheckFirst8();
		}
	}
	# Ra'Tuk Sample
	if ($client->GetGlobal("SkinSampleRatuk") !=1 && $client->GetGlobal("SkinSampleA") ==1) {	
		if (plugin::check_handin(\%itemcount, 67605 => 1)) {
			quest::say("This looks like a sample from the brutish ra'tuk. These large beasts wield their axes adeptly and seem to have no major weaknesses save magical based spells. Because of their strange body makeup magic tends to affect them more then other spell types.");
			quest::setglobal('SkinSampleRatuk', 1, 5, 'F' );
			CheckFirst8();			
		}
	}
	# Zun'muram Sample
	if ($client->GetGlobal("SkinSampleZM") !=1 && $client->GetGlobal("SkinSampleA") ==1 && $client->GetGlobal("SkinSampleFirst8") ==1) {	
		if (plugin::check_handin(\%itemcount, 67604 => 1)) {
			quest::say("A two-headed beast built for destruction. This creature is quite powerful, as I am sure you found out when you met it. While it does not appear to have any resistances or weaknesses, this sample should reveal some more information about its particular race.");
			quest::setglobal('SkinSampleZM', 1, 5, 'F' );
			CheckLast2();			
		}
	}
	# Tunat'Muram Sample
	if ($client->GetGlobal("SkinSampleTM") !=1 && $client->GetGlobal("SkinSampleA") ==1 && $client->GetGlobal("SkinSampleFirst8") ==1) {	
	if (plugin::check_handin(\%itemcount, 67603 => 1)&& !defined $qglobals{SkinSampleTM}) {
			quest::setglobal('SkinSampleTM', 1, 5, 'F' );
			quest::say("This is unbelievable, you retrieved a sample from the army's leader and you still live? You are truly a great adventurer. I must get this sample to our mages quickly. We must do some extended testing as we have not had any information on him till now.");			
			CheckLast2();
		}	
	}
 plugin::return_items(\%itemcount);
}


sub CheckFirst8 {
	if ($client->GetGlobal("SkinSampleUkun") ==1 &&	$client->GetGlobal("SkinSampleIkaav") ==1 && $client->GetGlobal("SkinSampleMastruq") ==1 && $client->GetGlobal("SkinSampleAneuk") ==1 && $client->GetGlobal("SkinSampleNok") ==1 && $client->GetGlobal("SkinSampleIxt") ==1 && $client->GetGlobal("SkinSampleRatuk") ==1 && $client->GetGlobal("SkinSampleKyv") ==1 ) {
		quest::setglobal('SkinSampleFirst8', 1, 5, 'F' );
		quest::summonitem(67624);    # Alexsa's Research Notes
		quest::say("Now that I have all of the basic samples I can add all of my research into this tome and give it to you.");
		quest::say("While we still need samples from both the force commander and his lieutenant, what you have given me so far warrants a reward of some kind. When you have recovered samples from both of the additional races I mentioned I will be able to reward you with something much better.");		
	}
	else {
		quest::say("You're doing great, but there are more samples left to be found. Please get them to me as soon as you can.");
	}
}

sub CheckLast2 {
	if ($client->GetGlobal("SkinSampleZM") ==1 && $client->GetGlobal("SkinSampleTM") ==1) {	
		quest::say("You have collected all the samples we need and I thank you for the assistance. I am indebted to you and with approval given by Morden himself I want you to take this, hopefully it will help you in your future adventures. Good day and good luck.");
		quest::summonitem(67625);    # Assistant Researcher's Symbol
        # delete qglobals to allow for repetition of quest (per ZAM)
        quest::delglobal(SkinSampleA);
		quest::delglobal(SkinSampleFirst8);
		quest::delglobal(SkinSampleKyv);
		quest::delglobal(SkinSampleUkun);
		quest::delglobal(SkinSampleIkaav);
		quest::delglobal(SkinSampleMastruq);
		quest::delglobal(SkinSampleAneuk);
		quest::delglobal(SkinSampleNok);
		quest::delglobal(SkinSampleIxt);
		quest::delglobal(SkinSampleRatuk);
		quest::delglobal(SkinSampleZM);
		quest::delglobal(SkinSampleTM);	
	}
	else {
		quest::say("You're doing great, but there are more samples left to be found. Please get them to me as soon as you can.");
	}
}

#END OF FILE zone:abysmal ID:279038 -- #Alexsa_Whyte.pl