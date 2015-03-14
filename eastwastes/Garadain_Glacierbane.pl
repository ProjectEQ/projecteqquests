sub EVENT_SPAWN {
my $walk1=undef;
my $walk2=0;
my $walk3=0;
my $walk4=0;
my $walk5=0;
}

sub EVENT_SAY {

###########################
#  Ring 1 Quest           #
###########################

  if ($text=~/hail/i) {
    quest::say("Hrmff, what's this? A spy sent from the giant heathens, or the selfrighteous wurms perhaps? Either way, you'd be no [friend] of the great Coldain.");
  }
  if ($text=~/friend/i) {
    quest::say("A friend, you say? That remains to be seen. Much more to being a friend of the Coldain than just sayin' so. Anyway, I'm too [tired] to argue about it. I haven't slept in days.");
  }
  if ($text=~/tired/i) {
    quest::say("Did I say tired? Exhausted is more like it. Ever since that blizzard last week I haven't slept a wink. I came back from huntin' snow orcs to find that my [blanket] had blown away and now I'm just too tired to rustle up a new one.");
  }
  if ($text=~/blanket/i) {
    quest::say("Not just any old blanket, mind ye, mine was made of the finest tundra kodiak hides and snow panther skins, two of each. When I was wrapped up in it ya couldn't see me a bit, no, I blended right into the snow, I did. Say, if you be a friend, here's yer chance to prove it. Sew me up a new blanket so I can get some rest.");
  }

###########################
#  Ring 2 Quest           #
###########################

  if ($text=~/nephew/i) {
    quest::say("My nephew, Boridain, keeps running away from home to kill a bothersome [beast], thinking this will prove to all of Thurgadin that he is a great hunter. Every time he does this my sister gets hysterical and I am sent out to find him.");
  }
  if ($text=~/beast/i) {
    quest::say("A rabid tundra kodiak has been feeding on our people for weeks now. If Boridain ever stumbled across the critter I doubt he'd stand a chance. I have a solution, but it would require the [assistance] of an outsider.");
  }
  if ($text=~/assistance/i) {
    quest::say("I'm taking a liking to you, stranger. Your eagerness to help us will not go unnoticed. Find my nephew and give him this axe. It should keep him from hurting himself. Return to me with the ring and proof that he is safe.");
    quest::summonitem(30265);
  }

###########################
#  Ring 3 Quest           #
###########################

  if ($text=~/hunting/i) {
    quest::say("My camp here boasts the most proficient hunters in the recorded history of the mighty Coldain empire. We alone could feed an entire clan. Things have been frustratingly [slow] lately, though.");
  }
  if ($text=~/slow/i) {
    quest::say("After years of skinning the hides of the giantmen, my hunting knife has lost its edge. The dull blade has slowed me down considerably. It has served me well, but a new [knife] would make me a much more proficient hunter.");
  }
  if ($text=~/knife/i) {
    quest::say("Hunt a wooly rhino and take his horn, then take a flawless hide from a walrus. Combine them in a forge with a skinning rock and bring me the new knife and the silver insignia ring.");
  }

###########################
#  Ring 4 Quest           #
###########################

  if ($text=~/smithing hammer/i) {
    quest::say("[Tain] Hammerfrost can get you one. Find him and give him this.");
    quest::summonitem(30139);
  }
  if ($text=~/tain/i) {
    quest::say("Tain left a short time ago, he said he had a score to settle with a particular Kromriff.");
  }

###########################
#  Ring 5 Quest           #
###########################

  if ($text=~/plans/i) {
    quest::say("The bloody Ry'Gorr, friends of the frost giants, plan to raid our encampment. Their captain, Scarbrow Ga'hruk is leading the raid. I need someone to intercept his [orders] so we may prepare for the attack. Without them we could be in serious trouble.");
  }
  if ($text=~/orders/i) {
    quest::say("Find the Ry'Gorr messenger and cut him down. Bring the message he carries to my lookout. When the attack is thwarted, return to me with the head of Scarbrow and the platinum insignia ring.");
  }

###########################
#  Ring 6 Quest           #
###########################

  if ($text=~/favor/i) {
    quest::say("For several seasons there has been an unsolved mystery in this land. Not far from here an elite team of Coldain and their trained wolves were gathered to make a strike at the Kromrif. No one knows just what became of our strike force. Bring me proof of their fate and proof that whoever was responsible for their loss is no more.");
  }

###########################
#  Ring 7 Quest           #
###########################

  if ($text=~/mission/i) {
    quest::say("A Coldain... A very important Coldain, has been abducted by the Rygorr. He was gathering information that is imperative to our victory over the brainless heathens. You must find him before he is killed and escort him to safety. Return to me with proof that Corbin Blackwell is safe.");
  }

###########################
#  Ring 8 Quest           #
###########################

  if ($text=~/ready/i) {
    quest::say("Very well, $name, give me the Adamantite ring and I will give you the marching orders. Once the orders are given to Gloradin in the next hut, we will be underway. You then must follow me to what will be our battleground. I must warn you, I will hold your ring until the head of Chief Ry`gorr is given to me. If we fail, all will be lost... for both of us.");
  }
}


