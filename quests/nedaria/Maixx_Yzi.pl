# Gather eyes
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Well, hello there $name. I've been piecing this dock together for the last several days. It was somewhat of a simple task. I'm pretty good with work underwater. I find I can easily hold posts in place with my tail while I work with my hands and feet. An advantage I suppose. I would guess that's why I was asked to help Morden. Now, I'm working on creating some very strong glue we will use to seal parts of the hull of the ship we're building. Thing is, I need a lot of cove frog eyes for this job. If you want to [aid] me, I could reward you and give you some information."); 
}

if($text=~/i will aid you/i){

quest::say("Wonderful! If you could bring me four cove frog eyes, it would be a big help."); 
}
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 66189 => 4)) { # cove frog eye

quest::say("Great, I'm working my way through a batch of glue. I keep it hidden so no one is tempted to steal it or play a practical joke on our friends. Here is your reward. I'll also tell you that I used to be a common thief, but not in the way you think. I had to steal a few supplies now and then when I lived on the lands as an exile. But then Morden Rasp found me and I haven't stolen a thing since."); 
quest::exp(10000);
quest::givecash(7,7,9,6);

}
}

#END of FILE zone:nedaria ID:182060 -- Maixx_Yzi.pl

