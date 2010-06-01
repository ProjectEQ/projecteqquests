sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Please do not disturb a genius at work. I have a very serious problem and little time to spend gabbing to just anyone.");
  }
  if ($text=~/hail/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 11) {
    quest::say("Well, hello traveler. You here to help with the scout problem we've been having?");
  }
}
  if ($text=~/yes/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 11) {
    quest::say("Good to hear. I have been going out of my skull trying to tinker another one to find the first. Now that you are here, I can stop that and focus on compiling the information I already have. Let me tell you, being in charge of something like this is very taxing on the nerves. I remember being a young gnome and whenever I tinkered something it worked the first time. Ah, how good it felt to put the Cogswin family emblem on my wonderful creations. Nowadays it seems like everything I make has some intermittent flaw or defect. I might have to accept that I am getting old and a little slow, but I still have the wits to invent. I should stop rambling and get to the point. I am in charge of scouting the mountain areas known as [Tipt], [Vxed], and the [sewers] under the city. Which would you like to know about?");
    }
    }
  if ($text=~/sewers/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 11) {
    quest::say("According to my records here, the sewers are a pretty vile area. Filled with some strange creatures, I hear. So, being the genius that I am, I came up with a plan to use a prototype clockwork scout I built when we were having problems exploring the catacombs in Mistmoore. He appeared to be working fine. I received constant detailed reports on the sewers and mountain areas until one day it stopped. For some time I tried to make contact with the clockwork, but nothing. I started working on a second one to retrieve the first when Falcin stumbled onto the boat. In his struggle to get back to us he had to make his escape through the sewers. While going through there, he found this. This is the reporting module used by the clockwork scout. It does not look like much now, but you should have seen it when Falcin gave it to me. I have repaired most of the damage in an attempt to access the information stored within, but there are four vital components missing. I need you to go to the four sewer areas and find a timing gear, a rusty spring, an oiled belt, and a processing gizmo. When you have them all, place them inside the gearbox and combine them. Once this has been done, the gearbox should give you a report. Return the report to me.");
    quest::summonitem(67528);
    }
    }
    }

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 67534 =>1 )) {
  quest::say("Grrr, I was afraid of this. Seems without the extra modules working together this one won't function completely. Nonetheless at least it is fixed now and with your assistance we should be able to reassemble the scout and place this module back inside. Take this. I found it in the gearbox when I first received it. Seems like it may have some affinity with the stone Fezbin gave to you. Let me know when you are ready to help out some more.");
  quest::summonitem(67535);
  quest::setglobal("bic",12,5,"F");
}
  plugin::return_items(\%itemcount);
}