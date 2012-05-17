sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Erh?  If you not be here to help Feskr with his [problem] then Feskr want you to leave.");
}
if($text=~/what problem/i){
quest::say("You wish to help?  Orrderrr of supplies I rrequest not arrive; ship sink.  Now Feskr needs supplies.  Feskr need bottle of Tunare's Finest. thunderhoof mushroom. tea leaf. and handmade backpack.  Rrrr. strange items but Feskr need to sell.  You bring. Feskr give you nice bag."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12360 => 1, 14914 => 1, 14915 => 1, 17969 => 1)) {
    quest::say("Ahhh. This will help. Many Kerrans will like these. Here. Take this old bag. I have too many. Maybe it help you.");
    quest::summonitem(17032);
    quest::exp(5000);
   }
 else {
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:kerraridge  ID:74076 -- Feskr_Drinkmaker 