# prayer shawl quests
# 

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name, please be seated and hear the Grand Historian, he is among the wisest of our people.");
  }
  elsif ($text=~/duties for the crown/i) {
    quest::say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service, return to me with four toes of our enemy, the Kromrif.");
  }
  elsif ($text=~/task/i) {
    quest::say("Every year the Dain replaces the trophies in his trophy room. There is a reward given for the best new trophy obtained. I intend to win this year and I will upgrade your prayer shawl for assisting me. Fill this box with ten Kromrif heads and bring me the combined contents along with the burlap shawl. I will submit the best one for the Dain's consideration.");
    quest::summonitem(17102);
  }
  elsif ($text=~/chore/i) {
    quest::say("The council agrees that you have demonstrated a disdain for our enemy, the Kromrif, that rivals our own. They now ask that you demonstrate your loyalty to the Dain by humbling yourself and serving our people. Give this, my seal, to Mordin. He will instruct you further.");
    quest::summonitem(1420);
  }
  elsif ($text=~/brewing/i) {
    quest::say("Ahh yes, good to see you again, $name. I wish it were under better circumstances that we meet today. For some time now we have sent teams of our finest rogues to gather intelligence for the Dain. Tanik Greskil is one of our best. He was recently sent into the heart of Kael Drakkel on a very important mission and has not returned. He is now long overdue, and fearing the worst, our wise council has asked me to dispatch a rescue party to determine what has become of him and return him to safety. I have decided to give you this opportunity to build upon the trust you have earned from the council. Will you accept this mission?");
  }
  elsif ($text=~/accept this mission/i) {
    quest::say("The council will be pleased to hear of your acceptance. Scour the regions surrounding the city of the Giants. Discover what happened to Tanik and, if possible, return him to Thurgadin. If you are successful, remember to hand me your woven shawl. We seem to be running low on them, but I must say Mordin has never had so much help in the kitchen. Anyway, I will eagerly await word of your findings. Good luck, and may Brell protect you.");
  }
  elsif ($text=~/advance my reputation/i) {
    quest::say("$name! Thank Brell you're here. I was about to send one of my Lorekeepers looking for you. It appears that the information Tanik acquired is most perilous indeed. The Dain has called an emergency session of the council and I must attend. We don't have the luxury of waiting for an appropriate task to arise, you must advance as soon as possible. Unfortunately, I have neither the time, nor the components to fashion the next few shawls for you. Ask Rexx Frostweaver about the prayer shawl and follow his direction carefully.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29125 => 4)) { #4 frost giant toes
    quest::say("Ahh, well done! On behalf of the Dain I thank you for making a dent in the number of our sworn enemy. Please accept this as a token of our appreciation. It is trivial, I know, but if you are as loyal as you claim to be, it will increase in power over time. It just so happens I have a [task] to further demonstrate your loyalty, $name.");
    quest::summonitem(1175);
    quest::exp(50000);
  }
  elsif (plugin::check_handin(\%itemcount, 1175 => 1, 1174 => 1)) { #burlap shawl and preserved kromrif heads
    quest::say("Ahh, some fine specimens indeed, $name. I will have the best of these mounted at once, wish me luck in the contest! Here is the Cloth Prayer Shawl of our people. Before I forget, the council has issued yet another [chore] for you to complete.");
    quest::summonitem(1176);
    quest::exp(100000);
  }
  elsif (plugin::check_handin(\%itemcount, 1176 => 1, 1422 => 1)) { #thoridains seal and cloth shawl
    quest::say("Well done, $name, the council will be impressed with your effort. Here is the woven prayer shawl, wear it with pride. I know there is talk of great plans for you, be sure to come back and ask me what the council has [brewing].");
    quest::summonitem(1177);
    quest::summonitem(1422);
    quest::exp(200000);
  }
  elsif (plugin::check_handin(\%itemcount, 1560 => 1, 1177 => 1)) { #tanik's note and woven shawl
    quest::say("Words cannot express our gratitude for your deeds outlander, you have saved a hero of our people from certain death. Please accept this, the Fur-lined shawl, as a token of our sincere appreciation. You are indeed among the most highly regarded ${race}s to set foot in Thurgadin. The next time we meet be sure to ask me how to further advance your reputation with the coldain.");
    quest::summonitem(1178);
    quest::exp(300000);
  }
  elsif (plugin::check_handin(\%itemcount, 1199 => 1)) {
    quest::say("Incredible! Never before has an outlander been skilled and determined enough to craft our sacred rune. You are now worthy of the Dains most perilous tasks. One is being prepared for you as we speak, please check back with me soon and I will outline the details for you. Until then, $name, allow me to commend you on a job well done!");
    quest::summonitem(1199);
    return 1;
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::faction(49,10); #coldain
  quest::faction(67,10); #dain
  quest::faction(188,-30); #krif
  quest::faction(189,-30); #kzek
}

# EOF zone: thurgadina ID: 115016 Name: Loremaster_Borannin

