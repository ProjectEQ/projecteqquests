sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Please leave me be if they catch me talking to you I will be punished again.");
 }
 if($text =~ /Who is Historian Selrin/i) {
	quest::say("Historian Selrin is the lorekeeper of Chardok. He spends most of his time in the library but I hear he and the Prince often talk for hours on end. Please you must get that paper back from him and return it to my brother. Don't worry about me, your timely intrusion has provided an opportunity for my escape.");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 67054 => 1)) {
	quest::say("Oh thank Brell I thought I would never be found. My borther Pellillo is right we were wrong to take the paper and I realized that shortly after, but when I started the journey back I was captured by a band of Sarnaks and brought here. When they found the paper, the Queen demanded that it be researched and so she gave it to [Historian Selrin].");
        quest::unique_spawn(103217,0,0,1291.27,-559.92,-159.75);
        quest::signalwith(103217,1,0);
 }
}