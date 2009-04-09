# Necromancer Epic NPC -- a_thunder_spirit_princess



sub EVENT_SAY {

  if($text=~/hail/i) {

    quest::say("Greetings, travelers, welcome to the Plane of Sky! We are thunder spirits - this first island is our home. You are welcome to stay here as long as you like. If you wish to go to other islands you may purchase keys from the Key Master.");

 }

  if($text=~/gkzzallk/i) {

    quest::say("Gkzzallk lives far above here. We often take him tea because he's so nice to us fairies! He likes to chat with the others who live here and can often be found in the temple up above. If you give me a bit of money, I can go make sure he is home.");

 }

}

sub EVENT_ITEM {

  if($gold == 10) {

    quest::say("Thank you, $name. I will tell him to expect visitors.");

    quest::spawn2(71073,0,0,287.9,662.5,-54.1,109.3);

    quest::depop();

 }

}

sub EVENT_DEATH {

   $x = $npc->GetX();

   $y = $npc->GetY();

   $z = $npc->GetZ();

   
   quest::setglobal("sirran",1,3,"M10");

   quest::spawn(71058,0,0,$x,$y,$z);
} 





#END of FILE  Quest by: Solid11  Zone:airplane  ID:71032 -- a_thunder_spirit_princess




