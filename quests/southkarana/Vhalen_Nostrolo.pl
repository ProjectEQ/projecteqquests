# Winds of Karana
# Broken Lute

sub EVENT_SAY {

if($text=~/Hail/i){

   quest::say("I am out here composing my latest masterpiece. Unfortunetly a vile man of a hermit has taken off with two sheets of the song. If you can retrieve them I would be glad to play the tune for you.");
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount,13114 => 1)) { # Lisera Lute
   
   quest::say("Ahh, I see Cassius still don't trust his lute to anyone else. Please be kind to return this letter to him about his lute. It should make him quite pleased.");   
   quest::summonitem(18803); # Note To Cassius
   quest::faction(135,2); # Guards of Qeynos
   quest::faction(184,2); # Knights of Truth
   quest::faction(192,2); # League of Antonican Bards
   quest::faction(53,-5); # Corrupt Qeynos Guards
   quest::faction(105,-5); # Freeport Militia
   quest::exp(50);
   quest::ding();
}

elsif (plugin::check_handin(\%itemcount,13116 => 1,13119 => 1)) { # Winds of Karana sheet 1, Winds of Karana sheet 2
   
   quest::say("qqqq");   
   quest::summonitem(15722); # Song: Jaxan's Jig o' Vigor
   quest::faction(135,2); # Guards of Qeynos
   quest::faction(184,2); # Knights of Truth
   quest::faction(192,2); # League of Antonican Bards
   quest::faction(207,-5); # Mayong Mistmoore
   quest::faction(273,-5); # Ring of scale
   quest::exp(50);
   quest::ding();
}


}
#END of FILE zone:southkarana ID:14058 -- Vhalen_Nostrolo.pl