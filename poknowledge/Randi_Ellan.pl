#Randi_Ellan.pl
#Randi's Floral Specimens
#Associanted recipe ID: 9122


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("And a good morning to you as well, $name. I can see by the gleam in your eye you are interested in learning more about the flowers of Norrath. Sadly my exhibit is not much to speak of. I require new [specimens] to help build my collection.");
  }
  if($text=~/specimens/i) {
    quest::say("If you could find some for me, I would be ever so grateful. I need a Black Root, Maneater Bud, Yew Leaf, and a Twilight Orchid. If you should come across them, handle them with care. Be sure to get a Collector's Box from [Merri] to keep them in. Close the box and return it to me.");
  }
  if($text=~/Merri/i) {
  	quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");#Text from Holly's quest.
  }
}
    
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28083 => 1)) {#Collection of Plants
    quest::say("Plants and flowers are a special treasure I keep close to my heart. Did you ever stop to marvel at how beautiful these specimens are? I thank you greatly for them. Here, take this in return.");
    quest::summonitem(28238);#Fine Antique Corset
  }
   plugin::return_items(\%itemcount);
}#Done