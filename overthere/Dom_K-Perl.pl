sub EVENT_SAY {
if($text=~/hail/i){
quest::say("Welcome to my little refuge of the mind. Here you may find passage to the grand worlds within a fine book. I have few books for sale, but any good book is rare in the realm of Norrath. On occasion, I even have [rare finds]. Be sure to use good lighting when reading. Strain the brain, not the eye, I always say.");
}
if($text=~/rare finds/i){
quest::emote("starts rummaging through a pile of books and scrolls.");
quest::say("Oh yes, yes, yes. Rare books occasionally make their way to me. Ahhh!! I have one title, Before Green. Sounds like a bit of fiction. What would you like to [purchase]?");
}
if($text=~/purchase/i){
quest::emote("puts on a monocle and begins to look over the book.");
quest::say("Hmmmm, Looks fairly valuable. In honor of the book's title, I shall allow you to trade for it with a fine emerald. What a bargain!");
}
if($text=~/scribed tome pages/i){
quest::say("I can create a special magic scribed tome page. It has no words, but is not meant to be read. To create one, I will need some illweed parchment and my fee of 2 gold pieces. Once I have these, you may have one scribed tome page.");
}
if($text=~/spectacle/i){
quest::say("My spare reading spectacles were stolen by froglok raiders in the swamps. I gave chase but the little buggers hop faster than I run. They were hopping with such fury that they dropped a [tome binder].");
}
if($text=~/binder/i){
quest::say("I have a tome binder with the title 'The Origins of Pain'. Sounds like good reading, but it appears to be missing the pages it once held. If you want it, I shall give it to you for a bottle of blood ink from Cabilis and my spare reading spectacles.");
}
  }
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,10029=> 1)){
quest::exp(500);
quest::summonitem(18068);
}
plugin::return_items(\%itemcount); # return unused items
  }
#END of FILE Zone:Overthere ID:93148 – Dom_K`Perl (Dom_K-Perl.pl)