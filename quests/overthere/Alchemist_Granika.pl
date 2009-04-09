#Alchemist Granika will help us to discern the glowing cliff golem from the rest, the one who holds our Chunk of Tynnonium. He is part of the eighth and final quest in the Greenmist line.

sub EVENT_SAY {
 if($text =~ /hail/i) {
  quest::say("If you were sent to me, show proof or be gone from my sight!");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 3892 => 1)) {
  quest::say("If Heirophant Oxyn has sent this with you, I can assume that our visions were corect. The new age is calling us from the heavens. Prepare for battle. I will take this solution to the Outlander's gates and use it to reveal the location of the metal of prophecy. Should I not return, you will only need to find the creature that glows without the use of a torch. Deklium glows when it gets near the smallest trace of tynnomium. Prepare for battle, Crusader... I am off!");
  quest::start(273);
  quest::settimer("Depop",8);
  quest::spawn2(93190,0,0,1955,2825,-49,190); #Spawn the golem and three guards
  quest::spawn2(93126,0,0,1955,2794,-49,190);
  quest::spawn2(93126,0,0,1954,2855,-49,190);
  quest::spawn2(93126,0,0,1915,2825,-49,190);
  quest::signalwith(93077,0,0);
}
else{
  quest::say("I have no use for that. Take it back!"); #Made up text
  plugin::return_items(\%itemcount);
 }
}

sub EVENT_TIMER {
 if ($timer eq "Depop") {
   quest::stoptimer("Depop");
   quest::depop();
 }
}

#Submitted by Jim Mills