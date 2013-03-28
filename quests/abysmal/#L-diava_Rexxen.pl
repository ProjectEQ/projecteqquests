sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (defined($qglobals{bic}) && ($qglobals{bic} >= 14)) {
      quest::say("Yes, yes. What is it I can do for you? I am a very busy woman and do not have a moment to waste on just anyone. Are you one of the adventurers sent here by Fezbin?");
    }
    else {
      quest::say("Time is short and my patience is thin. Please do not disturb those you do not have dealings with, it can be very bad for your health.");
    }
  }
  if (defined($qglobals{bic}) && ($qglobals{bic} >= 14)) {
    if ($text=~/yes/i) {
      quest::say("Very good. You are just in time. I am in need of immediate assistance in the temple areas known as [Yxtta] and the [frightful temple], Kod'Taz. While our scouts have been missing for quite some time, I recently received some information that leads me to believe they may still be alive. Which one we help first is up to you. Which area do you wish to investigate?");
    }
    if ($text=~/yxtta/i) {
      quest::say("Yxtta is one of three smaller temple areas where a group of natives known as the trusik used to worship a god called Trushar. We do not know who this god is, but we believe he is a false god centered around a belief in natural destruction. Xounii Resnen was the scout assigned to this area. She was given this task because of her expertise in shapeshifting. I told her to take the shape of a trusik native and interact with them to find out more information. She managed to fit in quite well. Perhaps too well. Gradually, reports came less frequently until they eventually stopped. While everyone feared she had suffered the same fate as the other scouts, I think she started to believe she was really a trusik and has abandoned her assignment. What I need you to do is go there and find her. Now, be careful, the trusik are not a friendly race of beings and they are even more irritated by the invasion of the Muramite army. When you find Xounii I fear she may attack you. If this happens, I will not fault you for defending yourself, but if it comes to this I want some form of proof as to what happened.");
    }
  }
  if (($text=~/frightful temple/i) && defined($qglobals{bic}) && ($qglobals{bic} >= 14)) {
    quest::say("Kod'Taz is made up of multiple temples that were once used for worship by the trusik natives. Many of them have since been destroyed or made into strongholds for the Muramite army. Due to the sheer size of this area, we sent a scouting force there to investigate. All of them are still alive, save one, named Kitren Lanom. None of the scouts left in the area know what happened to her or her belongings. Last time they remember seeing her was when she entered the Temple of Tri-Fates in an attempt to pass the temple trial. Please go to Kod'Taz and speak to Kevren Nalavat. He should be able to help you access the three trials. You will have to enter each trial and bring me back anything you find of Kitren's from each temple. Even though the scouts there have searched many times for something, I think a fresh set of eyes may help some. Kevren is the only one who knows you are helping me. Please do not let the others know you were sent by me. I have not yet ruled out the possibility of foul play and if they are aware of your affiliation, it may place you in more danger.");
  }
}

sub EVENT_ITEM {
  if (defined($qglobals{bic}) && ($qglobals{bic} >= 14) && plugin::check_handin(\%itemcount, 67555 => 1)) {
    quest::say("Thank you for returning this to me. I wish the circumstances could have been different, but in honor of her memory, we will use this information to prevent the needless death of any other scouts. Now let me see what is written here. Hm. Seems she stumbled onto a secret ritual of some sort in an underground temple, called Uqua. Looks like the Muramites may be trying to reproduce another tear in space. This does not bode well for anyone. We must find out more about this. I must ask that you return to Yxtta and see if you can find any more of Xounii's entries. I cannot tell you where to start looking, but it seems that the best place to look would be in the caves where you found her. Xounii was very diligent about her reports so she would have written much about this. Try to find four more pieces of her journal entries and return them to me.");
    quest::setglobal("bic_yxt",15,5,"F");
  }
  elsif (defined($qglobals{bic_yxt}) && ($qglobals{bic_yxt} == 15) && plugin::check_handin(\%itemcount, 67556 => 1, 67703 => 1, 67557 => 1, 67558 => 1)) {
    quest::say("You are truly a blessing from the gods. I thank you for risking your life to help the brotherhood and want to offer you this token of our appreciation. It is an item of dormant power locked within. The only way to unlock this power is to combine it with the stone Fezbin gave to you. Now that we have solved the mystery of Yxtta, I need assistance in Kod'Taz. If you are willing to help please ask me about this area.");
    quest::setglobal("bic_yxt",16,5,"F");
    $client->Message(15,"You were successful in helping L'Diava complete her report of Yxtta. Fezbin will be pleased, but there are others who need your help.");
    quest::summonitem(67570);
  }
  elsif (defined($qglobals{bic}) && ($qglobals{bic} >= 14) && plugin::check_handin(\%itemcount, 67561 => 1)) {
    quest::say("Oh, thank you brave adventurer. We are now one step closer to finding out what happened to Kitren. Now, give me one second to look through the cloak here and . . . here it is, Kitren's notebook. There must be some information here that can help us more. While I read through this, I need you to return to Kevren Nalavat. He believes he may have found more clues to Kitren's whereabouts and since you did such a good job with the trials he believes you may be able to help him. Even though you have proven yourself by defeating the trials, he will not give you what I need unless you help him. When you return to him, show him this letter and it will confirm my trust in you. Hurry now. There no time to waste!");
    quest::summonitem(67702);
  }
  elsif (defined($qglobals{bic}) && ($qglobals{bic} >= 14) && plugin::check_handin(\%itemcount, 67562 => 1)) {
    quest::say("Once again, a job well done. I hear you accomplished the tasks with flying colors. Now let's see what this says. Hm . . . this changes everything. I never suspected something like this, but now that I know, it all makes sense to me. Oh poor Kitren, why didn't you warn me first? Please leave me be. I must take sometime to think. Take this as proof of your accomplishments in Kod'Taz. It possesses a power that you can unlock when you combine it with the stone from Fezbin. Return to me later if you wish to investigate Yxtta.");
    quest::setglobal("bic_kod",17,5,"F");
    quest::summonitem(67569);
    $client->Message(15,"You were successful in helping L`diava complete her report of Kod'Taz. Fezbin will be pleased, but there are others who need your help.");
  }
  plugin::return_items(\%itemcount);
}