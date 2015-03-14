# Gather Beaks
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Salutations, $name. I'm working on some magic that will protect the ship on the seas. I've never done anything like this before, but I have certainly fashioned new spells and magic over my years on Norrath. I suppose that is why I was asked to help. I met Nedaria many years ago and I believe she trusts me to handle this task. I could use some assistance in collecting some components I need, if you're [interested]."); 
}

if($text=~/interested/i){

quest::say("I appreciate your offer to help. I need three griffawn beaks from this area. If you could bring them to me, I will be able to compensate you for your time and effort."); 
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 66183 => 3)) { # Griffawn Beaks

quest::say("This is perfect and couldn't have come at a better time, I've very close to finishing up a new magic that may protect the ship."); 
quest::exp(10000);
quest::givecash(8,6,13,7);

}
}

#END of FILE zone:nedaria ID:182063 -- Ieandra_Pael.pl

