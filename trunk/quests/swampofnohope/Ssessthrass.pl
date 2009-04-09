# Necromancer Epic NPC -- Ssessthrass



sub EVENT_SAY {

  if($text=~/hail/i) {

    quest::emote("I do not wisssh to be bothered.");

 }

}
sub EVENT_ITEM {

  if(plugin::check_handin(\%itemcount, 20644 => 1)) {

    quest::say("Sssso, Emkel ssssent you to retrieve the manisi herb? I do not have the herb. The ssssarnak guard the herb. Apparently it is ssssacred to them. Only memberssss of their royal family are allowed to partake of it. They live deep in Chardok. They are hoarding what little of the precious herb there is. If you have an army, perhapssss you can bring me the herb and I can prepare it for Emkel. Bring back this ssssymbol as well.");

    quest::ding();

    quest::exp(500);

    quest::summonitem(20645);
  }
  elsif(plugin::check_handin(\%itemcount, 20654 => 1, 20645 => 1)) {
    quest::emote("looks at you and bows. 'You are truly a fearsome sssshadow weaver! Or you have powerful alliessss,' he adds a moment later. Ssessthrass pulls the manisi herb apart and hands a piece to you. 'Emkel will be most pleased with us both!'");

    quest::ding();
    quest::exp(1000);
    quest::summonitem(20650);
 }

  else {

    quest::emote("will not accept this item.");

    plugin::return_items(\%itemcount);

 }
}



#END of FILE  Quest by: Solid11  Zone:swampofnohope  ID:83074 -- Ssessthrass



