sub EVENT_SAY {
  if ($text=~/way/i) {
    quest::say("I do miss me time with Muada and I suppose I'll get me chance again. I'll have to leave ye now and go to Muada so that I may learn what I must do for him to end the threat to our ways as beastlords. Be well and ready to open your mind to learn from Muada.");
    quest::summonitem(57008);
    quest::setglobal("muadalet",1,5,"F");
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/hail/i) {
    quest::say("Aye, ye have returned to help with this great and difficult problem. 'Tis is so complicated, I hardly know where to [begin].");
  }
}
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
   if ($text=~/begin/i) {
      quest::say("Not without an ale. Would ye have one handy? If not, would ye be so kind as to get one? Actually, make it three. Sorry for the trouble, but I've been out here so long, I've near forgotten the finer things in life!");
      }
      }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/ready/i) {
    quest::say("Aye, so, this takes us back many, many years ago, so it's hard to tell truth from legend, but I'll share it all with ye. I'm sure at some point in yer life, ye've either seen or heard of them sphinxes in the Rathe Mountains? And, I bet ye have [no idea] where they came from.");
  }    
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/no idea/i) {
  quest::say("Indeed. Well, here is what I can tell ye and ye can decide if it's true or tale. Only the sphinxes themselves know where they came from. No one else does at all. Two of the few remaining sphinxes, named Zazamoukh and Ankhefenmut, have [been on Norrath] longer than you or I and, maybe, before Veeshan laid her mighty claws across the ice of Velious.");
    }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/been on norrath/i) {
    quest::say("Aye, I'm glad ye asked. So, the story goes that during the Age of Blood, there were great ogre magi of the Rallosian Empire who convinced the sphinxes to ally with their legions, but it was no easy task. That ogre magi had their [work] cut out for him to get that alliance to come about.");
  }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/work/i) {
    quest::say("Them ogres really had to wrap their minds about riddles that the [sphinxes] created and after many attempts, they finally won their allegiance and some of the secrets the ancient creatures guarded. Some say that those secrets were the reason the gods destroyed the ogre magi instead of cursing them as they did the other ogres.");
  }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/sphinxes/i) {
    quest::say("At one time, there were many of those creatures, but a lot of sphinxes were slain during the great wars of the Age of Blood and in the aftermath of the fall of the Rallosian Empire. Two of the few remaining sphinxes flew with haste to hidden valleys in the Rathe Mountains, away from the meddlesome races. Their secrets were once again protected and freed from the alliance with the ogre magi. But now they are [threatened].");
  }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/threatened/i) {
    quest::say("It is a very rare occasion when those sphinxes attempt to contact any Norrathian, but they have. Their minds have been invaded and they feel a dark presence trying to overcome them. They believe it to be a dark influence in Discord. While they want our help, we cannot just go [speak] to them.");
  }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/speak/i) {
    quest::say("We must accommodate their requests to build trust. This means we must weave through their riddles. Once we do, we will be able to talk to them and help them. We've decided that ye be the beastlord who will take on this task. Go tell them you are willing to help them and see what you learn.");
    quest::summonitem(52901);
    quest::setglobal("muadalet",8,5,"F");
  }
  }
      }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 57008 =>1 )) {
    quest::say("It is indeed authentic. I suppose I can tell ye that I've been studyin' the ways o' the sirens. We as beastlords use the strength of our warders, as well as bestow magic upon them. These sirens use mind tricks! I'm workin' on a [way] to use the magic these fair ocean maidens do to help our kin.");
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if (plugin::check_handin(\%itemcount, 13039 =>3 )) {
    quest::say("Thanks to ye. Ah! Now, let's get on with it. 'Tis a long story, so how about we have a wee chat. Take a seat if ye like, hm? Are ye [ready] to listen? Ye are going to need to pay attention -- even as I ramble on a bit.");
  }
  }
  plugin::return_items(\%itemcount);
  $qglobals{muadalet}=undef;
}