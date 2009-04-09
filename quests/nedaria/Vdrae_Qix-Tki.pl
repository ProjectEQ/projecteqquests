# Gather Hides
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("I am a master tailor, friend, and I'm falling behind in my work here. I am making gloves for all the workers that are here and that will be coming soon. Will you [help] me get through this task?"); 
}

if($text=~/help/i){

quest::say("Thank goodness! It's very hard to be efficient when I have to hunt, then work the hides, then sew! If you could bring me four basilisk or silverfur hides, I will be able to reward you."); 
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 66186 => 4)) { # Basilisk Hides

quest::say("What a relief! I was just about out of hides to work with it. Thank you! Here is your reward. Oh, did you know that Morden Rasp has had the Grozmok Stone for some time? Several of us knew, but were sworn to secrecy. Morden plucked it right out of the smelly hands of the trolls at Broken Skull Rock, I hear."); 
quest::exp(10000);
quest::givecash(11,10,11,6);

}

elsif (plugin::check_handin(\%itemcount, 66193 => 4)) { # Silverfur Hides

quest::say("What a relief! I was just about out of hides to work with it. Thank you! Here is your reward. Oh, did you know that Morden Rasp has had the Grozmok Stone for some time? Several of us knew, but were sworn to secrecy. Morden plucked it right out of the smelly hands of the trolls at Broken Skull Rock, I hear."); 
quest::exp(10000);
quest::givecash(11,10,11,6);

}

}

#END of FILE zone:nedaria ID:182059 -- Vdrae_Qix`Tki.pl

