#This version of Hero Goxnok will lead us to the drachnid spy and the traitor. When the spy is killed, a second version of Goxnok will spawn, and he will reveal that he is in fact the traitor. This is all part of Greenmist quest number five.

sub EVENT_SAY {
 if($text=~/news of the charasis tome/i){
  quest::say("The Charasis Tome has been scribed and now another copy exists. The traitor obviously wants to keep a copy for himself. I am told you will deliver both copies to Lord Qyzar along with your zealot khukri and you shall be awarded that of a crusader. Let us rest for a minute and then I shall show you the meeting place.");
  quest::start(215);
  $npc->SetAppearance(1); 
  quest::say("Come along. If we get separated, look for the humanoid wolf camp and beyond the tunnel, you shall find the meeting place of the spider riders and the traitor.");
  quest::settimer("Talk1",180);
  }
}

sub EVENT_SIGNAL {
 if($signal == 0) {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ();
 my $h = $npc->GetHeading();
 quest::spawn2(84401,0,0,$x,$y,$z,$h); # NPC: #Hero_Goxnok
 quest::depop();
 }
}

sub EVENT_TIMER {
 if ($timer eq "Talk1") {
  quest::emote("stops abruptly and shudders with fear. 'Look!! There, past the wolf people. Near an ancient tunnel can be found the meeting place. I fear we may be too late. I thought I saw a shadow dash from the tunnels, but I did not see any spider riders. We'll see when we reach it.'");
  quest::stoptimer("Talk1");
  quest::settimer("Talk2",30);
 }
 if ($timer eq "Talk2") {
  quest::emote("looks over at you and sizes you up before continuing on. He says, 'We should continue, follow me.'");
  quest::stoptimer("Talk2");
 }
}

#Submitted by Jim Mills