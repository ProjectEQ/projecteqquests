# Help Kayin Escape
# Breakdown in communication 2

# Created by gonner
# Modified by Jaekob

sub EVENT_SAY {
  if($text=~/hail/i) {
  if ($faction >= 8) { # Require Warmly and greater faction
  if (defined $qglobals{bic} && $qglobals{bic} == 5) {
      quest::emote(" glances around nervously. Leave me be. I can't be seen talking to outsiders.");
  }
  }
  }
  if($text=~/talwin/i) {
    if ($faction >= 8) { # Require Warmly and greater faction
    if (defined $qglobals{bic} && $qglobals{bic} == 5) {
    quest::say("Yes ... Talwin. He and I were becoming fast friends until Ixvet took him. I am not sure what has happend to him, but if you would be [interested] in helping me I may be able to assist you in return.");
  }
  }
  }
  if($text=~/interested/i) {
    if ($faction >= 8) { # Require Warmly and greater faction
    if (defined $qglobals{bic} && $qglobals{bic} == 5) {
    quest::say("Good, good. As you may have noticed, the majority of these creatures are brutish types best suited for destruction. They are kept under control solely by strong [leadership].");
  }
  }
  }
  if($text=~/leadership/i) {
    if ($faction >= 8) { # Require Warmly and greater faction
    if (defined $qglobals{bic} && $qglobals{bic} == 5) {
    quest::say("The one who controls this area of the city goes by the name Ixvet Pox. She's as cruel as the rest, but considerably more intelligent which makes her even more dangerous. Fortunately, she's grown complacent and that gives us an [opportunity]. If we can destroy Ixvet, it will throw this area into chaos and we should be able to escape before order is restored.");
  }
  }
  }
  if($text=~/opportunity/i) {
    if ($faction >= 8) { # Require Warmly and greater faction
    if (defined $qglobals{bic} && $qglobals{bic} == 5) {
    quest::say("I've managed to get someone loyal to our cause placed within Ixvet Pox's entourage of personal servants and a skilled herbalist tends to her favorite fruits in the gardens. We will use this connection to poison the tyrant. Go talk with Kunimi Falade. You can find her working on the Hanging Gardens. Give her this ring as proof that you are there with my blessing and she will tell you what she needs.");
    quest::summonitem(64001); # Simple Stone Band
  }
}
}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 64016 => 1)) { #Crude Stone Ring
    quest::say("I heard what you did for Kayin and Njanu. When you help my brothers and sisters, you help me as well. You have my thanks. Njanu was correct about this ring. It holds magic deep within the rock.' Proteri Amari holds the ring between his hands and whispers to the stone. Glancing up, he says, 'It's all about knowing how to convince the stone that it wants to awaken.' When he opens his hands, the ring seems to glow from within. Proteri Amari says 'There you go. Again, thank you for your aid and take care with that ring. When the stone is freshly awakened, it tends to be a bit fragile.");
    quest::faction(231,10); # Nihil
    quest::summonitem(64017); # Njanu's Ring of Gratitude
    quest::exp(200000);
  }
  elsif(plugin::check_handin(\%itemcount, 64006 => 1)) { # Poisoned Fruid V1
    quest::say("I knew Kunimi would come through! Our day of escape is almost here. Take this to Abena Taifa. She is the servant who brings Ixvet his meals and is loyal to our cause.");
    quest::summonitem(64007); # Poisoned Fruit V2	
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
# END of FILE Zone:Barindu  ID:283084, 283135 -- #Proteri_Amari.pl