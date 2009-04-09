# Discord Skin Samples
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Greetings traveler, my name is Alexsa and I am currently looking in to collecting samples from the strange beings that make up the Legion of Mata Muram ranks. Our initial encounters with them revealed that each one is innately resistant to certain types of weapons and weak against others. So, by order of Morden, we must gather skin samples from each race and examine it. Thanks to our tinkering sister, Vaifan, I now have a device which can readily examine samples. However, with news of our scouts missing and our resources being spread so thin, retrieving these samples are impossible for us. Since you have taken the time to listen, I am wondering if you would be willing to help?"); 
}

if($text=~/yes/i){

quest::say("Oh wonderful! You don't know how helpful this will be. Take this device. It is what we use to examine samples. When you defeat the Muramite, remove his tongue, place it inside of here and combine it with some distilling salts. Distilling slats can be found along the shores of Natimbi. Once you have combined the ingredients, it will give you a final sample which I will need you to return to me when you get the chance. Each time you hand a sample, I will be able to reveal to you the innate strengths and weeknesses for that race. If you are successful at recovering a sample from every different race that has come through the portal, then I will talk to Morden about giving you a reward. Also if you forget what samples you have turned in you may come to me and say [what have I turned in] to get a list of what you have already given me to check."); 

quest::summonitem(67594) # Vaifan's Pocket Sampling Device
}

if($text=~/what have i turned in/i){

	$client->Message(9,"At the moment, you have turned in the following.");

		if($sknsmplea == 1) {

			$client->Message(12,"You have turned in a Kyv Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in a Kyv Sample.");

		}

		if($sknsmpleb == 1) {

			$client->Message(12,"You have turned in a Mastruq Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in a Mastruq Sample.");

		}

		if($sknsmplec == 1) {

			$client->Message(12,"You have turned in a Ratuk Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in a Ratuk Sample.");

		}

		if($sknsmpled == 1) {

			$client->Message(12,"You have turned in an Aneuk Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in an Aneuk Sample.");

		}

		if($sknsmplee == 1) {

			$client->Message(12,"You have turned in an Ikaav Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in an Ikaav Sample.");

		}

		if($sknsmplef == 1) {

			$client->Message(12,"You have turned in a Nok Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in a Nok Sample.");

		}

		if($sknsmpleg == 1) {

			$client->Message(12,"You have turned in an Ixt Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in an Ixt Sample.");

		}

		if($sknsmpleh == 1) {

			$client->Message(12,"You have turned in an Ukun Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in an Ukun Sample.");

		}
		
		if($sknsmplea == 1 && $sknsmpleb == 1 && $sknsmplec == 1 && $sknsmpled == 1 && $sknsmplee == 1 && $sknsmplef == 1 && $sknsmpleg == 1 && $sknsmpleh == 1) {
			
			$client->Message(12,"Now that I have all of the basic samples I can add all of my research into this tome and give it to you.");
			quest::say("While we still need samples from both the force commander and his lieutenant, what you have given me so far warrants a reward of some kind. When you have recovered samples from both of the additional races I mentioned I will be able to reward you with something much better. [What else is needed]?");
			quest::summonitem(67624);
			
			}
}

