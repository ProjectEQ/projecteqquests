#zone: gunthak - NPC: Researcher_Alvarik (224211)
#Started by Angelox, finished by Kilelen
#Lots of cleanup by Cavedude, thanks!
#High Level Research

sub LiarLiar {
  quest::say("Do you take me for a fool? It is obvious that you are not what you state. Begone from my sight, your false statements disgust me and insult the realms of the arcane.");
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there. Are you too a student of the arcane?");
  }
  if($text=~/student of the arcane/i) {
    quest::say("Excellent. I hold myself as a master of researching the arcane. Even though I study mostly in the art of wizardry, I still carry tomes of the other realms. If you are a master of research and would like to borrow a copy of the research tome, let me know what school of magic you belong to and I may be able to help you out. I also carry with me hand copied works of the masters. If you like you can buy one from me for a small fee.");
  }
  if($text=~/enchanter/i) {
    if (($class eq "Enchanter") && ($client->GetSkill(58) > 100)) {
      quest::say("So you fancy yourself an enchanter? I dabble a bit in it myself, though I am more interested in the art of explosions! Nevertheless, here is the Phantasmist's Tome. Good luck to you in your studies!");
      quest::summonitem(17652); #Phantasmal Tome
    }
    else {
      &LiarLiar();
    }
  }
  if($text=~/wizard/i) {
    if (($class eq "Wizard") && ($client->GetSkill(58) > 100)) {
      quest::say("So you too study wizardry! Isn't it the most fascinating of the four realms of magic? Well I won't keep you, here is the Sorcerer's Lexicon. Good luck to you in your studies.");
      quest::summonitem(17655); #Sorcerer's Lexicon
    }
    else {
      &LiarLiar();
    }
  }
  if($text=~/magician/i) {
    if (($class eq "Magician") && ($client->GetSkill(58) > 100)) {
      quest::say("So you too study summoning! Isn't it the most fascinating of the four realms of magic? Well I won't keep you, here is the Arch Magus Grimoire. Good luck to you in your studies.");
      quest::summonitem(17653); #Arch Magus Grimoire
    }
    else {
      &LiarLiar();
    }
  }
  if($text=~/necromancer/i) {
    if (($class eq "Necromancer") && ($client->GetSkill(58) > 100)) {
      quest::say("So you study necromancy! Isn't it the most fascinating of the four realms of magic? Well I won't keep you, here is the Warlock's Book of Binding. Good luck to you in your studies.");
      quest::summonitem(17654); #Warlock's Book of Binding
    }
    else {
      &LiarLiar();
    }
  }
}
sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}