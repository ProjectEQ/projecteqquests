sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Welcome! It is good to see our disciples can still outsmart the guards of Qeynos and make it to the Shrine of Bertoxxulous. Our ranks are best filled with disciples such as yourself. We have need of you. Do you wish to serve the Lord of Disease or not?");
  }
  if($text=~/serve the lord of disease/i) {
    quest::say("Aye! That is good. Of late, we have heard news of a message that will be sent to the Treefolk of the Jaggedpine. Antonius Bayle will send word to the Jaggedpine that certain requests will be met. We must intercept this message. That is all you need to know. Go and find Antonius Bayle's messenger, Gharin, He should have the message. Get it by any means necessary and return it to me. Go now!");
  }
}
#END of FILE Zone:qcat  ID:45087 -- Nomaria_Doseniar