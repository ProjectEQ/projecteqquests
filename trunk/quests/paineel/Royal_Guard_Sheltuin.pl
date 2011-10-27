sub EVENT_SAY {

if($text=~/hail/i)
{quest::emote("appears to be ignoring you completely.");
}

if($text=~/i wish an audience with the overlord/i)
{quest::say("The Overlord is not seeing anyone at this time. however. I may have work for you. You seem to have some experience with the kobold annoyance in the region. Are you [interested]. $name?");
}

if($text=~/interested/i)
{quest::say("Then I shall give you a task. I assume you are aware of the kobold lair nearby. Many of our adventurous knights and priests crusade to destroy those pests so seeing many Erudites frequent the area is normal. However. it is not normal to see someone carry large crates into the lair and return empty handed. This person's movements also show he is attempting to remain unseen.....the [fool].");
}

if($text=~/fool/i)
{quest::say("Whoever it is. obviously is not an Erudite. even though he appears to be. Only an outsider would take us to be such idiots as to fall for their pitiful attempt at disguise. Or perhaps....well. never mind that. I want you to enter the kobold lair and find these crates. Return one to me and we'll decide what to do from there.");
}
              }

sub EVENT_ITEM
{

if(plugin::check_handin(\%itemcount, 1773 => 1)) {#Large Empty Crate
    quest::say("Hmmm. Very odd. The dust in the crate implies some sort of stone was transported in it. Perhaps our brothers of the Arcane will be able to find out where this dust came from and what it?s used for. Take this dust sample and note to Keletha Nightweaver. She will examine the dust and send you back with a report. Make haste.");
    quest::summonitem(1774);#Envelope with dust sample
    quest::exp(137180);
                                                  }

if(plugin::check_handin(\%itemcount, 1775 => 1)){#heretics report

    quest::emote("'s eyes redden with intense anger after reading the report. When he speaks, his voice is suprisingly calm and measured.");
    quest::say("'Listen close $race. When you leave this building, you will find the courier who is bringing the ore. You will kill him, and collect his head and a box of the ore. You will then find the supplier, and collect his head and any other information you find on him. Bring me these four things and you will be rewarded. Do not fail.");
    quest::exp(137180);   
                           }
if(plugin::check_handin(\%itemcount, 1776 => 1,1777 => 1, 18174 => 1, 1778 =>1)){#crate of ore,couriers head,suppliers head,sealed letter

    quest::say("'Honestly $name, I thought you would not return. Such strength and intelligence in a Knight of Fear I have not seen for quite some time. Wear this in pride of the ancient Ridossan. Perhaps when you are ready, i will give you a more [important task]. This conspiracy must be stopped.'");
    quest::exp(137180);
    quest::summonitem(1764);#Leggings of Ridossan       
                           }
else {
    quest::say("I don't need this.");
    plugin::return_items(\%itemcount);
    return 1;   
     }
}
#END of FILE Zone:paineel  ID:75073 -- Royal_Guard_Sheltuin 