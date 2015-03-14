#Lohie_Cantare.pl
#Lohie's Music Exhibit


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Greetings, $name. Have you come to see my exhibit? I am honored but also sad to say it is incomplete. Mine will be the finest presentation of musical history you will find, once I finish assembling my display. If you have some free time, perhaps you could help me collect some still missing [pieces]?");
  }
  if($text=~/pieces/i) {
    quest::say("'I need you to bring me a Minotaur Horn, Tambourine of Rituals, Orcish Lute of Singing, and a Stretched Skin Drum. If you could find these for me, I would be most overjoyed. You will need to get a Collector's Box from [Merri] to keep them in. Close the box up tightly and return it to me once you have placed the instruments inside. Hurry back and we shall have a grand festival!");
  }
  if($text=~/merri/i) {
    quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28080 => 1)) {#Collection of Instruments
    quest::emote("inspects each instrument carefully. 'These are in much better condition then I thought I would get them in. Adding these to my exhibit pleases me greatly. As promised, here is something for you.'");#Borrowed text, no final turn in text.
    quest::summonitem(28239);#Fine Antique Amice
  }
  plugin::return_items(\%itemcount);
}#Done