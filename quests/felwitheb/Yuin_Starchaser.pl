sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Welcome to the Keepers of the Art friend Allakhazam. I am Yuin Starchaser and it is my pleasure to assist new scholars wishing to study the arts of Enchantment, Wizardry, and Magery. Although much can be learned within these halls there is no substitute for experiences gained in the world outside Felwithe. The Koada'Dal have many enemies however, and it is wise to be prepared to face them. If you are new to the Keepers of the Art I will assist you in obtaining a [robe and clothing] suitable for study in the wilds.");
  }
  #Quest: Art Keepers Armor
  if($text=~/robe and clothing/i){
    quest::say("You will need this specially prepared Curing Kit to craft the Art Keepers clothing. The materials required vary depending on the piece of clothing you desire to craft. Once you have been outfitted in the garments return to me and you may be assistance with another [task]. Do you desire to craft a art keepers [cap], [wristband], [gloves], [boots], [sleeves], [pantaloons], or [robe]?");
    #Curing Kit
    quest::summonitem(17125);
  }
  #Quest: Art Keepers Armor 
  if($text=~/boots/i){
    quest::say("To craft Art Keepers Boots you require two [silk thread], giant wasp worker pollen, a woven spider silk, and two ruined forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
    #Tattered Boot Pattern
    quest::summonitem(19561);
  }
  #Quest: Art Keepers Armor 
  if($text=~/cap/i){
    quest::say("To craft an Art Keepers Cap you will require two [silk thread], giant wasp worker pollen, and a woven spider silk. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
    #Tattered Cap Pattern
    quest::summonitem(19555);
  }
  #Quest: Art Keepers Armor 
  if($text=~/gloves/i){
    quest::say("To craft Art Keepers Gloves you require two [silk thread], giant wasp worker pollen, two woven spider silks, and a ruined forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    #Tattered Glove Pattern
    quest::summonitem(19559);
  }
  #Quest: Art Keepers Armor 
  if($text=~/pantaloons/i){
    quest::say("To craft Art Keepers Pantaloons you require two [silk thread], giant wasp warrior pollen, two woven spider silks, and two forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
    #Tattered Pant Pattern
    quest::summonitem(19560);
  }
  #Quest: Art Keepers Armor 
  if($text=~/robe/i){
    quest::say("To craft an Art Keepers Robe you will require three [silk thread], giant wasp warrior pollen, two woven spider silks, and a pristine forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
    #Tattered Robe Pattern
    quest::summonitem(11395);
  }
  #Quest: Art Keepers Armor 
  if($text=~/sleeves/i){
    quest::say("To craft Art Keepers Sleeves you require two [silk thread], giant wasp warrior pollen, a woven spider silk, and a forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
    #Tattered Sleeves Pattern
    quest::summonitem(19557);
  }
  #Quest: Art Keepers Armor 
  if($text=~/wristband/i){
    quest::say("To craft an Art Keepers Wristband you require a [silk thread], giant wasp drone pollen, and a woven spider silk. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
    #Tattered Wristband Pattern
    quest::summonitem(19558);
  }
  #Quest: Art Keepers Task
  if($text=~/task/i){
    quest::say("One of the responsibilities of the Keepers of the Art is to weave and maintain powerful magic wards that help protect Felwithe from enemy magic. An understanding of the magic wielded by Felwithes many foes is vital to the success of our protective wards. With the help of the paladins of the Koada'Vie we have discovered many of the secrets of the orcish shaman that reside in the citadel of Clan Crushbone to the north of the Faydarks but there is still much to learn. The task I have to present you will take you into the [Crushbone] Citadel itself.");
  }
  #Quest: Art Keepers Task
  if($text=~/crushbone/i){
    quest::say("The entrance to the Citadel can be found on the northern edge of the Greater Faydark. Once within the citadel seek out the Orc Thaumaturgist and obtain his book of spells. Once you are in possession of the Orc Thaumaturgists Spell Book return it to me so that the masters of the Keepers of the Art may study its contents.");
  }
}


sub EVENT_ITEM {
  #Handin: Orc Thaumaturgists Spell Book
  if(plugin::check_handin(\%itemcount, 20293 => 1)){
    #Quest: Art Keepers Task
#---Commented out quest say until text is captured from live. Handin works.
#    quest::say("");
    #Rough Art Keepers Initiate Staff
    quest::summonitem(20296);
  }
  #Handin: Pristine Forest Drakeling Scales, Arborean Amber
  elsif(plugin::check_handin(\%itemcount, 20271 => 1, 20274 =>1)){
    #Quest: Art Keepers Task
#---Commented out quest say until text is captured from live. Handin works.
#    quest::say("");
    #Art Keepers Initiate Staff
    quest:summonitem(20332);
  }
}

#SQL Recipes have been submitted