# Gather shells
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Esthetics are very important, my friend. I'm using the shells of the turtles to make some designs and patterns for the ship. I could use a hand collecting more of them though. Would you be [able] to help?"); 
}

if($text=~/able/i){

quest::say("Nice to see you have kindness in your heart. Bring me four turtle shells from the nearby turtles and I'll reward you. I'll also be able to give you some information."); 
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 66181 => 4)) { # Sea turtle shell

quest::say("Perfect, $name. Now I can crush these and have them mixed into some dyes as well as shape some patterns. Right, now for your information. One night recently, I heard Morden Rasp recount the tale of his early days as a rebellious student in the Rogues of the White Rose in Halas. They taught him all of his skills. I bet you didn't know that!"); 
quest::exp(10000);
quest::givecash(8,6,13,6);

}
}

#END of FILE zone:nedaria ID:182036 -- Ruanni_Annue.pl

