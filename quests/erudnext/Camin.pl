sub EVENT_SAY {
 if($text =~ /hail/i) {
	quest::say("Go away! I have no time for you!");
 }
 if($text =~ /What are you searching for/i) {
	# should check faction here...
	quest::say("Ah! A smart one, I see! If you really wish to know about such a thing, you will have to help me finance my studies. The knowledge I have acquired and researched did not come cheaply.");
 }
}

sub EVENT_ITEM {
	#Note handin:
	if($itemcount{18088} == 1){
		quest::say("So you have met Solomen, eh? He is a man with a wealth of knowledge. It is good to hear he is well.");
		
	}
	#Ro's Breath handin
	if(int($wizepic) == 1 && $itemcount{14330} == 1){
		quest::say("Very interesting... I've seen this work before. Yes, yes! It's the work of Arantir Karondor! Give this back to the person you got it from. Maybe he will have a clue to Arantir's location.");
		quest::faction(342, 30); #Truespirit
		quest::exp(10000);
		quest::summonitem(14331);
		quest::delglobal("wizepic");
	}
	#'Gimme Money' handin
	if($platinum >= 1000) {
		quest::say("Good, good, you show a willingness to learn of this with your offer. What I can tell you is that Solusek Ro had four followers who had shown exceptional aptitude in the arts of wizardry. Solusek Ro himself tutored them. He considered them to be like his own children. I know of one who still exists. He goes by the name of Arantir Karondor. He used to specialize in the storing of magic into physical objects. Arantir has been hiding for many, many years and will most assuredly be going by another name, so keep your eyes open. Anyway, be off, I need to continue my research. Return to me if you ever find Arantir Karondor.");
		quest::setglobal("wizepic",1,0,"D30");
	}
}

