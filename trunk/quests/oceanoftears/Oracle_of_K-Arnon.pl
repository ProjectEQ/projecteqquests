#Scripted By: Fatty Beerbelly, modified by Kilelen to finish Book of Turmoil
# Gonner added Phylactery Will Get You Nowhere quest

sub EVENT_SAY {

if($text=~/hail/i){
	quest::say("Greetings, $name, I am the Oracle of K'Aron. Do you quest for [knowledge] yourself, or do you offer that which I [seek].");
	}

if($text=~/knowledge/i){
  	quest::say("I have lived long and have insight into many matters, yet I despise charity. To learn from me, you must first bring me that which I [seek].");
	}

if($text=~/seek/i){
	quest::say("I seek knowledge, which is superior to all things. And no knowledge is greater than that which is contained within the [Tome of Ages].");
	}

if($text=~/tome of ages/i){
	quest::say("The Tome of Ages has been compiled over the millennia by the Scribes of [Dal]. It was divided into seven distinct [books] by the scribes to keep the knowledge from one such as me. That said, with aid, I shall unite these books and the Tome of Ages shall be mine.");
	}

if($text=~/dal/i){
	quest::say("They were elves once, but now are Teir'Dal, and as evil as they are wise. Many tomes have they written, but none greater than the Tome of Ages.");
	}

if($text=~/books/i){
	quest::say("The seven books that make up the Tome of Ages are those of [Enlightenment], [Scale], [Turmoil], [Monuments], [Elders], [Blood], and the [Lost].");
	}

if($text=~/enlightenment/i){
	quest::say("I do not seek the Book of Enlightenment at this time, but I might have need of it in the future.");
	}

if($text=~/scale/i){
	quest::say("Ah, the Book of Scale.. It would be wondrous indeed if you could recover the Book of Scale for me. If you do manage to procure the Book of Scale, I will gladly part with an artifact of my own that may be of interest to you.");
	}

if($text=~/turmoil/i){
	quest::say("Ah, yes! The Book of Turmoil. I seek this book, and should you find it and return it to me, I will reward you with secret knowledge.");
	}

if($text=~/monuments/i){
	quest::say("I do not seek the Book of Monuments at this time, but I might have need of it in the future.");
	}

if($text=~/elders/i){
	quest::say("I do not seek the Book of Elders at this time, but I might have need of it in the future.");
	}

if($text=~/blood/i){
	quest::say("I do not seek the Book of Blood at this time, but I might have need of it in the future.");
	}

if($text=~/lost/i){
	quest::say("I do not seek the Lost Book at this time, but I might have need of it in the future.");
	}


}


sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount, 18302 => 1)){ # Book of Scale
	quest::summonitem(19072); # Miragul's Phylactery
	}

if(plugin::check_handin(\%itemcount, 18202 => 1)){ # Book of Turmoil
	quest::say("Thank thee for this tome. Be sure to check back with me later, as I might have another task for thee.");
	quest::summonitem(10071); # Glowing Torch
	quest::faction(236, 5);
	quest::faction(237, -10);
	quest::exp(72900); # 10% of level 10 xp
	}
	
if (plugin::check_handin(\%itemcount, 55274 => 1)) { # Letter for the Oracle
	quest::say("You walk a dangerous path if you seek to construct a phylactery. I can indeed assist you, but you must both pay my price of knowledge for knowledge and prove to me that you are capable of controlling the forces you might unleash. I seek six volumes of magical power and knowledge that are spread across the commonly known lands of Norrath and even beyond, in the planes. For each you bring me I shall instruct you on the next step in the process and provide you with one of the required pieces. Completing each step will require acquiring even more items. The process is time-consuming, but the power of a phylactery is such that it will benefit even a bearer who does not aspire to lichdom. When you are certain you are ready to begin, talk to my assistant, Jeyular and hand him. hmmm, where shall we start? I think it would be fitting to begin with a tome by the great lich himself, Miragul."); 
	quest::setglobal("phylactory", 1, 5, "F");
	}

else {
  quest::say("I have no need for this item, $name. You can have it back.");
  plugin::return_items(\%itemcount);
	}

}


# END of FILE Zone:oot  ID:69044 -- Oracle_ofK-Arnon.pl

