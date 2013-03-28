sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55269 => 1)) { #Kayci's Note
    quest::say("Dis note covered in cat hair! Oh, Kayci give to you. Make sense now. You want upgrade your satchel? You need a Stone Frog Skin from Takish'Hiz. I have one. I guess I don't need it anymore. You can have. You need other things though if you want upgrade bag.");
    quest::emote("begins to scribble something on the note you gave to her. 'Take this note to Jilsuia Lluarea in Butcherblock camp. Mebbe she have another item you need to upgrade bag. Bye bye.");
    quest::summonitem(55270); #Shelie's Note
    quest::summonitem(55266); #Stone Frog Skin
  }
  plugin::return_items(\%itemcount);
}