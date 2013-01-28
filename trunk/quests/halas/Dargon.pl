sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello there, $name.  Can I interest you in any components to help you in your research?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14331 => 1)) { #Ro's Breath
    quest::say("So, I've been discovered! You must know Camin - he is one of the only people who could have recognized my work. I have worked very hard to mask my presence here.");
    quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
    $npc->Depop(1);
  }
  #Return Love Note handin
  if (plugin::check_handin(\%itemcount, 14335 => 1)) {
    #quest::targlobal("wizepicA",1,"D30",29089,$charid,29);
    quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
    quest::settimer("sendsignala",3);
  }
  #Return Oil Note handin
  if (plugin::check_handin(\%itemcount, 18168 => 1)) {
    #quest::targlobal("wizepicA",2,"D30",29089,$charid,29);
    quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
    quest::settimer("sendsignalb",3);
  }
}

sub EVENT_TIMER {
  if ($timer eq "sendsignala") {
    quest::signalwith(29089,101,0); #signal arantir to set wizepicA = 1
    quest::stoptimer("sendsignala");
    $npc->Depop(1);
  }
  if ($timer eq "sendsignalb") {
    quest::signalwith(29089,102,0); #signal arantir to set wizepicB = 1
    quest::stoptimer("sendsignalb");
    $npc->Depop(1);
  }
}

#END of FILE Zone:halas  ID:29000 -- Dargon 

