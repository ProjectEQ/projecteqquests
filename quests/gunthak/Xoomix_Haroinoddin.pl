#zone: gunthak NPC: Xoomix_Haroinoddin
#Angelox

sub EVENT_SAY { 
 if ($text=~/Hail/i){
  quest::say("Please. Please help me. I am quite weak and am being [held captive] here against my will");
 }
 if ($text=~/held captive/i) {
   quest::say("What are you doing?!?! Keep your voice down! You don't know who I am, you are just another adventurer who will look and feel sorry for me, but will do nothing to help!");
 }
 if ($text=~/tools/i) {
   quest::say("Well, I have many tools that I have either lost while in this place or that were taken from me because the guards felt they had too much value for me to possess them. I also need my gearbox from back home to construct my compass that I need to escape this place. I could set sail anytime I want, but I did not want to risk setting out to sea and dying alone because I didn't know my bearings. If you could [find my possessions] then I could make something that Golsodix would know came from me and he could give you my gearbox.");
 }
 if ($text=~/find possessions/i) {
   quest::say("That is great news, $name! I will need you to collect four things for me, if you are up to the challenge. My quarterstaff, silvered micro servos, metallic oil and personal toolbox. If you can find these things I can make you something to take to Golsodix. Please return to me with these things when you have found them and make haste because I have grown quite tired being stuck here for so long.");
 }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21979 => 1)) {
    quest::say("Brell be praised. Golsodix sent you didn't he? If only I had my [tools] I could go see him again.");
  }
  elsif (plugin::check_handin(\%itemcount, 21981 => 1, 21982 => 1, 21980 => 1, 21983 => 1)) {
    quest::say("I don't believe it. I never thought I would ever see these tools again. It is quite clear that you intend to help me and for that I am grateful. Here is a quick little something that put together for Golsodix. Bring him this and ask him for my gearbox. Once I have that, I think I can finally get home! Please come back soon!");
    quest::summonitem(21984);
  }
  elsif (plugin::check_handin(\%itemcount, 21985 => 1)) {
    quest::say("This is it indeed! It has everything I need in here to return home. Please take this charm that I have carried with me for many years. It has brought me good luck throughout my ordeal here and now that I am returning home, I do not think I will need it anymore. Safe travels to you $name, I must now ready my boat and finish my compass. May Lord Brell bless you forever!");
    quest::summonitem(61003);
    quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}