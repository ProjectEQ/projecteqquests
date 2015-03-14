sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {
      quest::say("Well, hello traveler. You here to help with the scout problem we've been having?");
    }
    else {
      quest::say("Please do not disturb a genius at work. I have a very serious problem and little time to spend gabbing to just anyone.");
    }
  }
  if ($text=~/yes/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {
      quest::say("Good to hear. I have been going out of my skull trying to tinker another one to find the first. Now that you are here, I can stop that and focus on compiling the information I already have. Let me tell you, being in charge of something like this is very taxing on the nerves. I remember being a young gnome and whenever I tinkered something it worked the first time. Ah, how good it felt to put the Cogswin family emblem on my wonderful creations. Nowadays it seems like everything I make has some intermittent flaw or defect. I might have to accept that I am getting old and a little slow, but I still have the wits to invent. I should stop rambling and get to the point. I am in charge of scouting the mountain areas known as [Tipt], [Vxed], and the [sewers] under the city. Which would you like to know about?");
    }
  }
  if ($text=~/sewers/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {
      quest::say("According to my records here, the sewers are a pretty vile area. Filled with some strange creatures, I hear. So, being the genius that I am, I came up with a plan to use a prototype clockwork scout I built when we were having problems exploring the catacombs in Mistmoore. He appeared to be working fine. I received constant detailed reports on the sewers and mountain areas until one day it stopped. For some time I tried to make contact with the clockwork, but nothing. I started working on a second one to retrieve the first when Falcin stumbled onto the boat. In his struggle to get back to us he had to make his escape through the sewers. While going through there, he found this. This is the reporting module used by the clockwork scout. It does not look like much now, but you should have seen it when Falcin gave it to me. I have repaired most of the damage in an attempt to access the information stored within, but there are four vital components missing. I need you to go to the four sewer areas and find a timing gear, a rusty spring, an oiled belt, and a processing gizmo. When you have them all, place them inside the gearbox and combine them. Once this has been done, the gearbox should give you a report. Return the report to me.");
      quest::summonitem(67528);
    }
  }
  if ($text=~/vxed/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {
      quest::say("We have discovered that this continent holds many dangerous creatures, including the strange beings of the invading army. Many of these beasts can be found in the mountain area called Vxed. After being severely damaged in Tipt, the clockwork scout made its way back to Vxed to perform self maintenance, but I believe this is where it met its final demise. While the chance is slim, I believe you may be able to salvage enough of the parts from the creatures within Vxed to reassemble the frame. What you will need to find is a flickering finkenheimer, a tarnished sprocket, some uncoiled springs, a greased bolt, and some connection rods. When you have them all place, the sprocket, springs, bolt, and rods in the finkenheimer and bring me the result. I must warn you to be careful though. If these things could stop my clockwork, they must be pretty powerful creatures.");
    }
  }
  if ($text=~/tipt/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {    
      quest::say("The mountainous areas of this continent hold many dangers within them. Tipt in particular is thick with members of the invading army, dangerous creatures, and the angry spirits of nihil refugees. Looking at the information I have, the clockwork scout tried to take a direct path to the other side of Tipt and had some serious problems. Apparently, it had a run in with some cragbeasts, a pack of ghosts, numerous Muramites, and a native riddlemaster. While he made it pretty far, he took significant damage each step of the way. My last report received for this area stated that it was returning to the Vxed area to recover, but had lost multiple power cells in the process. I need you to retrieve these power cells. They are vital to rebuilding the scout and getting that report. There are five different types of cells, each one is called Vaifan's Power Cell -- named after the most ingenious gnome there is, of course. The cells are named from A to E. When you have collected all of them, place them in this power pack, activate it, and return it to me.");
      quest::summonitem(67547);
    }
  }  
  if ($text=~/the scout was faulty/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11) && ($qglobals{bic_sew} == 12) && ($qglobals{bic_vxe} == 13) && ($qglobals{bic_tip} == 14)) {
      quest::say("Oh dear, a faulty scout? I do hope you followed the instructions properly! Never mind, here are some replacement parts to try again with.");
      quest::summonitem(67576);
      quest::summonitem(67538);
      quest::summonitem(67577);
      quest::summonitem(67539);
      quest::summonitem(67533);
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67534 => 1)) {
    quest::say("Grrr, I was afraid of this. Seems without the extra modules working together this one won't function completely. Nonetheless at least it is fixed now and with your assistance we should be able to reassemble the scout and place this module back inside. Take this. I found it in the gearbox when I first received it. Seems like it may have some affinity with the stone Fezbin gave to you. Let me know when you are ready to help out some more.");
    quest::summonitem(67535);
    quest::setglobal("bic_sew", 12, 5, "F");
    $client->Message(4, "You were successful in helping Vaifan complete her report of the sewer areas.");
  }
  if (plugin::check_handin(\%itemcount, 67554 => 1)) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {
      quest::say("I can't believe you did it. Not a bad job if I do say so myself. You may have a future in tinkering my young friend. Now, if you will give me one second to change a few things and rip this part out, adjust this here, add a couple of these, and there you go, a nice new clockwork frame. Now we just need to collect the rest of the pieces to rebuild him. Oh, and before I forget, here is a reward for helping me out. Let me know if you wish to explore any of the other areas by asking me about them.");
      quest::summonitem(67568);
      quest::summonitem(67539);
      quest::setglobal("bic_vxe", 13, 5, "F");
      $client->Message(4, "You were successful in helping Vaifan complete her report of the Vxed mountain area.");
    }
    else {
      quest::say("You have not completed all of the areas needed to progress, please return when you have done so.");
      quest::summonitem(67554);
    }
  }
  if (plugin::check_handin(\%itemcount, 67537 => 1)) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11) && ($qglobals{bic_sew} == 12) && ($qglobals{bic_vxe} == 13)) { 
      quest::say("Now that we have all the functioning pieces, we can reassemble the scout. Take these instructions and this power pack adapter and return to either mountain area to assemble the scout. I would have you do it here, but I fear he may be unstable and . . . well, let's just say I don't want to put the ship in danger. Please return to me with the report once you have it. I am going to prepare my final report so when you return I can take it straight to Fezbin. Good luck to you.");
      quest::summonitem(67576);
      quest::summonitem(67538);
      quest::summonitem(67577);
      quest::setglobal("bic_tip", 14, 5, "F");
      $client->Message(4, "You were successful in helping Vaifan complete her report of the Tipt mountain pass.");
    }
    elsif (defined($qglobals{bic}) && ($qglobals{bic} >= 11)) {
      quest::say("Wonderful. While the power cells were slightly damaged I was still able to increase the strength of the power pack for a short amount of time. This should give the scout just enough power to produce a legible copy the report. Thank you for the assistance, take this I scraped it off the side of the power cells. Looks like it might be able to add some power to the stone you recieived from Fezbin. There are still some areas left to explore, so when you are ready ask me about the next area you want to look into.");
      quest::summonitem(67576);
      quest::summonitem(67538);
      quest::summonitem(67577);
      quest::setglobal("bic_tip", 14, 5, "F");
      quest::summonitem(67553);
      $client->Message(4, "You were successful in helping Vaifan complete her report of the Tipt mountain pass.");
    }
    else {
      quest::say("You have not completed all of the areas needed to progress, please return when you have done so.");
      quest::summonitem(67537);
    }
  }
  if (plugin::check_handin(\%itemcount, 67536 => 1)) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 11) && ($qglobals{bic_sew} == 12) && ($qglobals{bic_vxe} == 13) && ($qglobals{bic_tip} == 14)) { 
      quest::say("Excellent. It is always wonderful when something you invent works out. This was all I needed to finish up my report to Fezbin. Thank you once again. You have been very helpful. Once again I must reward you with this. When you brought the clockwork frame to me this fell out of it. I think it will go with your mask quite well. Try combining the two together and see what happens. I must say goodbye now.");
      quest::setglobal("bic", 14, 5, "F");
      quest::summonitem(67553);
      $client->Message(4, "Your assistance has helped Vaifan and Taminoa greatly, but L'diava is still in need of assistance.");
    }
    else {
      quest::say("You have not completed all of the areas needed to progress, please return when you have done so.");
      quest::summonitem(67536);
    }
  } 
  plugin::return_items(\%itemcount);
}