#Curator_Merri.pl
#Merri's Artifact Collection/The Collector's Box


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::emote("beams a smile as you approach. 'Welcome $name. This building will be the site of New Tanaan's greatest museum ever. I realize it looks a bit empty now, but just imagine how beautiful it will look after we fill it with rare and exotic treasures from all over. It's a very exciting time, no? Of course, we still need to obtain a few more [artifacts].'");
  }
  if($text=~/artifacts/i) {
    quest::say("Each of the people you see working here has their own exhibit to build and maintain. If you speak to them, they can tell you about which items they are looking for to add to their collection. Any items you collect will need to be placed inside one of my storage containers. If you [need a Collector's Box] at any time, just ask me. Also know I could use some help in retrieving some [special items] for my own exhibit.");
  }
  if($text=~/special items/i) {
    quest::say("My display will showcase the many interesting religious idols and artifacts from Norrath's history. Most of my gallery is complete, but I still need a few more items. I am looking for a Forlorn Totem of Rolfron Zek, Idol of Woven Grass, Coldain Fetish, and a Petrified Totem. Once you have these holy artifacts, close them up inside a Collector's Box and return it to me. Good luck.");
  }
  if($text=~/need a Collector\'s Box/i) {
    quest::say("Here you go, good luck on your hunt.");#Found text right after I uploaded this
    quest::summonitem(17769);#Collector's Box
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28082 => 1)) {#Collection of Idols
    quest::say("Thank you very much $name!  Here, please accept this as a reward for the fine work you've done.");#Text made up, can't find a reference
    quest::summonitem(28241);#Fine Antique Velvet Rose
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202016 -- Curator_Merri 

