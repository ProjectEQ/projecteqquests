# Bat Fur
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){
	quest::say("Greetings, and welcome to my humble little shop. I sell and trade various goods for my fellow wizards of the Order of Three. My assistants, Hanlore and Drawna, specialize in magicians' and enchanters' goods and would be glad to help you, too.");  
	}

if($text=~/bat fur/i){
	quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");  
	}

if($text=~/rat whiskers/i){
	quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");  
	}

if($text=~/fire beetle eye/i){
	quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");  
	}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 13071 => 1, 13069 => 1, 10307 =>1)) { # Rat Whiskers, Bat fur, Fire beetle eye
	quest::say("Hmm. Good job, $name, let's give this a try. Flame and fire. Heat and spark. Touch of Ro, light this dark! Ahh. It stills needs a little work, I guess. Thanks for your help, here's a little something for your effort.");  
	quest::faction(240,5); # Order of Three
	quest::faction(135,5); # Guards of Qeynos
	quest::faction(21,-7); # Bloodsabers
	quest::faction(235,-7); # Opal dark Briar
	quest::exp(200);
	quest::givecash(8,0,0,0) # 8 Copper
	}

}

sub EVENT_SPAWN {
  quest::settimer("repeat", 350);
}

sub EVENT_TIMER {
    quest::say("Drawna.. Are we all out of bat fur again?");
	quest::signal(1051,1);
}

sub EVENT_SIGNAL {
    quest::say("Hmmm.. Let's see if we can find someone to help relenish our stock of [rat whiskers] and [bat fur]. I need these items for a new little experiment I'm working on.");
}

# END of FILE Zone:qeynos ID:1118 -- Caleah_Herblender.pl

