sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name!  Please be do not speak too loudly while inside the library.  If you need anything special. feel free to ask me. I am a member of the Crimson Hands and my specialty is divination.  In my research I have stumbled across many [rare tomes].");
}
if($text=~/what rare tomes/i){
quest::say("Why. just yesterday I stumbled upon what I believe to be an excerpt from Miragul's own treatise on the origin of the creatures known as scarecrows.  Such a work is heresy and would be destroyed if the High Council knew of its existence so I have been tight-lipped about my discovery.  If you would like to see it. I will show it to you. for a nominal donation of 20 gold pieces."); }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, $gold >= 20)) {
  quest::say("Oh, yes. Very good friend. Here is the document I mentioned. It would seem to be part of a larger body of work, but this page describes a Teir'Dal who it seems was instrumental in creating the head of the very first scarecrow. You may keep that as it is merely a magical duplicate of the original document which I have carefully hidden.");
    quest::exp(500);
    quest::summonitem(18030);
}
if (plugin::check_handin(\%itemcount, 12590 => 1)) {
  quest::say("Unbelievable, you located the larger body of work I had been searching for! The text is scribbled in old Teir`Dal, but many of the words have been smeared and blurred. In fact, there are deep claw marks on the bindings and surface of the tome. It looks like the current owner didn't care well for it. Hmm. . . This translation of it may be spotty, but I think I'll be able to convey the general meaning for you. Ah, here you are. A duplicate copy of the writings. I'll hold on to the original as it won't be of much use to you. Many thanks, $name!");
  quest::summonitem(12591);
}
}
#END of FILE Zone:erudnext  ID:98016 -- Sornita_Eltern 

