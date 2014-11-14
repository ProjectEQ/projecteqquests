# Quest: Tailfang

# NPC: Dar Khura Pyjek
# Zone: Shar Vahl

sub EVENT_SAY {
  if ($text =~ /hail/i) {
    quest::say("And hail to you adventurer. It is good to see one willing to brave the craters. I must warn you that there are deadly [scorpions] all around these parts. Some of them are quite large indeed, and their poison can be very deadly.")
  }
  elsif ($text =~ /scorpions/i) {
    quest::say("It would be a great help if you assist us in reducing their numbers. As their numbers grow, more and more of them venture into our city and endanger our citizens. [Spiritist Ragnar] has supplied me with the means to create an anti venom, but I will need one of their stingers in order to do so. If you bring one of their stingers to me, I will cure you of such poisons.")
  }
  elsif ($text =~ /spiritist ragnar/i) {
    quest::say("Spiritist Ragnar is the owner of the alchemy shop in the merchants quarters. He has been researching the venom of the whiptail scorpions. If you happen to find any of their glands, it would be a tremendous help to him if you could supply him with some of these glands. Use caution, for there is a deadly one still roaming out there. We call him [Tailfang]. I would suggest steering clear of this little sucker? he is particularly nasty.")
  }
  elsif ($text =~ /tailfang/i) {
    quest::say("Tailfang has been responsible for many attacks. He is quite sly, and as yet our Taruun have been unable to find him. I saw him once, long ago. I was searching for bluecapped mushrooms among the stones when I saw something shiny underneath one of the rocks. As I got closer to look, Tailfang sprung at me with a dagger in hand no less! I swear this on my honor, although I still cannot believe it myself. I tried to slay the little bugger, but he ran off. I did get his dagger though, it's yours if you bring me proof of his death.")
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30667 => 1)) {
    quest::say("Great spirit you've done it! Thank you $name, we are in your debt. You have earned this weapon of the venomous scourge. Wield it with honor and pride.");
    quest::summonitem(30783);
    quest::exp(75000);
    quest::ding();
    quest::faction(132,20);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155285 -- Dar_Khura_Pyjek