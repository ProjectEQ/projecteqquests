sub EVENT_SAY {

if(plugin::check_hasitem($client, 10651)){
    if ($text=~/hail/i) {
    quest::say("Ah, yes. You are not only a shaman, but one who has passed the tests of the heyokah. There are many problems that face us now and I grow weaker by the day. If you feel you are ready to bear a great burden and help all of those like us, including the immortals that charge our essence and consciousness, say [it is so].");
    quest::setglobal("shaman_epic",1,5,"F");
    }
    }
    elsif ($class eq "shaman"){
    quest::say("It Appears you are not yet ready for the great tasks that I require to be done. There are Others lesser than me that can guide you and prepare you to walk a greater path should you choose. You should seek them out. You can Perhaps seek knowledge from your elders and peers.");
    quest::setglobal("shaman_pre",1,5,"F");
  }
    else{
    quest::emote("eyes you with an ageless wisdom."); 
    quest::say("Ah, your spirit shines brightly. Should I know you?");
    }
   if (defined $qglobals{shaman_pre} && $qglobals{shaman_pre} == 3) { 
  if ($text=~/shaman/i) {
    quest::say("Ah, yes. You are not only a shaman, but one who has passed the tests of the heyokah. There are many problems that face us now and I grow weaker by the day. If you feel you are ready to bear a great burden and help all of those like us, including the immortals that charge our essence and consciousness, say [it is so].");
    quest::delglobal("shaman_pre");
    quest::setglobal("shaman_epic",1,5,"F");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/it is so/i) {
    quest::say("To have you here, believing in us and our existence does give me warmth, but my length of time here and others like me may be at an end. The spirits are troubled and a darkness washes through our existence that we seem helpless to prevent. That is why I talk to you now -- to help us. Without the help of mortals, we may [blow away] with the winds.");
  }
  }
    if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/blow away/i) {
     quest::say("You have heard of the darkness in Taelosia that came from another place. You may have even seen the world that is overshadowed by the dark influence of Discord. That seeping ill that is not touchable by claw or paw has wormed its way into the [streams of the spirit world] and the more it does, the more we, and I weaken.");
     }
     }
     if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/streams of the spirit world/i) {
     quest::say("Yes, it is true. I feel myself fading more with each turn of time. You are familiar with the ways of herbs and potions and you can aid me, should you [find the will]. With strength to keep me before you in the mortal realm, I can guide you so that you may aid us all. There is much to tell you that I will not reveal yet, lest you be tempted to take advantage -- which has happened before.");
     }
     }
     if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/find the will/i) {
     quest::say("Very well. You will not find this an easy task. There are several things you must do and other heyokah you must find that have helped us in the past. Where there is glitter upon the setting of Ro, you will find an agent of the spirits. In the deep waters where the megalodon is said to hunt, there is another. And where the wonders of nature rise in the dark, another ally awaits. Look for light in the denseness of entwined shadows. One will greet you with all you have learned. She is doing research in a bustling labyrinth of creatures and can educate you where I cannot. Tell them all of me and they will give you audience");
     }
     }
     if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/wasichu/i) {
  quest::say("The wasichu are those that turn their backs on serving the spirit world for its own sake. They hunger for their wn power. At greater risk now are the spirits of Wisdom and Patience. They have become weakened and their fading is eroding what you as shaman often rely upon. The Spirit of Might has lost its way altogether and has crossed over into the darkness of Discord in that other realm. It has veen mobing amongst the [dark creatures] there, using its influence to guide and move some beasts in strange ways.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/dark creatures/i) {
  quest::say("We must prepare a [ritual] that has not been performed in many, many years. We hope this one ritual will return the strength of the failing spirits and restore the honor and humility of the Spirit of Might, but there is much preparation to be done. If you are prepared to take on this task, I will tell you what I know. This is no small endeavor, friend. Your mind and body and your strngth of spirit will be put to the test.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/ritual/i) {
  quest::say("The ritual we need to perform is an ancient one, called Ruchu, and it will require a lot of preparation and planning on our parts. To begin with, we need to call upon our allies for help. One thing we need is spirit talismans. In times past, the spirits bestowed very powerful talismans upon a few, but [great] heyokah. We are going to need some of them to perform this ritual as they contain some of the essence of the very beings we are tying to save.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/great heyokah/i) {
  quest::say("One of them was a [wise] shaman who once walked the lands and gahered every morsel of wisfom his mind could consume in the ways of alchemy and magic. Even though he was a froglok, he was incrediby gifted. His name was Juktopp Gantroc. Though he was small in stature, his knoledge seemed and endless expanse.");
  }
  }  
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/wise/i) {
  quest::say("We had [watched] him and were amazed by the depth and breadth of his knowledge and how he applied it to his arts. Over time, he began to learn things that we did not know or piece together ourselves, adding great value to the spirits and shaman everywhere.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/watched/i) {
  quest::say("Upon his death, which he made no attempts to prevent and he likely could have, he accepted the passage from the confines of flesh into the spirit world with great grace and dignity. Several of us spirits gathered that night and chose to appear to him and offer him a [rare gift]... a place among the everlasting spirits where he could share his knowledge and continue to learn.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/rare gift/i) {
  quest::say("The Spirit of Wisdom itself blessed a talisman and gave it to Juktopp, telling him of our offer. Needless to say, he was overwhelmed and overjoyed. To this day, he remains light as air and just as free in a planar realm of great beauty. You must find him and retrieve the talisman. Give him this potion whihc will sustain him while we prepare for Ruchu. There is [still more] you must do.");
  quest::summonitem(57081);
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/still more/i) {
  quest::say("When the gods were still young and the ethereal planes were not much more than imagination, the Tribunal wished to create an infallible system of justice. They also wanted those who approached them to hear or plead their casr to have their resolve tested so the Tribunal's time would not be wasted. Thus, the Tribunal chose to create [trials of justice] so that Norrathians would be required to prove thier worth to have thier case heard.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/trials of justice/i) {
  quest::say("But it was not that simple. It did take some time to decide how the trials would be created so that they were fair and just and would provide a good test of strength and might. There was a high shaman of halas who followed th path lain by the Tribunal and lived his life according to law and justice. His name was [Veshtaq] MacDunahon.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/Veshtaq/i) {
  quest::say("Veshtaq's strict asherence to justice eventually earned the attention of the Tribunal and he was asked to ascend from the mortal realm to aid them in creating trials that would be suitable to place before Norathians wishing to approach the greatness of the Tribunal. Of course, Veshtaq obliged and [succeeded] in creating a series of trials that allowed Norrathians to prove thier worth.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/succeeded/i) {
  quest::say("When his work was done, Veshtaq suddenly realized that he had grown much olde and his time in the lane had weakened his ties with the natual spirits of the world. This [troubled] him greatly. He felt his life perhaps had come to no real meaning.");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/troubled/i) {
  quest::say("Somehow, the Tribunal then became aware of Veshtaq's concerns and passed a judgment -- that Ceshtaq be granted a place among the trials he created, becoming immortal. With that judgment, the Tribunal had contacted one of the great spirits, that of Patience, and asked for a [meaningful way] for a shaman to become immortal.");
  }
  }  
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/meaningful way/i) {
  quest::say("or a shaman, a blessing of etenal life from any spirit is an honor, so a talisman was created by the Spirit of Patience to sustain Veshtaq for all time and he would be once again be rejoined with the spirit world. Now, Mwinda, it is up to you to retrieve the talisman. You may not simply ask for it. You will have to complete the ery tial he commands and defeat his essence. Do not fret. The Tribunal will sustain him in that plane so he may continue his work.");
  }
  }
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 2) {
  if ($text=~/stolen/i) {
    quest::say("Very well. You will need to return to Wunshi for more information. He will be able to lead you to some of what we need if you ask him. Return to me and tell me when your business with Wunshi is finished. I am too tired to continue.");
}
}
    $qglobals{shaman_pre}=undef;
    $qglobals{shaman_epic}=undef;
    }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52921 =>1 )) {
    quest::emote("drinks the potion hastily and shudders. Its essence grows brighter and it's dull eyes begin to sparkle with renewed strength.");
    quest::say("You have bought me time -- time to explain how you may aid us all. The darkness of Discord seeps ever deeper into Norrath and the spirit world. Some of the most revered and oldest spirits known have turned to grim pursuits, becoming the [wasichu] -- those creatures you may remember from you time conversing with another great spirit.");
  }

if (plugin::check_handin(\%itemcount, 57083 =>1, 57084 =>1 )) {
   quest::say("This is a start. There is still much to do. While we have gotten the talismans from our allies, there are those that are not our friends -- the wasichu and worse -- who carry or have [stolen] items we need. They will not part with them willingly. This is where your strength and might will be put to the test . . . and your presence of mind. Are you certain you wish to go on?");
quest::setglobal("shaman_epic",2,5,"F");
  }
}
