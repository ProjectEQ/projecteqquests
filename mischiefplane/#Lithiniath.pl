sub EVENT_SAY {

if($text=~/hail/i) {

quest::emote("lowers his horn towards $name. The air around you begins to waver as if immense heat was rising from the floor, yet the air feels no different. You begin to feel heavy and disoriented as you hear a loud wisper begin to speak yet you hear no sound at all. wHaT sEeK iT Is YoU FrOM LiTHiNiaTh?");
}

if($text=~/ph4t l3wtz/i) {
quest::say("Prince Thirneg of the Tunarean Court has amassed a vast supply of phat lewts! Perhaps you should ask him for some!");
}

}


#END of FILE zone:mischiefplane -- ID 126208 #Lithiniath.pl