if($text=~/what else is needed/i) {

			
		if($sknsmplei == 1) {

			$client->Message(12,"You have turned in a Zun'muram Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in a Zun'muram Sample.");

		}	
		
		if($sknsmplej == 1) {

			$client->Message(12,"You have turned in a Tunat'Muram Sample.");

			}

		else {

		$client->Message(9,"You have NOT turned in a Tunat'Muram Sample.");

		}
		
		if($sknsmplea == 1 && $sknsmpleb == 1 && $sknsmplec == 1 && $sknsmpled == 1 && $sknsmplee == 1 && $sknsmplef == 1 && $sknsmpleg == 1 && $sknsmpleh == 1 && $sknsmplei == 1 && $sknsmplej == 1) {
			
			$client->Message(12,"You have handed in all the samples.");
			quest::say("This is unbelievable, you retrieved a sample from the army's leader and you still live? You are truly a great adventurer. I must get this sample to our mages quickly. We must do some extended testing as we have not had any information on him till now. You have collected all the samples we need and I thank you for the assistance. I am indebted to you and with approval given by Morden himself I want you to take this, hopefully it will help you in your future adventures. Good day and good luck.");
			quest::summonitem(67625); # Assistant Researcher's Symbol
		}
		
		
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 67596 => 1)) { # A Kyv Sample

quest::say("Ah yes, the kyv. These stealthy beings are quite elusive. The fact that you were able to recover a sample from one of them is quite an accomplishment. Now, let's see . . . it appears that the kyv have no noticeable weapon weaknesses or resistances, but we do know they have the ability to deflect incoming arrows and thrown objects. It would seem that they are also resistant to poison based incantations, and quite weak to magic based spells. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmplea", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67599 => 1)) { # A Mastruq Sample

quest::say("Great sample! It looks like this was taken from a being with a thickened hide. This particular being is called a mastruq and seems to be quite resistant to blunt objects, but an arrow or slashing weapon would get through that hide quite easily. Because of their thick hides cold based elemental magic would be quite ineffective while the opposite would hold true for fire magic. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmpleb", 1, 5, "F");

}

if (plugin::check_handin(\%itemcount, 67605 => 1)) { # A Ratuk Sample

quest::say("This looks like a sample from the brutish ra'tuk. These large beasts wield their axes adeptly and seem to have no major weaknesses save magical based spells. Because of their strange body makeup magic tends to affect them more then other spell types. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmplec", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67600 => 1)) { # An Aneuk Sample

quest::say("These odd-looking floating beings interest me the most. They seem to be quite adept with magic making them strong against magical incantations. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmpled", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67598 => 1)) { # An Ikaav Sample

quest::say("These snakelike beings are very deadly. The scales on their lower body are all but impervious to slashing weapons, but a well-placed arrow could do some serious damage. They are masters of magical energy making their defenses against such spells very good. However they do seem to be weak against elemental magic like cold. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmplee", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67601 => 1)) { # A Nok Sample

quest::say("Looks like this came from the body of the race of beings called the noc. While their bony frames make them quite weak against crushing damage, their plated chests protect any major organs, reducing the effectiveness of arrows or slashing weapons. It would appear that their flesh is diseased which makes them resistant to disease based spells but their thin skin means that cold might be quite affective against them. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmplef", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67602 => 1)) { # An Ixt Sample

quest::say("These centaur-like beings are quite bloodthirsty. They appear to be bred for fighting. Their fur covered lower half makes them very resistant to the element of cold but while that fur can protect them from one element it also makes them very vulnerable to fire. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmpleg", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67597 => 1)) { # An Ukun Sample

quest::say("An excellent find here! It appears that this was retrieved from one of the beings called an ukun. They have frail bodies but their blood is a deadly poison. This would imply that they are probably very resistant to poison. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 

quest::setglobal("sknsmpleh", 1, 5, "F");
}
############# After first 8 ##########

if (plugin::check_handin(\%itemcount, 67604 => 1)) { # Zun'muram Sample

quest::say("A two-headed beast built for destruction. This creature is quite powerful, as I am sure you found out when you met it. While it does not appear to have any resistances or weaknesses, this sample should reveal some more information about its particular race. You're doing great, but there are more samples left to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmplei", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67603 => 1)) { # Tunat'Muram Sample

quest::say("This is unbelievable, you retrieved a sample from the army's leader and you still live? You are truly a great adventurer. I must get this sample to our mages quickly. We must do some extended testing as we have not had any information on him till now. You're doing great, but there are more samples to be found. Please get them to me as soon as you can."); 
quest::setglobal("sknsmplej", 1, 5, "F");
}

}

#END of FILE zone:abysmal ID:279038 -- #Alexsa_Whyte.pl

