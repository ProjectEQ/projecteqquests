# Discord Skin Samples
# http://everquest.allakhazam.com/db/quest.html?quest=2839

sub EVENT_SAY {

    # quest started, but not complete (per ZAM)
    if ( $qglobals{SkinSampleA} ) {
        quest::say( "There is nothing more I can tell you, please take the ite"
              . "m you received and get some samples for me." );
        return;
    }

    # initial contact
    elsif ( $text =~ /hail/i ) {
        quest::say( "Greetings traveler, my name is Alexsa and I am currently "
              . "looking in to collecting samples from the strange beings that"
              . " make up the Legion of Mata Muram ranks. Our initial encounte"
              . "rs with them revealed that each one is innately resistant to "
              . "certain types of weapons and weak against others. So, by orde"
              . "r of Morden, we must gather skin samples from each race and e"
              . "xamine it. Thanks to our tinkering sister, Vaifan, I now have"
              . " a device which can readily examine samples. However, with ne"
              . "ws of our scouts missing and our resources being spread so th"
              . "in, retrieving these samples are impossible for us. Since you"
              . " have taken the time to listen, I am wondering if you would b"
              . "e willing to help?" );
    }

    # quest accepted
    elsif ( $text =~ /yes/i ) {
        quest::say( "Oh wonderful! You don't know how helpful this will be. Ta"
              . "ke this device. It is what we use to examine samples. When yo"
              . "u defeat the Muramite, remove his tongue, place it inside of "
              . "here and combine it with some distilling salts. Distilling sa"
              . "lts can be found along the shores of Natimbi. Once you have c"
              . "ombined the ingredients, it will give you a final sample whic"
              . "h I will need you to return to me when you get the chance. Ea"
              . "ch time you hand a sample, I will be able to reveal to you th"
              . "e innate strengths and weeknesses for that race. If you are s"
              . "uccessful at recovering a sample from every different race th"
              . "at has come through the portal, then I will talk to Morden ab"
              . "out giving you a reward." );
        quest::summonitem(67594);    # Vaifan's Pocket Sampling Device
        quest::setglobal( 'SkinSampleA', 1, 5, 'F' );
    }

}

