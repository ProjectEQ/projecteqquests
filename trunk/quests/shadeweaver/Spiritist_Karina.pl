my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("karina",90);
}

sub EVENT_TIMER {
  $count++;
  if ($count == 1) {
    quest::say("When our companions are wounded, we must call to the spirits and ask for their aid. Kindred spirits are able to protect us and heal our wounds.");
  }
  if ($count == 2) {
    quest::say("Never force a spirit to your aid. You will find that there are many that will come to your side. You need only ask.");
  }
  if ($count == 3) {
    quest::say("Only use your connection to the spiritual realm when you need it. Do not drain yourself unnecessarily, for you will find yourself unable to call for aid when you need it the most. Ration out your spiritual strength carefully, it will be vital to your own survival.");
  }
  if ($count == 4) {
    quest::say("Try not to become the focus of attention in a battle. You will find it much more efficient to strike when the opponent is distracted. Do not hestitate to ask others to join you. You will find that many welcome your ability to cure battle wounds and call forth protection from the spirits around you.");
  }
  if ($count == 5) {
    quest::say("Be sure to maintian your material components. You will need these to perform the necessary rituals to call on the power of many spirits.");
  }
  if ($count == 6) {
    quest::say("Never lead an enemy to your allies. It is considered the greatest dishonor to do so. Remember that you will carry the name you make for yourself in youth all the way to your elder years. Your actions now will determine the outcome of your future.");
  }
  if ($count == 7) {
    quest::say("Try not to waste the hides of the beasts you hunt. It is wise to craft these hides into armor for yourself.");
  }
  if ($count == 8) {
    quest::say("Always pay attention to your surroundings. There are many opponents that will ambush you while you are out in the field. It is wise to take companions with you when venturing far.");
  }
  if ($count == 9) {
    quest::say("Visit your trainer to master new skills as soon as you are able. The longer you tarry about, the harder it will be for you to learn your skill later on. The more you use the skills you learn, the better you will become at using them.");
     $count = 0;
    quest::settimer("karina",90);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome, friend. Come dance by our warm fire or have a seat and [learn] a little bit about the ways of the spiritist.");
  }
  #Quest: Darkened Jawbones (Start)
  if ($text=~/learn/i) {
    quest::say("We are those in tune with the spirits that surround us. Ancestral spirits with knowledge of the ancients dance around us by this very fire. They guide is through the darkness. Protect us from pain. But a terrible [curse] has befallen the spirits of this thicket, and so it is my duty to train these young Dar Khura in order to aid in the battle that lies ahead.");
  }
  #Quest: Darkened Jawbones 
  if ($text=~/curse/i) {
    quest::say("The spirits are corrupted by foul magic. The souls of our ancestors have been twisted into an abomination known as [shades]. The corpses of long passed friends and relatives walk through the night seeking to destroy the living. We must destroy the corrupted remains of their old bodies and allow the spirits to roam free once more. Will you help us [release the souls] of our kindred spirits?");
  }
  #Quest: Darkened Jawbones 
  if ($text=~/shades/i) {
    quest::say("The shades are a deeper form of corruption of the spirit. I can sense great anguish in the spirits that have been twisted into such a creation. Their horror burns my heart so deeply that I cannot bear it. I would not normally ask another to place themselves in danger, but it is important that the souls are released from these shadowed prisons of torture and darkness. Please help us [release the souls] of our ancestral spirits.");
  }
  #Quest: Darkened Jawbones 
  if ($text=~/release the souls/i) {
    quest::say("I am relieved that you have accepted this dangerous task. I can feel the strength of the spirit within you. There are many kindred spirits aiding us in this battle. If you are in tune with the spiritual realm, you will find that your rituals of magic will result in aid from our spiritual allies. Return to me with the [darkened jawbones] of the lesser shades so that I may release the spirit once more.");
  }
  #Quest: Darkened Jawbones 
  if ($text=~/darkened jawbones/i) {
    quest::say("The jawbones will aid me in tuning to the essence of the corrupted spirits. When you return to me with them, you are enabling me to place the lost soul to rest. I am able to release four of these spirits at one time in much the same way I am training these four young trainees. It is best to bring me four of them at one time if you are able.");
    quest::say("Always pay attention to your surroundings. There are many opponents that will ambush you while you are out in the field. It is wise to take companions with you when venturing far.");
  }
  #Quest: Rotting Jawbones
  if($text=~/loda kai/i){
    quest::say("Loda Kai left Shar Vahl many years ago. He had set off for the distant city of Katta Castellum just north of the tenebrous mountains. We have not seen him since, but the brigands wear his family emblem. [Kedra Kai] has banished himself from our city in shame.");
  }
  #Quest: Rotting Jawbones 
  if($text=~/kendra kai/i){
    quest::say("He stands vigil at the 
crossroads of the trading routes. Kedra has sworn to destroy the brigands and his brother before returning to Shar Vahl. There are many skeletal brigands within the thicket. If you are able to acquire their rotting jawbones, please bring them to me. I will try to learn what I can from the magic within them.");
  }
}

sub EVENT_ITEM {
  #Handin: A Darkened Jawbone
  if (plugin::check_handin(\%itemcount, 30872 => 4)) {
    #Quest: Darkened Jawbones (End)
    quest::say("I can see that you have a brave heart. You have rescued many of the fallen spirits with little regard to your own welfare. Such selfless acts should not go unrewarded. Please take these gloves and wear them with pride. It is a symbol of [rebirth].");
    quest::faction(132,10); # +Guardians of Shar Vahl
    quest::exp(1000);
    quest::ding();
    #Rebirth Leather Gloves
    quest::summonitem(30879);
  }
  #Handin: A Sharp Toothed Jawbone
  elsif(plugin::check_handin(\%itemcount, 30873 => 4)){
    #Quest: Sharp Toothed Jawbones (End)
    quest::say("Thank you for bringing these to me $name.");
    quest::emote("Karina closes her eyes and meditates over the jawbones for a moment.");
    quest::say("I can sense the mark of the [Loda Kai] within these jawbones. This is a horror, for Loda Kai was once a member of my people. I do not know how he came about these strange magical forces but it can not be good news. Please wear these sleeves for protection. This new discovery worries me 
deeply.");
    #Rebirth Leather Sleeves
    quest::summonitem(30877);
    quest::faction(132,10); # +Guardians of Shar Vahl
    quest::exp(1000);
    quest::ding();
   }
  plugin::return_items(\%itemcount);
}

# EOF zone: shadeweaver ID: 165130 NPC: Spiritist_Karina

