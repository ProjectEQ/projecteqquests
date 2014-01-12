sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("Greetings. You must be one of the adventurers that Fezbin told me about. It is a pleasure to meet such a brave individual. Where are my manners? My name is Taminoa Bialu and I compile all the information from our scouts in the [" . quest::saylink("city") . "] area of Taelosia.");
    }
    else {
      quest::say("I don't mean to be rude, but I am really busy at the moment. Unless you have something important to tell me, I must ask that you leave me be.");
    }
  }
  if ($text=~/city/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("Well, it appears the native inhabitants of Taelosia lived in a grand city once. This city is made up of four different areas named in their language. They are [" . quest::saylink("Qinimi") . "], [" . quest::saylink("Riwwi") . "], [" . quest::saylink("Barindu") . "], and [" . quest::saylink("Ferubi") . "]. Based off of early information, we believe each area had a specific purpose. I am still trying to decipher the native language to figure out what the names mean, but going off of visual information I can assume that Qinimi served as their court, Riwwi is where they held games, Barindu was a lush garden, and Ferubi was a central place of worship once. That is about the extent of my information as far as the intended purpose of each area. What they are now used for I can explain in further detail. Which area would you like to hear more about?");
    }
  }
  if ($text=~/qinimi/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("It appears the Muramites have made this some sort of stronghold. Destroying many of the native symbols, the invaders have converted the building that once served as the court into fortified headquarters. It is here you will find a structure called the Chamber of Souls, various pens to hold ukun, and a moat of sickly black sludge. The structures that the nihil once called home are all but destroyed now. Very sad indeed. That's where the legion keeps the bulk of the [" . quest::saylink("slaves") . "]. I believe that the scout for this area was caught sneaking around the housing district, but I have no proof. If you were to search this area, maybe you would find some sort of sign or marker he may have left. That would be helpful.");
    }
  }
  if ($text=~/barindu/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("This area holds the remains of what was once a place to build stone workers. We can only guess what purpose this part of the city served and all we know now is that it is home to some of the cruelest acts of violence against the nihil. I assigned this area to Talwin, a young wood elf new to the brotherhood. He was a proven scout eager to assist. Initially things were going well, but the information he was sending was not helping much. I think this worried him and resulted in him pushing his luck a little far. Ever since I told him his reports were lacking the vital evidence we needed I have not heard from him. Before Falcin passed on, I asked him if he had found anything out about Talwin and he shook his head. I know Talwin is still alive . . . he has to be . . . and I know that there must be some clues in the area of Barindu somewhere. He was diligent about recording what he found so I would assume that if he has been captured that his writings must be lying around the area somewhere. See if you can find two of his journal entries and bring them back to me. When you return please give what you find to my assistant Opury Foop. She is trying to help me organize my reports a little better.");
    }
  }
  if ($text=~/slaves/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("I see Fezbin saved some of the more dismal news for me. The legion has enslaved the natives of the continent. In the city area, these slaves are used mainly for menial tasks. Due to their fragile bodies, they cannot do any heavy lifting, but their knowledge of shaping stone makes them perfect for building new structures for the legion to use as well as altering current ones. They command the stone workers. I am not sure how the slaves are used in the temple areas. That information is held by L`diava.");
    }
  }
  if ($text=~/riwwi/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
     quest::say("Riwwi has to be the most interesting of all of the city areas. You see, this is where the coliseum is located. Now, we are not completely aware of how it was used before this invading army took up residence in the area, but now it is used for the merciless slaughter of the nihil. Early reports from our scout, Reyna, indicate that the slaves in the area would not interact with her until she proved herself. How she was able to do this I am not sure, but I would suggest trying to find something of Reyna's while I go over my Riwwi information. Come back to me when you find something.");
    }
  }
  if ($text=~/ferubi/i) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
    quest::say("The area called Ferubi was once a Taelosian temple. Now it is a place that reeks of pain and suffering. The invading army has desecrated the temple and the slaves within endure unimaginable torture. Based on the information our scout Smith Rondo sent to me before his disappearance, the invaders use this area to craft weaponry and conduct strange experiments. Smith's ability to sneak in and out of places quickly made him the ideal choice for this job, but like most of our other scouts he eventually got caught trying to reveal a vital piece of information. We have confirmed that he is still alive and I need you to go find him and give him this. It is a special farstone attuned to his aura so only he can use it. Please make haste in your mission, but be careful. You are entering the lion's den and if you are caught, I cringe to think what will happen.");
    quest::summonitem(67519);
  }
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67397 => 1)) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("Yes. This is exactly what I needed. Excellent job. Okay, now give me one moment to decipher this . . . hm. It seems that just before he was captured he was trying to communicate with the slaves in the area. The text is very hard to make out, but it looks like he may have been trying to get into the main headquarters. He was interacting with a particular slave named Sislono Nislan. This slave promised him a way into the headquarters only if he promised to rid the area of a tyrant, named Tixxrt. The rest of the parchment is undecipherable. I would suggest finding this slave and showing him this to see if he knows what happened.");
      quest::summonitem(67700);
    }
    else {
      quest::summonitem(67397);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67401 => 1)) {
    quest::say("Finally, you have returned and with some information I see. Kreshin contacted me in advance to let me know of your daring rescue. We are indebted to you. Now, back to business. While I cannot make out most of it, Kreshin has translated some of it and it appears to be a description of a ritual one of the head ikaav performs regularly. Apparently she has been trying to absorb the geomantic powers of the natives of Taelosia. The details are kind of sketchy as Kreshin was only able to translate so much, but some information is better than none, I always say. Anyway, it says here that the ritual is conducted in the Chamber of Souls. It used to be a large tower which the natives used to watch the shores. The tower was destroyed when the invaders took over the area and converted it to a ritual chamber. They used it in experiments centered on the extraction of magic. The head ikaav, known as Xictic, has been trying to use the powers of the native Taelosians to build an army of stone workers that he can directly control instead of relying on the ability of slaves. During the ritual, Xictic stands atop a platform which is suspended over a circle of platforms. The center platform holds an inanimate stone worker while eight ikaav stand on smaller platforms around the center. What happens next is not really known, but the end result is three lifeless slave corpses. According to this, she has not yet been successful, which I would say is good news. But if we do not stop her, she could easily reinforce the numbers with stone workers tainted by the touch of this legion. I know you have accomplished your goal, but I must ask that you find a way into this ritual and silence Xictic for good. Show this to Nislan. He should be able to decipher the images. I believe this is the key to getting into the ritual chamber. Now, hurry please and return to me with proof of Xictic's death so that I can make a final report on the Qinimi area to Fezbin.");
    quest::summonitem(67403);
  }
  elsif (plugin::check_handin(\%itemcount, 67511 => 1)) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("You have returned bruised, but not broken I see. I am disappointed to hear that he got away, but you are not at fault. We could not foresee how crafty these beings would be. The information you have given us will be invaluable. Fezbin will be pleased. Kreshin told me to give this to you. He believes it may be one of the fragments that will fit into the stone Fezbin gave you. Who knows, if you help me find the rest of our scouts we may yet find more fragments.");
      quest::setglobal("bic_qin",4,5,"F");
      quest::summonitem(67513);
      $client->Message(12,"You have completed a section of the Taelosian City!");
    }
    else {
      quest::summonitem(67511);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67516 => 1)) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::emote("looks at the final report before bowing his head for a second.");
      quest::say("While I had accepted Talwin's passing as reality, I still hoped you would save him in time. Either way, I thank you for your effort and for delivering this vital piece of information contained in this report. Please take this. I found it wrapped up in the report. Talwin would have wanted you to have it as it appears to be a gem fragment that could fit into the stone Fezbin gave you. Now that you have finished all that was needed for Barindu, there is still more of the city left to explore and I won't be able to complete my report until it is done.");
      quest::setglobal("bic_bar",6,5,"F");
      quest::summonitem(67517);
      $client->Message(12,"You have completed a section of the Taelosian City!");
    }
    else {
      quest::summonitem(67516);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67510 => 1)) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("This does not bode well for Reyna's fate. If I had to guess, I would say they took her to the coliseum. Knowing what we know about these strange beings, they would have taken her to the coliseum just so they could entertain themselves by torturing her. You must find a way into the coliseum and save Reyna. I think your best plan of action would be to locate and speak to Turlini and Namosa. They are two slaves Reyna mentioned in her reports. They may not talk to you if you have not proven yourself, but once you do that they should be pretty helpful. They may even know an easy way into the coliseum. Find these two and ask them about Reyna. Return to me when you find out more information about her.");
    }
    else {
      quest::summonitem(67510);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67417 => 1)) {
    if (defined $qglobals{bic_riw} && $qglobals{bic_riw} == 9) {
      quest::say("Reyna was a skilled scout who had spent many years honing her abilities. Learning that she died so horribly upsets the stomach, but she died trying to help others. Yes . . . that's what we should focus on. This report you have returned will be a great help to us and this reward should help you as well. It was wrapped in the report and appears to be a gem fragment that may fit into the stone Fezbin gave you. Now to the rest of the city. Hopefully we can prevent our other scouts from suffering the same fate as Reyna.");
      quest::setglobal("bic_riw",10,5,"F");
      $client->Message(12,"You have completed a section of the Taelosian City!");
      quest::summonitem(67518);
    }
    else {
      quest::summonitem(67417);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67520 => 1)) {
    if (defined $qglobals{bic} && $qglobals{bic} >= 1) {
      quest::say("Ah. Glad to see you return and report that you found Smith. Let me see, what does it say here . . . oh my, I can't believe this. These beings are truly insane. This is a detailed account of the experiments the Muramites have been conducting on the natives and on Smith. If what is listed here is true, we must find out more about this. It says that this is one of two reports he wrote, so we must assume he still has the other one on him. It also says here that the weapon master has access to the mountain area that leads to a secret way into the temples where they conduct these experiments. Oh, poor Smith. As soon as he figured out what was going on he documented it, hoping that he could somehow get it back to us without them finding out. Hm . . . here at the bottom he gives details about the weapon master. Seems he only enters the Ferubi area to fix the weapons that his four elite guards use. Knowing this, I am sure we can trick him into appearing. You must return to Ferubi and find his elite guards and collect a different weapon from each of them, but remember the weapon has to be damaged. Sounds like this is pretty durable stuff they use, so it may take some time to accomplish this. Either way, once it is done I would suggest giving the pieces to Smith and asking him to help.");
      quest::setglobal("bic_fer",10,5,"F");
    }
    else {
      quest::summonitem(67520);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67526 => 1)) {
    if (defined $qglobals{bic} && $qglobals{bic_fer} == 11 && $qglobals{bic_riw} == 10 && $qglobals{bic_bar} == 6 && $qglobals{bic_qin} == 4) {
      quest::say("You have now finished the scouting of the city.  Take this as a reward.  If you are unable to use the result please hand it to me and I will fix your problem");
      quest::summonitem(67527);
      quest::setglobal("bic",11,5,"F");
    }
    else {
      quest::say("You still have other portions of the city to explore.  Please return when you have finished all areas of the city.");
      quest::summonitem(67526);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 67653 => 1)) {
	if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
      quest::summonitem(67654);
    }
    elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
      quest::summonitem(67653);
    }
    elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
      quest::summonitem(67655);  
    }
    elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
      quest::summonitem(67656);
    }
    else {
      quest::summonitem(67653);
    }
  }
  plugin::return_items(\%itemcount);
}