#BeginFile: katta\Tilbok_Furrunner.pl
#Quests for Katta Castellum - Tilbok Furrunner: Runed Earring of Veracity, Signet Earring of Veracity and Traitor to the Validus Custodus

sub EVENT_SAY {
  if($text =~ /hail/i) {
    quest::say("Hello there, $name. Pleasure to meet you, I am Governor Tilbok Furrunner. I am tasked with the gathering and security of information for the Concilium Universus, the ruling council of our fine city.");
  }
  if ($text=~/purpose/i) {
    quest::say("The teaching in the city is that Katta feigned his death to blame it on Seru. When in fact Seru actually poisoned Katta. The crusade that Seru leads is false and must be stopped. We must gain access to Seru's [chambers] and destroy him and show the city the truth.");
  }
  if ($text=~/chambers/i) {
    quest::say("We do not know much about Seru's Chamber, that is what we need you to find out. This will require great effort on your part. We need you to infiltrate Sanctus Seru and bring back reports from each Consillium. I do not know who will have these reports, and I have only heard rumor that they exist. Return to me with the Satchel full, and your Etched Earring.");
  }
  if ($text=~/action/i) {
    quest::say("You must go see Lcea. She was Tsaph Katta's closest advisor. This matter has escalated greatly and must be placed in her hands. Ask her about the [Arx Key] she will no doubt ask in your service retrieving it. I salute your service to the city and wish you well.");
  }
  if ($text=~/praesertum/i) { #This text is from where?
    quest::say("The four Praesertum can be found in the center of the city. Each has their own building, easily identified by the symbol above the main entrance. Stay clear of the Arx Seru, the central building. This is the resting place of Seru, who does not allow anyone but the Praesertum to disturb him. To venture inside is death for all that are not invited.");
  }
  if ($text=~/who is Seru/i) {
    quest::say("Seru is the genius behind the Combine Empire. A man of unfailing honor and honesty, he devised the Inquisition, to root out unclean elements in the Empire. His saddest day was when he discovered that Katta himself was a traitor. When confronted with proof of his treachery, Katta feigned his own murder, and fled to Luclin. Seru had no choice but to amass an expedition and follow after him.");
  }
  if ($text=~/i will help/i) {
    quest::say("Excellent. Find Claudius and give that to him- it's gibberish but he and his new friends won't know that now will they? We have been watching someone named Vahn enter the city under the guise of a trader. We know he works for Seru, but we were not sure what he was doing here, so we let him be- trouble was he kept giving us the slip passing through the tunnels. Looks now like we may have found a connection. The plan sounds complicated and I don't want to confuse you, but if you stick with me it will all go just fine. You with me so far, $name?");
    quest::summonitem(29846); #Recording Stone
  }
  if ($text=~/i am with you/i) {
    quest::say("OK, now you follow Claudius but not so closely that he can see you. Keep this stone on you, it is imbued with the power to record anything spoken within a certain distance and will be a great asset to us when this is all said and done. If Claudius does meet up with Vahn, I want you to walk right up to him and say, 'traitor to the Validus Custodus' and do it quickly- they won't give you much time. That should rattle him a bit and it will be the signal for my men to come in and take care of them. After the arrest, just give that recording stone to Condor. Best of luck to you, $name.");
  }
  if ($text=~/Where is claudius/i) {
    quest::say("Claudius is a bit of a lazy sod anyway. If he ain't asleep in a bunk downstairs right now, you can bet your undergarments he will be soon.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29891 => 1)) { #Report to Tilbok
    quest::emote("reads through the report, hands you a small satchel then starts to explain. 'Finally, news from Euzan. I knew that it would take a long time to get planted within Seru, but I still worried about their mission constantly. This report shows that you have earned trust from Euzan, so I in turn will show the same trust. Euzan and Torsten were placed in the city for information. They are deep undercover and risk their life everyday. Every person in that city is ingrained with the [purpose] of either destroying Katta or converting his people.'");
    quest::summonitem(17121); #Report Satchel
    quest::faction(350,20);  #Validus Custodus
    quest::faction(168,20);  #Katta Castellum Citizens
    quest::faction(206,20);  #Magus Conlegium
    quest::faction(228,-50); #Nathyn Illuminious
    quest::faction(55,-50);  #Coterie of the Eternal Night
    quest::faction(284,-50); #Seru
    quest::faction(139,-50); #Hand of Seru
    quest::faction(96,-50);  #Eye of Seru
    quest::faction(138,-50); #Hand Legionnaries
    quest::exp(100000);
  }
  elsif (plugin::check_handin(\%itemcount, 29858 => 1, 29889 => 1)) { #Etched Earring of Veracity and Full Satchel
    quest::say("According to these reports Seru resides in a building called the Arx Seru. It is the large complex in the center of the four Praesertum Consillium. We must take [action] now. Do not underestimate the power of Sanctus Seru for what they do they feel is right.");
    quest::summonitem(29859); #Runed Earring of Veracity
    quest::faction(350,20);  #Validus Custodus
    quest::faction(168,20);  #Katta Castellum Citizens
    quest::faction(206,20);  #Magus Conlegium
    quest::faction(228,-50); #Nathyn Illuminious
    quest::faction(55,-50);  #Coterie of the Eternal Night
    quest::faction(284,-50); #Seru
    quest::faction(139,-50); #Hand of Seru
    quest::faction(96,-50);  #Eye of Seru
    quest::faction(138,-50); #Hand Legionnaries
    quest::exp(1000000);
    quest::setglobal("EarringVeracity3","1",1,"Y1"); #Used with Lcea Katta
   }
  elsif (plugin::check_handin(\%itemcount, 29844 => 1)) { #Dossier: Case 3463827
    quest::emote("reads through the dossier and then looks at you, eyebrow raised curiously, 'look at the mess you have gotten yourself in the middle of,' he says with a chuckle, while beginning to jot a note. 'Here take this and...' he stops midsentence. 'I guess I haven't even given you the chance to say whether or not you want to help. Would you like to see this through to the end?'");
    quest::summonitem(29845); #Field Orders
    quest::faction(350,20);  #Validus Custodus
    quest::faction(168,20);  #Katta Castellum Citizens
    quest::faction(206,20);  #Magus Conlegium
    quest::faction(228,-50); #Nathyn Illuminious
    quest::faction(55,-50);  #Coterie of the Eternal Night
    quest::faction(284,-50); #Seru
    quest::faction(139,-50); #Hand of Seru
    quest::faction(96,-50);  #Eye of Seru
    quest::faction(138,-50); #Hand Legionnaries
    quest::exp(5000);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}

#EndFile: katta\Tilbok_Furrunner.pl (160149)