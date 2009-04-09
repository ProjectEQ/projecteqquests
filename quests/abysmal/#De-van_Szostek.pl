# The Fourteen Great Adventurers
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

      if($greatadventures == 7) {
         quest::say("There is nothing more I can tell you. If you accomplish what I ask, then I will reward you. Until then, there is nothing left to say.  But you may also ask me [What have I turned in].");
         }

      else {
         quest::emote("focuses his attention on $name");
         quest::say("Well, hello there. Have you come to listen to my tale of sorrow? Please say [yes].");     
 		  }

	} 

if($text=~/yes/i){

	quest::say("Find a place to sit, for what I am about to tell you is a tale of fourteen great adventurers who met the full force of the Muramites head on [continue].");
quest::setglobal("greatadventures", 1, 5, "H36");
}

if($text=~/continue/i && $greatadventures == 1){

	quest::say("When the brotherhood first arrived here, we sent out scouts to gather information about the area. Those scouts were some of our best and they were executing their task flawlessly until one day the information stopped. All of the brotherhood began to worry. We sent a young scout named Falcin to investigate. Soon after his departure, he returned in bad condition. Falcin died shortly afterward, but not before he detailed the gruesome practices of the Muramite army. This upset many, including a group of fourteen legendary adventurers who had arrived shortly after we hit land [continue].");
	quest::setglobal("greatadventures", 2, 5, "H36");
}

if($text=~/continue/i && $greatadventures == 2){

	quest::say("Feeling that things were getting out of hand, these fourteen came to me and asked that I help them by telling them everything we had found out about the continent thus far. Seeing the light of determination in their eyes, I decided to reveal confidential information to them. I figured they would just leave things to us once they knew how serious the situation was, but knowledge of how dire things could become just fueled the spirit of honor within all of them. I told them that it would be brought under control by the brotherhood, but they refused to listen. They decided that the only solution was to destroy the leader of this invading force [continue].") ;
	quest::setglobal("greatadventures", 3, 5, "H36");
}

if($text=~/continue/i && $greatadventures == 3){

	quest::say("That morning, those of them who chose to save us said goodbye to their friends and family, and the rest -- all good friends of mine -- asked me to honor them. They wanted me to say that I believed they would accomplish what it was they set out to do. I told them I would have a mug of ale waiting for all of them upon their triumphant return, but while I said this aloud, deep inside I knew that this would not turn out well [continue].");
	quest::setglobal("greatadventures", 4, 5, "H36");
}

if($text=~/continue/i && $greatadventures == 4){

	quest::say("The next morning I gathered all of them together and cast a spell on their leader that would allow me to communicate with him through his mind and see what he saw. So, off they went, leaving behind six of our residents Sophia, Verna, Irena, Jenna, Gizzmu, and Aprilia to wait for their return. Days passed and nights of unrest became worse and worse as visions of their battles popped into my mind. I saw them fighting through Qinimi and stalking through the sewers. I witnessed their arrival in Yxtta where they begin to have problems making it through. I saw one of them almost fall before the rest rushed to his aid and saved him. Even through all of this, they never once considered turning back [continue].");
	quest::setglobal("greatadventures", 5, 5, "H36");
}

if($text=~/continue/i && $greatadventures == 5){

	quest::say("A short time went by and my mind was oddly silent. I spent those moments trying to comfort the others as they began to ask me questions. Fearing I would reveal my worry, I reassured them that everything was fine and that our heroes would return shortly. There was more silence and my hopes began to wane. Then, I had another vision. They were still alive and were fighting in an area with a huge crater at its center. This, I surmised, was where some kind of explosion occurred that had caused all of the destruction I'd seen. Our friends fought on through this until they finally went as far as they could go [continue].");
	quest::setglobal("greatadventures", 6, 5, "H36");
}

if($text=~/continue/i && $greatadventures == 6){

	quest::say("They had finally made it to the entrance of Tacvi, the broken temple of the enslaved trusik. It was inside this temple that the trusik worshipped a false god named Trushar. It was here that the army's leader could be found, this ominous being we knew only as the Zun'Muram. It was here that I would receive my last vision and the link to my friends would disappear. The last thing I saw was all of them bruised and beaten, yet still determined to stop this threat to Norrath. Before entering the lair of the fearsome beast, they all embraced each other. That is where the visions stopped and the [mystery] began.");
}

