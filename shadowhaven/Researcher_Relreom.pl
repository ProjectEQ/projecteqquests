sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hello there. Im afraid I really dont have time to have a conversation though. I have been sent on a very important task to retrieve some lost pages to a very [important book].");
 }
 if($text=~/important book/i){ 
  # Monk Epic 1.5
  quest::say("Oh dear, I shouldnt have said anything at all. I guess another set of eyes on the look out couldnt hurt though. I have been searching for some pages that were torn from a book in Erudin. These pages are illegible to the untrained eye due to the enchantment we place on them in case of such an occurrence, but I am afraid if the [pages] arent recovered soon, the enchantment will fade exposing our secrets.");
 }
 if($text=~/pages/i){ 
  # Monk Epic 1.5
  quest::say("The pages are from a very special book. I was not actually told more than that about the book, except that a gang of mercenaries took them. Since they will not be able to read them they probably will just end up tossing them away making it that much harder to locate them. I trust you will be able to locate the four of them though and aid me. Be safe and please return when you have found all four sections of parchment.");
 }
}

# Note: Pages are ground spawns. Spoiler of zone & coordinates below.
# Page: Zone: Gunthak - Coordinates: -730,-340
# Page: Zone: Hole - Coordinates: +65,+90
# Page: Zone: Howling Stones - Coordinates: +100,-20
# Page: Zone: Akheva Ruins - Coordinates: +711,-1426  

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 48104 => 1, 48105 => 1, 48106 => 1, 48107 => 1)){
  # Monk Epic 1.5
  quest::say("You have returned with the pages but I am afraid I have nothing to reward you with but my thanks. I am sure Tomekeeper Danl will be able to give you something though if you want to bring them to him. Yes! That is what we will do. Take the pages back and give them to Tomekeeper Danl he will be overjoyed to have them back!");
  # Summon: Danl's Missing Book
  quest::summonitem(48132);  
 }
}


# End of File