sub EVENT_ITEM {

    my $required = {
        0 => {
            item => 67596,           # Kyv Sample
            spam => "Ah yes, the kyv. These stealthy beings are quite elusive."
              . " The fact that you were able to recover a sample from one of "
              . "them is quite an accomplishment. Now, let's see... it appears"
              . " that the kyv have no noticeable weapon weaknesses or resista"
              . "nces, but we do know they have the ability to deflect incomin"
              . "g arrows and thrown objects. It would seem that they are also"
              . "resistant to poison based incantations, and quite weak to mag"
              . "ic based spells."
        },
        1 => {
            item => 67597,           # Ukun Sample
            spam => "An excellent find here! It appears that this was retrieve"
              . "d from one of the beings called an ukun. They have frail bodi"
              . "es but their blood is a deadly poison. This would imply that "
              . "they are probably very resistant to poison."
        },
        2 => {
            item => 67598,           # Ikaav Sample
            spam => "These snakelike beings are very deadly. The scales on the"
              . "ir lower body are all but impervious to slashing weapons, but"
              . " a well-placed arrow could do some serious damage. They are m"
              . "asters of magical energy making their defenses against such s"
              . "pells very good. However they do seem to be weak against elem"
              . "ental magic like cold."
        },
        3 => {
            item => 67599,           # Mastruq Sample
            spam => "Great sample! It looks like this was taken from a being w"
              . "ith a thickened hide. This particular being is called a mastr"
              . "uq and seems to be quite resistant to blunt objects, but an a"
              . "rrow or slashing weapon would get through that hide quite eas"
              . "ily. Because of their thick hides cold based elemental magic "
              . "would be quite ineffective while the opposite would hold true"
              . " for fire magic."
        },
        4 => {
            item => 67600,           # Aneuk Sample
            spam => "These odd-looking floating beings interest me the most. T"
              . "hey seem to be quite adept with magic making them strong agai"
              . "nst magical incantations."
        },
        5 => {
            item => 67601,           # Nok Sample
            spam => "Looks like this came from the body of the race of beings "
              . "called the noc. While their bony frames make them quite weak "
              . "against crushing damage, their plated chests protect any majo"
              . "r organs, reducing the effectiveness of arrows or slashing we"
              . "apons. It would appear that their flesh is diseased which mak"
              . "es them resistant to disease based spells but their thin skin"
              . "means that cold might be quite affective against them."
        },
        6 => {
            item => 67602,           # Ixt Sample
            spam => "These centaur-like beings are quite bloodthirsty. They ap"
              . "pear to be bred for fighting. Their fur covered lower half ma"
              . "kes them very resistant to the element of cold but while that"
              . " fur can protect them from one element it also makes them ver"
              . "y vulnerable to fire."
        },
        7 => {
            item => 67605,           # Ra'Tuk Sample
            spam => "This looks like a sample from the brutish ra'tuk. These l"
              . "arge beasts wield their axes adeptly and seem to have no majo"
              . "r weaknesses save magical based spells. Because of their stra"
              . "nge body makeup magic tends to affect them more then other sp"
              . "ell types."
        },
        8 => {
            item => 67603,           # Tunat'Muram Sample
            spam => "This is unbelievable, you retrieved a sample from the arm"
              . "y's leader and you still live? You are truly a great adventur"
              . "er. I must get this sample to our mages quickly. We must do s"
              . "ome extended testing as we have not had any information on hi"
              . "m till now."
        },
        9 => {
            item => 67604,           # Zun'muram Sample
            spam => "A two-headed beast built for destruction. This creature i"
              . "s quite powerful, as I am sure you found out when you met it."
              . " While it does not appear to have any resistances or weakness"
              . "es, this sample should reveal some more information about its"
              . " particular race."
        }
    };

    # quest started, but all basic samples not turned in yet
    if ( $qglobals{SkinSampleA} and not $qglobals{SkinSampleB} ) {
        foreach ( 0 .. 7 ) {
            my $qgKey  = "SkinSample$_";
            my $sample = $required->{$_};

            next if $qglobals{$qgKey};    # already turned in

            next unless AcceptSample( $sample, $qgKey );

            # see if all basic samples are turned in after each accepted sample
            if ( BasicSamplesDone() ) {
                quest::say(
                        "Now that I have all of the basic samples I can ad"
                      . "d all of my research into this tome and give it to yo"
                      . "u." );
                quest::summonitem(67624);    # Alexsa's Research Notes
                quest::say(
                        "While we still need samples from both the force c"
                      . "ommander and his lieutenant, what you have given me s"
                      . "o far warrants a reward of some kind. When you have r"
                      . "ecovered samples from both of the additional races I "
                      . "mentioned I will be able to reward you with something"
                      . "much better." );
                quest::setglobal( 'SkinSampleB', 1, 5, 'F' );
                last;
            }
        }
    }

    # all basic samples have been turned in
    if ( $qglobals{SkinSampleB} ) {
        foreach ( 8, 9 ) {
            my $qgKey  = "SkinSample$_";
            my $sample = $required->{$_};

            next if $qglobals{$qgKey};    # already turned in

            next unless AcceptSample( $sample, $qgKey );

            # see if all samples are turned in after each accepted sample
            if ( AllDone() ) {
                quest::say(
                        "This is unbelievable, you retrieved a sample from"
                      . " the army's leader and you still live? You are truly "
                      . "a great adventurer. I must get this sample to our mag"
                      . "es quickly. We must do some extended testing as we ha"
                      . "ve not had any information on him till now. You have "
                      . "collected all the samples we need and I thank you for"
                      . " the assistance. I am indebted to you and with approv"
                      . "al given by Morden himself I want you to take this, h"
                      . "opefully it will help you in your future adventures. "
                      . "Good day and good luck." );
                quest::summonitem(67625);    # Assistant Researcher's Symbol

                # delete qglobals to allow for repetition of quest (per ZAM)
                quest::delglobal("SkinSample$_") for ( 0 .. 9 );
                quest::delglobal("SkinSample$_") for ( 'A', 'B' );
            }
        }
    }

    # return unused items
    quest::say("I do not need this.") if keys %itemcount > 1;
    plugin::return_items( \%itemcount );

}

sub AcceptSample {

    my ( $sample, $qgKey ) = @_;

    return 0
      unless plugin::check_handin( \%itemcount, $sample->{item} => 1 );

    quest::say( $sample->{spam} );
    quest::setglobal( $qgKey, 1, 5, 'F' );

    quest::say(
            "You're doing great, but there are more samples to be found. P"
          . "lease get them to me as soon as you can." )
      unless AllDone();

    return 1;

}

sub BasicSamplesDone {

    return 1 if $qglobals{SkinSampleB};

    foreach ( 0 .. 7 ) {
        return 0 unless $qglobals{"SkinSample$_"};
    }

    return 1;

}

sub AllDone {

    return 0 unless BasicSamplesDone();

    foreach ( 8, 9 ) {
        return 0 unless $qglobals{"SkinSample$_"};
    }

    return 1;

}

#END OF FILE zone:abysmal ID:279038 -- #Alexsa_Whyte.pl