sub EVENT_SAY {
  if(defined($qglobals{AidEinoDone}) && ($qglobals{AidEinoDone} == 1)) {
    if($text=~/hail/i) {
      quest::say("Why hello $name! It is good to see you again after our adventure in the Plane of Nightmare. Know that you have shown your worth to both Kerasha and myself. Should you ever need anything feel free to call upon us. May Quellious guide your path in the Planes!");
    }
  }
  else {
    if($text=~/hail/i) {
      quest::say("Greetings $name! I am Eino, Monk of Quellious and Aid to Councilwoman Kerasha! I spend my time as protector to the councilwoman as well as taking small jaunts to the planes to obtain items for her magic research. If you be a hearty individual with some allies you may be able to help me.");
    }
    if($text=~/help/i) {
      quest::say("Then meet me this night in the Plane of Nightmares. Near the waterfall of the upper plateau is a large tree. Should you see a soft glow, know that I am about. Signal to me by saying 'Quellious be my guide'. I shall emerge from my concealment.");
      quest::setglobal("EinoTrigger",1,5,"H6");
    }
  }
}
#END of FILE Zone:poknowledge  ID:202121 -- Aid_Eino