if($text=~/what mystery/i){

	quest::say("Well, you see. this happened some time ago and as each day passes, me and the others sink deeper into depression. With our hope quickly dying, all we can do now is pray for some sort of closure. While I do not want to fully admit it, I believe our heroes all met their demise and now I just want them to be honored in death. I have taken enough of your time and I appreciate that you listened to me. Telling the story helps me feel better, but now I must go back to wondering what has happened [unless]."); 
}

if($text=~/unless/i){

	$client->Message(12,"You seem quite interested in what I have said here and while I could be wrong, when I look at you I see a glimpse of the same honor-filled spirit I saw in them. I know it may be too much to ask, but we have all been suffering for a long time and. well, if you ever find yourself inside Tacvi, and you come across the remains of an adventurer, bring back what you find. For me, I would like to have the writings of Xenaida, Wijdan, Rytan, Kaikachi, Vahlara, Frizznik, Zajeer, and Valtron. As for the rest of them, I would ask that you return the memories to the six they left here on the boat. While this task is not an easy one, I shall handsomely reward anyone who returns all of these things to the proper people.") ;
	quest::setglobal("greatadventures", 7, 5, "F");
}


if($text=~/what have i turned in/i){

		$client->Message(9,"At the moment, you have turned in the following.");

if($writingsa == 1) {

		$client->Message(12,"You have turned in Absor's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Absor's Writings.");

}

if($writingsb == 1) {

		$client->Message(12,"You have turned in Frizznik's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in a Frizznik's Writings.");

}

if($writingsc == 1) {

		$client->Message(12,"You have turned in Kaikachi's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Kaikachi's Writings.");

}

if($writingsd == 1) {

		$client->Message(12,"You have turned in Lyndro's Writingse.");

}

	else {

		$client->Message(9,"You have NOT turned in Lyndro's Writings.");

}

if($writingse == 1) {

		$client->Message(12,"You have turned in Maddoc's Writings.");

}

	else {


		$client->Message(9,"You have NOT turned in Maddoc's Writings.");

}

if($writingsf == 1) {

		$client->Message(12,"You have turned in Prathun's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Prathun's Writings.");

}

if($writingsg == 1) {

		$client->Message(12,"You have turned in Rashere's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Rashere's Writings.");

}

if($writingsh == 1) {

		$client->Message(12,"You have turned in Rytan's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Rytan's Writings.");

}

if($writingsi == 1) {

		$client->Message(12,"You have turned in Silius' Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Silius' Writings.");

}

if($writingsj == 1) {

		$client->Message(12,"You have turned in Vahlara's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Vahlara's Writings.");

}

if($writingsk == 1) {

		$client->Message(12,"You have turned in Valtron's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Valtron's Writings.");

}

if($writingsl == 1) {

		$client->Message(12,"You have turned in Wijdan's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Wijdan's Writings.");

}

if($writingsm == 1) {

		$client->Message(12,"You have turned in Xenaida's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Xenaida's Writings.");

}

if($writingsn == 1) {

		$client->Message(12,"You have turned in Zajeer's Writings.");

}

	else {

		$client->Message(9,"You have NOT turned in Zajeer's Writings.");

}

if($writingsa == 1 && $writingsb == 1 && $writingsc == 1 && $writingsd == 1 && $writingse == 1 && $writingsf == 1 && $writingsg == 1 && $writingsh == 1 && $writingsi == 1 && $writingsj == 1 && $writingsk == 1 && $writingsl == 1 && $writingsm == 1 && $writingsn == 1) {

	$client->Message(12,"I thank you, $name, and as I promised, here is a reward for your efforts. Guard this with your life, for while it may not seem like much, I believe its potential will increase when we discover more about these beings and the realm they came from");

	quest::summonitem(67606); # Tome of New Beginnings

}

}
}


sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 67608 => 1)) { # Valtron's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsk", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67612 => 1)) { # Vahlara's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsj", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67609 => 1)) { # Frizznik's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsb", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67607 => 1)) { # Zajeer's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsn", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67610 => 1)) { # Wijdan's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsl", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67611 => 1)) { # Rytan's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsh", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67614 => 1)) { # Xenaidia's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsm", 1, 5, "F");
}

if (plugin::check_handin(\%itemcount, 67613 => 1)) { # Kaikachi's Writing

	quest::say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, $name, and ask that you bring more if you find them.");

	quest::setglobal("writingsc", 1, 5, "F");
}


plugin::return_items(\%itemcount);

}


#END of FILE zone:abysmal ID:279031 -- #De-van_Szostek.pl

