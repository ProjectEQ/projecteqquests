#BeginFile: torgiran\#a_crazed_miner.pl
#Quest for Torgiran Mines - a crazed miner (QUEST)

sub EVENT_SPAWN {
  my $x = $npc->GetX(); 
  my $y = $npc->GetY(); 
  my $z = $npc->GetZ(); 
  my $h = $npc->GetHeading(); 
}

sub EVENT_SAY {
  if($text =~ /hail/i) {
    quest::emote("looks up at you with an obscene grin on his face. 'The blackness oozes dark as night, if I were you I'd run in fright. If you don't learn to hear, in the mines you're sure to disappear, never to return again, unless of course you bring some friends. Even so, as it goes, you'll soon be without your toes!' He then begins to laugh quietly under his breath.");
  }
  if($text =~ /are you heltin/i) {
    quest::say("Heltin? Heltin!?!? I knew a Heltin once! he was quite a good looking fellow if I remember correctly! Always very popular with the ladies at the Mermaid's Lure! I wonder what ever became of him. Oh yes, now I remember, he went Batty! Stark raving mad!' He begins to poke Katarin hard in the head presumably to accentuate his friend's madness. Although he rather seems to be enjoying himself as well.");
  }
  if($text =~ /why did you go mad/i) {
    quest::say("Mad? Who's mad? You are!? I'm sorry to hear that, if Heltin was here with his lute perhaps he could sing a song to ease your mind! Since he's not at home right now and there's no lute then I guess you'll just have to stay insane! Luckily for you I'm here to keep us all alive though! Come, help me catch a snipe for dinner, I hear they are good eating! You just have to take your helmet off, and bang the back end of it with your hand and they'll fly right in!");
  }
}
 
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 59025 => 1)) { #An old water logged lute
    quest::emote("looks over the lute for a moment. He sets his fingers carefully over the strings, closes his eyes, and begins to play. A soft aria fills the stale air of the cavern with a strange warmth. Something inside you awakens that you had long forgotten. So long forgotten that you are unable to conjure a name for it from your memory. As the song ends the strange feeling leaves you as the darkness of the cavern closes in once more around you.");
    quest::say("Thank you my friends, for returning my senses to me. The dark dust of the mines had torn my sanity from me. Luckily my hands remembered the songs my mind had forgotten. Here, take this note to my son Jusean in Qeynos. He'll be able to transcribe a proper song for you from it. I must stay here and attempt to save the other miners from the dark insanity of the mines.");
    quest::summonitem(59042); #A stained parchment
    quest::say("'Tell Jusean. . .' Suddenly you hear a bowstring snap as an arrow sails through the air and strikes Heltin in the chest. He lies twitching before you for a moment before he stops and lies completely still.");
    quest::spawn2(226021,0,0,$x,$y,$z,$h); #a crazed miner (KOS)
    quest::depop();
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: torgiran\#a_crazed_miner.pl (226169)