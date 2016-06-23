#Zone: West Commonlands
#Short Name: commons
#Zone ID: 21
#
#NPC Name: Jahsohn Aksot
#NPC ID: 21043
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name.");
  }
  if ($text=~/rykas gave it to me/i) {
    quest::say("I have not heard of anyone speaking that name out loud in years. Rykas once shared a tale with me, though I have lived with fear in my mind ever since. He told me afterwards that I did not have the balance I thought I had. Have you come for the Words of Magi'kot?"); 
  }
  if ($text=~/words/i) {
    quest::say("The Words of Magi'kot can only be shared with those elementalists whose minds are of balance. The Words were separated into three pieces by a high council of Magi who feared that the story would bring an end to elementalists throughout Norrath. If you feel you wish to read from the sacred Power of the Orb then an elementalist of such power should easily accomplish this task.");
  }
  if ($text=~/what task/i) {
    quest::say("Bring me the torn pages of Magi'kot. The first section can be found in the depths of a tainted forest, warded by an angry lupine. It is also rumored that one section is found in the haunted estate of a murderer, on a many armed creature. The last may be found in the belly of an amphibian who thirsts for blood.");
  }
  if ($text=~/bantil sent me/i) {
    quest::say("You are working with Bantil? I hope you had some luck finding the books. Let me know if there is anything I can do to help you. Bantil is a friend, despite his gnomish heritage.");
	quest::setglobal("mage_epic_jah", 1, 5, "F");
	if(defined $qglobals{mage_epic_wal}) {
		quest::say("Oh, you may want to speak to Akksstaff again, he and Bantil never quite saw eye to eye, you may want to ask him about Bantil again.");
	}
  }   
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28035 => 1)) {
    quest::say("What is this? I cannot believe you found it! Where did you get this?");
    quest::exp(50);
  }
  if (plugin::check_handin(\%itemcount, 28000 => 1, 28001 => 1, 28002 => 1)) {
    quest::say("Rykas may have been right about you, $name. Now, go find Walnan. Walnan was apprenticed to a very powerful Mage. After her apprenticeship was complete, she wished to begin teaching other beings of Norrath. Even those who knew nothing of the art! I do not believe she was successful, though. Seek her out to further your tale. Good luck in your journeys, $name!");
    quest::summonitem(28003);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone: commons ID:21043 -- Jahsohn_Aksot

