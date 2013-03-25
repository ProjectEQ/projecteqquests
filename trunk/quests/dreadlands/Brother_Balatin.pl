#Brother Balatin is for both the monk epic and the iksar-centric Whistling Fists. The monk epic work for this quest file has been done by Senzo, with the later Whistling Fists additions by Jim Mills.

sub EVENT_SAY {
 if($text=~/hail/i){
  # ROTWF [Part 1]
  quest::me("Brother Balatin turns to you. A transparent human face materalizes upon the skull. As he speaks the smell of rotted rat corpses rushes into your face. You must fight the urge to vomit.");
  quest::say("What discipline do you follow?");
 }
 elsif($text=~/lost circle/i){
  # ROTWF [Part 2]
  quest::say("Then we are one. The rebirth of our circle shall start with you. I have waited decades for your arrival. You should seek the living brothers within Tunaria. When you have earned your garb then you will be ready for the [true drape].");
 }
 elsif($text=~/true drape/i){
  # ROTWF [Part 3]
  quest::say("Seek the broken flute of our master. Taken from us by the Iksar twins of Vistrei. To me they will come and to me your robe and you will come the dawning of the new brotherhood.");
 }
}

sub EVENT_ITEM {
 #Handin: A Metal Pipe (12979) & A Metal Pipe (12980) & Robe of the Lost Circle (12256)
 if(plugin::check_handin(\%itemcount, 12979 => 1, 12980 => 1, 12256 => 1)){
  # ROTWF [Part 4][End]
  quest::emote("holds his arms out and a fine robe materializes before your eyes. You grab it just in time to see the skeleton fade from existence.");
  #Summon: Robe of the Whistling Fist (12970)
  quest::summonitem(12970);
 }
 elsif(plugin::check_handin(\%itemcount, 12429 => 1)){
  quest::emote("quickly stashes the flute inside of his ribcage, where it joins another. 'If you want the true Flute of Zan-Fi, you'll have to take it from me!'"); #Made this up, no text available
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(86155,0,0,$x,$y,$z,$h);
  quest::depop_withtimer();
 }
 plugin::return_items(\%itemcount); 
}

#Quest: The Robe of the Whistling Fist (Submitted By: Senzo)
