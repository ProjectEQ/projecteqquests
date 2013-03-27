sub EVENT_SAY{
	if($text=~/hail/i){
		quest::say("Greetings adventurer. I am Phenic Dionicas, Magistrate of the Loyalist Combine Empire. I hope the [vampyres] did not cause you troubles on your journey here. ");
	}
	if($text=~/vampyres/i){
		quest::say("Aye, the vampyres of the Coterie of the Eternal Night. I was among the first to ever [discover] the vampyre threat when I was just a young boy freshly initiated into the [Validus Custodus].");
	}
	if($text=~/discover/i){
		quest::say("I was on a routine trade route patrol through the tenebrous mountains and the grimling forest when we were attacked by a pack of the vile undead. The creatures that attacked us wore the garments of Shadow Haven merchants and nearly my entire patrol was slain by their claws and fangs. Only [Heratius Grolden] and myself made it back to the safety of Katta Castellum alive and shortly after I was the only survivor of the attack.");
	}
	if($text=~/Validus Custodus/i){
		quest::say("The Validus Custodus is the army of the Loyalist Empire. It was formerly known as the Tsaph Katta Militia when the city of Katta Castellum was still being erected upon the cliffs that it now stands. As the city grew and the duties of the militia expanded the governors and magistrates of the time met in council and the Validus Custodus was formed. My father Galin Dionicas was elected the first Commander and Chief of the Validus Custodus. Commander Galin was slain in his sleep the very same night that Heratius body was stolen from the graveyard by the vile Coterie of the Eternal Night. Their deeds shall not go unpunished.");
	}
	if($text=~/Heratius Grolden/i){
		quest::say("Heratius Grolden was a boyhood friend of mine and a brave legionnaire in the Validus Custodus. He was buried with honor in the graveyard of Katta Castellum. Several nights after his burial Heratius' grave had been dug up and his body was missing. I suspect and fear that the Coterie of the Eternal Night returned for him to make him one of their own. I pray to whatever gods are listening that some day we are able to [track down the defilers]!");
	}
	if(($text=~/track down the defilers/i) && ($faction < 6)) {
		quest::say("It has been several decades since the first group of vampyres that are responsible for the death of Heratius Grolden were encountered. I have been watching for signs of their origins since that time to little avail. What we do know is that they wore the apparel of merchants from Shadow Haven. How and why they were turned into the bloodsucking creatures they became is still a mystery and shrouded in many rumors. Take this official request form to the merchant records keeper in Shadow Haven and he may be able to provide you with records of any merchant caravans that departed for Katta Castellum within a reasonable time before the attacks and never returned.");
		quest::summonitem(31753); #Request Form
	}
	if(($text=~/track down the defilers/i) && ($faction > 5)) {
		my $random = int(rand(2));
		if($random == 0) {
			quest::say("Is that your BREATH..or did something die in here..now go away!");
		}
		if($random == 1) {
			quest::say("Oh look..a talking lump of refuse..how novel!");
		}
	}
	if($text=~/Valdanov Zevfeer/i){
		quest::say("Valdanov Zevfeer was a traveling alchemist and magical reagent peddler that used to occasionally visit Katta Castellum. At one point before the initial vampyre attacks he decided to remain in Katta Castellum for a while with the wealthy Katta citizen Nathyn Illuminious. Apparently that decision saved his life as according to the records you have provided the caravan he arrived with never completed the return trip to Shadow Haven. That is as much as I know about the individual as he primarily kept to himself during his stay here.");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 18330 => 1)){
		quest::say("I was afraid of this. I do not know how much Halle managed to tell you, but we have had our suspicions about one of the Legionnaires ever since she overheard him talking in his sleep. She was meant to get close to him, I guess she found something out... I should have been more careful!  Take this to Governor Markil, it concerns his men and I've no doubt he can handle it. Thank you much for your help.");
		quest::ding();
		quest::faction(52,50);
		quest::faction( 284, -50);
		quest::faction( 142, -50);
		quest::summonitem(18331); #Sealed Message
	}
	elsif(plugin::check_handin(\%itemcount, 18352 => 1)){
		quest::say("Most interesting. One of the names on this list I recognize. The alchemist [Valdanov Zevfeer]. Nathyn Illuminious would know more of Valdanov. Present this badge to Nathyn so that he knows you have been sent by the Magistrates to inquire about this issue and question him about the alchemist.");
		quest::ding();
		quest::faction(52,10);
		quest::faction(284,-30);
		quest::faction(142,-30);
		quest::exp(1000000);
		quest::summonitem(31752); #First Badge of Service (Katta Castellum Badge of Service)
	}
	elsif(plugin::check_handin(\%itemcount, 31755 => 1)){
		quest::say("So Valdanov had an interest in a Vah Shir vampyre?!! Perhaps we should seek out this Vah Shir and find more clues. Take these orders to Legionnaire Falion during his next shift at the Tenebrous Mountains Gate, he will question any travelers that pass by about this mysterious Vah Shir.  Should you locate the Vah Shir Vampyre attempt to present him with your Badge of Service for questioning, he just may agree to cooperate rather than anger the Validus Custodus.");
		quest::ding();
		quest::faction(52,10);
		quest::faction(284,-30);
		quest::faction(142,-30);
		quest::exp(1000000);
		quest::summonitem(31756); #Orders for Legionnaire Falion
	}
	elsif(plugin::check_handin(\%itemcount, 18449 => 1)){
		quest::emote(" listens to your account of the events that have occurred since last you spoke and reads through the journal. 'This investigation is getting more and more baffling the further we delve. Among other things, I am wondering if the shade that was imprisoned in the chest is the same that was providing Valdanov with the blood for his research. Take the belt that the shade was wearing with these instructions to Governor Lathin at the Magus Conlegium. In the meantime I will pay a visit to Nathyn Illuminious.");
		quest::ding();
		quest::faction(52,10);
		quest::faction(284,-30);
		quest::faction(142,-30);
		quest::summonitem(7270); #Instructions for Lathin Firetree
	}
	elsif(plugin::check_handin(\%itemcount, 7361 => 1)){
		quest::say("There is much that is disturbing about these revelations. I will make sure the Validus Custodus is alert than they already are to the presence of powerful vampyre among our citizens. If you can find this Valdanov Zevfeer slay him and bring me his ashes your Katta Castellum Badge of Service, and your Magus Conlegium Token I will bestow upon you an honorable reward.");
		quest::faction(52,10);
		quest::faction(284,-30);
		quest::faction(142,-30);
		quest::setglobal("ready_for_ashes", 1, 0, "F");
	}
	elsif((plugin::check_handin(\%itemcount, 7397 => 1, 31757 => 1, 7394 => 1)) && (defined $qglobals{ready_for_ashes})){
		quest::say("You have done a great service for Katta Castellum and the Loyalist Empire. I award you for your honorable Services. Know that you will be remembered for your deeds.");
		quest::ding();
		quest::faction(52,10);
		quest::faction(284,-30);
		quest::faction(142,-30);
		quest::exp(1000000);
		quest::summonitem(7398); #Loyalist Shield of Honor
		quest::delglobal("ready_for_ashes");
	}
	elsif(plugin::check_handin(\%itemcount, 29899 => 1)){
		quest::emote("looks at you and smiles despite the fact that you have splashed water all over him- he does not appear to be burning at all.  'Oh, excuse me.  You seem to have spilled your water, here have some of mine my friend.  Good day to you, $name,' he says.");
		quest::summonitem(29898);
	}
  plugin::return_items(\%itemcount);
}
