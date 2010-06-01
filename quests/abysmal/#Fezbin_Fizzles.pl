sub EVENT_SAY {
  if (($text=~/hail/i) && ($ulevel <= 64)) {
     quest::say("Well, hello traveler. Are you enjoying your stay on this wonderful ship? It is truly a wonder, isn't it? While I can see you are on the path to becoming a great adventurer, I sense that you are not yet powerful enough to help me with a task I need done. Return to me when you have experienced the world a little more.");
     }
  if (($text=~/hail/i) && ($ulevel >= 65)) {
    quest::say("Greetings adventurer, have you come to explore this new [continent] we recently discovered?");
    quest::setglobal("bic",1,5,"F");
  }
  if ($text=~/continent/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::emote("focuses his attention on $name.");
    quest::say("Due to some rather odd events with Calliav, we, the Wayfarers Brotherhood, were guided here to the continent we have come to call Taelosia. It is a continent which has suffered through a great magical explosion and now the native inhabitants are in dire straits. Our goal was to investigate this continent and find out more about the strange pieces of matter that we recently found in various places. All signs led us here and so we decided to build this magnificent floating city you are standing in. Unfortunately, we have found out some rather disturbing [news] recently that has all of us rather concerned.");
  }
}
if ($text=~/news/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
  quest::say("Well, when we finished the city, we began to send out scouts to various locales all over the new continent. Right away information started to flow in. They gave us details on the layout of the land and its current inhabitants. We began to piece together this picture of the current state of things on land. Many of the reports gave details on various things like wildlife and climate as well as the local inhabitants and level of advancement. All of this seemed promising to us as we thought we might be able to talk to the natives and find out more about the strange matter that seemed to originate from this place, but then we begin to receive some very [upsetting reports].");
  }
  }
  if ($text=~/upsetting reports/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
     quest::say("Apparently, the event that spread these strange pieces of matter all over Norrath brought with it a group of beings more horrifying than a shaved dwarf. These creatures seemed to be an organized army of some sort. They have apparently taken over the continent and enslaved the natives. Curious about this, we ordered our scouts to find out more about these beings. Specifically, if they could be reasoned with and if they knew anymore about the odd chunks of rock we found recently. Shortly after we made this demand, everything [stopped].");
     }
     }
  if ($text=~/stopped/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
      quest::say("The scout reports stopped coming in. We figured that maybe they had just not found anything yet, but as time went by we began to worry. That's when Morden suggested that we send someone to find one of them and learn what was going on. Young Falcin did not know what he was getting into when he volunteered to check things out for us. Falcin left here under the light of a full moon and returned soon after barely able to breathe. He had been caught spying on the beings that currently control the continent. They had tortured him for hours trying to get information. Being the resourceful human he is, he managed to escape only to be mauled by what the natives call ukun, a humanoid creature that is twisted and lethal. Left for dead, Falcin dragged himself back to us and explained what he had [discovered] during his ordeal.");
      }
      }
   if ($text=~/discovered/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) { 
    quest::say("Falcin told us that all of the scouts had been captured and were either dead or were enduring extreme torture sessions. These invading beings are a vicious lot who show absolutely no mercy. Falcin's wounds were proof enough of that. Falcin explained that the scouts who were still alive are being held near where they had been discovered. Those who he could not find he assumed were dead but he still tried to get some proof before he wrote them off. Unfortunately Falcin would not live to see his desire through, he passed on shortly after revealing this information to us and now we are at a loss as to how we can help our scouts who are still living return to us and provide a proper burial for those who were lost. We cannot afford to send anyone else out there as it seems it will require a significant force in order to have any chance of accomplishing the [task] we need completed.");  
    }
    }
    if ($text=~/task/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("With half of our numbers back home dealing with the investigation of the recently unearthed dungeons and the rest here on the ship handling what information we have and trying to decide the best plan of action, Morden figured it might be a good idea to ask some courageous individuals to assist us. Morden has authorized some form of valuable reward for those who can bring us any information regarding our missing scouts or the scouts themselves. Seeing as how you have been so interested in all I have said so far, do you think you would be interested in helping the Wayfarers Brotherhood?");
    }
    }
    if ($text=~/interested in helping the wayfarers brotherhood/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("Most excellent. Please take these as a token of our gratitude. It is not much to look at now, but by helping us you will find ways to make this stone more [powerful] when combining it with certain items in that sealer. Please take the time to find Taminoa Bialu, Vaifan Cogswin, and L`diava Rexxen. They are all located on this ship. Each of them is responsible for information from certain areas of the continent. Taminoa has all the information on the city area, Vaifan keeps the information on the mountain passes, and L`diava collects information on the temple areas. If you truly wish to help us, talk to some or all of them and they will help guide you to the right path. When you have finished helping them all, return to me and I shall give you the reward that has been approved by Morden.");
    quest::summonitem(67512);
    quest::summonitem(67659);
    }
    }
    if ($text=~/powerful/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("The stone I have given you is very special indeed. It is a rare stone with a power that has not yet been revealed. After studying it we have come to the conclusion that its power is based off of resonance. You will see that there are fourteen sockets in the stone. Each socket requires a gem fragment of a certain resonance. As the fragments are set in the stone it will gradually increase in power. These fragments must be placed in the stone in a certain order using a set of clockwork gemcutter's tools, the stone, and the correct shard in the device I handed to you along with the stone. As you help find our scouts, you may come across the gem fragments that will fit into the stone. If you do, please try combining them in the special sealer. If at any time you lose the sealer or misplace the stone return to me and I will what I can do about a replacement.");
    }
    }
    $qglobals{bic}=undef;
    }