sub EVENT_ITEM {

###########################
#  Ring 1 Reward          #
###########################

  if (plugin::check_handin(\%itemcount, 30135 => 1)) {
    quest::say("Ahh, that'll do fine. Take this, it is but a trinket for now, but continue to serve the Coldain and it will grow in power. I must get some rest now, for I have been told my [nephew] has disappeared again and I will need to track him down tomorrow.");
    quest::summonitem(30131);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(50000);
  }

###########################
#  Ring 2 Reward          #
###########################

  elsif (plugin::check_handin(\%itemcount,30267 => 1, 30131 => 1)) {
    quest::say("Well done friend! My nephew is safe at home and his thirst for adventure is quenched for now. The beast will claim no more of our people. I couldn't have handled it better myself. Now I can get back to the business of [hunting].");
    quest::summonitem(30133);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(60000);
  }

###########################
#  Ring 3 Reward          #
###########################

  elsif (plugin::check_handin(\%itemcount, 30133 => 1, 30137 => 1)) {
    quest::say("Hrmm, not quite the work of a Coldain. Barely functional, in fact. I'll be needing to touch this up a bit. Fetch me a Coldain [smithing hammer] and I'll be sure to tell my associates in Thurgadin of your deeds.");
    quest::summonitem(30132);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(70000);
  }

###########################
#  Ring 4 Reward          #
###########################

  elsif (plugin::check_handin(\%itemcount, 30140 => 1, 30132 => 1)) {
    quest::say("Ahh, there we go now, that's more like it. It would be time to return to the hunt were it not for the [plans] our spies have discovered.");
    quest::summonitem(30134);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(80000);
  }

###########################
#  Ring 5 Reward          #
###########################

  elsif (plugin::check_handin(\%itemcount, 30141 => 1, 30134 => 1)) {
    quest::say("Without your assistance, we would have lost our camp and our lives. Again, I thank you. Now that you have proven your loyalty to the throne I have a special [favor] to ask of you.");
    quest::summonitem(30268);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(90000);
  }

###########################
#  Ring 6 Reward          #
###########################

  elsif (plugin::check_handin(\%itemcount, 1045 => 1, 18084 => 1, 30268 => 1)) {
    quest::emote("lowers his head and mutters, 'At least there will be some closure for their families, thanks to you. The Ry`gorr will pay for this with their lives! I will ask you to help us in the invasion of Ry`gorr keep, but first I have a delicate [mission] I was hoping you'd handle.");
    quest::summonitem(30162);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(100000);
  }

###########################
#  Ring 7 Reward          #
###########################

  elsif (plugin::check_handin(\%itemcount, 1047 => 1)) {
    quest::say("Thank you, $name, your service to our people has been most helpful. The time has come for our people to make war with the Ry`gorr. They must pay for their transgressions against our people. We are just waiting on you. Prepare yourself for glorious battle and tell me when you are [ready].");
    quest::summonitem(30163);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(110000);
  }

###########################
#  Ring 8 Quest/Reward    #
###########################

  elsif (plugin::check_handin(\%itemcount, 30163 => 1)) {
    quest::say("Give this to Gloradin and return to me immediately, it is time. May Brell be with us!");
    quest::summonitem(1093);

#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);

    quest::exp(120000);
  }

# Ring 8 reward moved to #Garadain_Glacierbane to emulate Live's timing of head turn-in
#  if ($itemcount{1092} == 1) {
#    quest::say("Good work friend! The Dain will hear of this right away. We couldn't have defeated the Ry'gorr without your #help. Take this ring as proof that you have served the Coldain well. You may wish to show it to the Seneschal should you #ever stop in our fine city. Farewell, $name, it has been my pleasure knowing you.");
#    quest::summonitem(30164);
#
#   Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
#    quest::faction(49,30);
#    quest::faction(67,30);
#    quest::faction(188,-30);
#    quest::faction(189,-30);
#
#    quest::exp(2000000);
#  }
   plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_DEPART {
  if ($walk1 == undef) {
    $walk1=$walk1+1;
    $walk2=undef;
    quest::settimer(11,20);
  }
  elsif ($walk2 == undef) {
    $walk2=$walk2+1;
    $walk3=undef;
  }
  elsif ($walk3 == undef) {
    quest::pause(200);
    quest::settimer(12,10);
    $walk3=$walk+1;
    $walk4=undef;
  }
  elsif ($walk4 == undef) {
    $walk4=$walk4+1;
    $walk5 = undef
  }
  elsif ($walk5 == undef) {
    $walk5=$walk5+1;
    quest::spawn2(116576,237,0,521.2,-3140,195.6,130.5);
    quest::depop_withtimer();
  }
}

sub EVENT_TIMER {
  if($timer == 11) {
    quest::stoptimer(11);
    quest::say("Follow me closely, friend, time is of the essence. I will describe our situation as we walk.");
  }
  elsif($timer == 12) {
    quest::stoptimer(12);
    quest::say("The Dain's own royal troops will be at our disposal for the battle. This is good news, they are hardened, experienced soldiers. The bad news is that our sources indicate that the Ry`gorr have been alerted to our presence and will be ready for an attack. This is most unfortunate... They will not go down without a fierce fight.");
    quest::settimer(3,120);
  }
  elsif($timer == 3) {
    quest::stoptimer(3);
    quest::say("It is of utmost importance that you stay with me throughout the fight. Your focus must be on killing Chief Rygorr and keeping me alive, mind that you do not become distracted. If I fall the Dain's men will retreat and you'll definitely be cut down.");
  }
}


# Quest by mystic414
#ring 8 by JanusD
