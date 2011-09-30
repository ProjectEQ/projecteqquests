# Rat Fur Cap
# Rat Pelt Cape
# Rats Foot Necklace
# Snake Fang Necklace
# Created by Gonner

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 6) {
    quest::say("Get your rat fur caps here! Get your snakes fang necklaces here! Special discount prices.. this week only.");
	}
	if($wp == 9) {
    quest::say("Custom made rat pelt capes.. cheap, cheap, cheap!");
	}
	if($wp == 12) {
    quest::say("Feeling a bit unlucky lately? Gnoll pups always picking on you? Fire beetles attacking you whenyou aren't looking? what you need is a lucky rat's foot necklace! Satisfaction guaranteed!");
	}
	if($wp == 17) {
    quest::say("Get your rat fur caps here! Get your snake fang necklaces here! Special discount prices.. This week only.");
	}
	if($wp == 23) {
    quest::say("Feeling a bit unlucky lately? Gnoll pups always picking on you? Fire beetles attacking you whenyou aren't looking? what you need is a lucky rat's foot necklace! Satisfaction guaranteed!");
	}
	if($wp == 27) {
    quest::say("Menkes' discount fashions and jewelry, now open for business.. custom made hats, to fit any size head.");
	}	
}




sub EVENT_SAY { 

if($text=~/Hail/i){
	quest::say("Greetings, fine citizen of Qeynos, what can I make for you today?  How about a genuine, handmade [rat fur cap]?  Or maybe a lovely [rat pelt cape]?  Maybe you'd like a necklace?  For a small fee. I can make a nice [snake fang necklace] or a [lucky rat's foot necklace].");
	}

if($text=~/i want a rat fur cap/i){
	quest::say("Rat fur cap?  You're in luck, that happens to be my specialty, $name.  Just bring me 2 pieces of rat fur and 3 gold, and I'll make one up for you while you wait.");
	}

if($text=~/i want a rat pelt cape/i){
	quest::say("The rat pelt cape..  that happens to be my specialty!  I must say, it would be the perfect choice to go with that outfit you have on.  All I need are 3 rat pelts, those big ol' rats out in the hills work great for these capes, and 4 gold.  I must say, at these prices, everyone in Qeynos will be wearing one in a matter of weeks.");
	}

if($text=~/i want a snake fang necklace/i){
	quest::say("Hey, great choice..  the snake fang necklace just happens to be my specialty. $name!  Just bring me 3 snake fangs, and 2 gold.  With one of these around your neck, you're sure to be the center of attention down at Crow's..  or anywhere else you fill your mug.");
	}

if($text=~/i want a lucky rat/i){
	quest::say("Now that is exactly what you need my friend, a lucky rat's foot necklace..  and, it just happens to be my specialty!  Just bring me one rat's foot, some rat whiskers, and I won't even charge you any gold. Just buy me a honey mead, and you'll be the luckiest rat dodger this side of Highpass."); 
	}

}


sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 13064 => 2) && $gold == 3) { # a peice of rat fur
	quest::say("Hey. look at this. some of my best work, if I do say so myself. Enjoy, and tell your friends");  
	quest::summonitem(1050); # rat fur cap
	quest::exp(200);
	quest::faction(434,5); # Qeynos Citizen
	}

if (plugin::check_handin(\%itemcount, 13054 => 3) && $gold == 4) { # giant rat pelt
	quest::say("Hey. look at this. some of my best work, if I do say so myself. Enjoy, and tell your friends");  
	quest::summonitem(1051); # rat pelt cloak
	quest::exp(200);
	quest::faction(434,5); # Qeynos Citizen
	}
	
if (plugin::check_handin(\%itemcount, 13065 => 1, 13071 => 2, 13033 => 1)) { # rat foot, 2 rat whiskers and a honey mead 
	quest::say("Hey. look at this. some of my best work, if I do say so myself. Enjoy, and tell your friends");  
	quest::summonitem(1053); # rat's foot necklace
	quest::exp(200);
	quest::faction(434,5); # Qeynos Citizen
	}

if (plugin::check_handin(\%itemcount, 13067 => 3) && $gold == 2) { # snake fang
	quest::say("Hey. look at this. some of my best work, if I do say so myself. Enjoy, and tell your friends");  
	quest::summonitem(1052); # Snake fang necklace
	quest::exp(200);
	quest::faction(434,5); # Qeynos Citizen
	}

}


# END of FILE Zone:qeynos  ID:1142 -- Menkes_Tabolet.pl

