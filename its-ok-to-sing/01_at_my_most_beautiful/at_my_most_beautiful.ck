//at my most beautiful
//by r.e.m.
//cover version by victor raul y sus maquinitas
//programmed by aaron montoya-moraga
//v0.0.1
//april 2017

//variable for holding tempo in bpm and milliseconds
float bpm;
float msPerBeat;

//variables for storing the current ms, second and minute
//and current step
int currentMs;
int currentSecond;
int currentMinute;
int currentStep;

//host name and port
"localhost" => string hostname;
1234 => int port;

//send object
OscSend xmit;

//aim the transmitter
xmit.setHost(hostname, port);

//variables for storing the duration in minutes and ms
float durationMinutes;
float durationMs;

//lyrics
["I have found a way to make you",
"I have found a way",
"A way to make you smile",
"I read bad poetry",
"Into your machine",
"I save your messages",
"Just to hear your voice",
"You always listen carefully",
"To awkward rhymes",
"You always say your name",
"Like I would not know it is you",
"At your most beautiful",
"I have found a way to make you",
"I have found a way",
"A way to make you smile",
"At my most beautiful",
"I count your eyelashes secretly",
"With every one whisper I love you",
"I let you sleep",
"I know you are closed eyed watching me",
"Listening",
"I thought I saw a smile",
"I have found a way to make you",
"I have found a way",
"A way to make you smile"]
@=> string lyrics[];

//variable for number of steps
int numberSteps;

//function for setting up the number of steps
function void setSteps(int steps) {
    steps => numberSteps;
}

//function for setting up duration of the piece
function void setDuration(float minutes) {
    //setup duration in minutes
    minutes => durationMinutes;
    //setup duration in ms
    durationMinutes * 60 * 1000 => durationMs;
}

//function for setting up the bpm
function void setBpm(float newBpm) {
    //assigning the new bpm
    newBpm => bpm;
    //updating millis per beat
    60 * 1000 / bpm => msPerBeat;
}

function void initialize() {
    0 => currentMs;
    0 => currentSecond;
    0 => currentMinute;
    0 => currentStep;
}

//function for displaying current time
function void displayCurrentTime() {
    (currentMs / 1000) % 60 => currentSecond;
    currentMs / 1000 / 60 => currentMinute;
    if (currentSecond < 10) {
        <<< "current moment is " + currentMinute +  ":0" + currentSecond >>>;
    } else {
        <<< "current moment is " + currentMinute +  ":" + currentSecond >>>;
    }  
}

//function for sending beat
function void sendBeat() {
    // start the message...
    xmit.startMsg( "/beat", "s" );
    
    // a message is kicked as soon as it is complete 
    "beat" => string temp => xmit.addString;
}

function void sendLyric(string lyric) {
    // start the message...
    xmit.startMsg( "/lyric", "s" );
    
    // a message is kicked as soon as it is complete 
    lyric => string temp => xmit.addString;
}


//start the piece
<<< "title:at my most beautiful">>>;
<<< "original artist: r.e.m.">>>;

//set bpm
setBpm(100);
//<<< bpm + " bpm, " + msPerBeat + " ms per beat" >>>;

//set duration to be 5 minutes
//setDuration(5);
//<<< "the piece lasts " + durationMinutes + " minutes, or " + durationMs + " ms">>>;

//set the number of steps
setSteps(16);

//initialize
initialize();

0 => int currentBeat;
4 => int divisorBeat;
    
0 => int counter;

//0:00
14*4 => int beatsIntro;
//0:34
7*4 => int beatsChorus1;
//0:51
15*4 => int beatsVerse1;
//1:28
4*4 =>int beatsPreChorus1;
//1:38
7*4 => int beatsChorus2;
//1:54
15*4 => int beatsVerse2;
//2:32
4*4 =>int beatsPreChorus2;
//2:41
7*4 => int beatsChorus3;

beatsIntro + 
beatsChorus1 +
beatsVerse1 + 
beatsPreChorus1 + 
beatsChorus2 +
beatsVerse2 + 
beatsPreChorus2 + 
beatsChorus3 => int totalBeats;

sendLyric("one");
msPerBeat :: ms => now;
sendLyric("two");
msPerBeat :: ms => now;
sendLyric("three");
msPerBeat :: ms => now;
sendLyric("four");
msPerBeat :: ms => now;


for (1 => int i; i <= totalBeats; i++) {
    
    //intro
    if (i <= beatsIntro) {
        <<< "beatsIntro: "  + i + "/" + beatsIntro>>>;
    }
    //chorus1
    if (i > beatsIntro && 
    i <= beatsIntro + beatsChorus1){
        <<< "beatsChorus1: " + (i -beatsIntro) + "/" + beatsChorus1>>>;
        
        if(i == beatsIntro + 1 + 4*0) {
            sendLyric(lyrics[0]);  
        }
        if (i == beatsIntro + 1 + 4*2) {
            sendLyric(lyrics[1]);
        }
        if (i == beatsIntro + 1 + 4*4) {
            sendLyric(lyrics[2]);
        }
    }
    //verse1
    beatsIntro + beatsChorus1 => int verse1LowerBound;
    beatsIntro + beatsChorus1 + beatsVerse1 => int verse1UpperBound;
    if (i > verse1LowerBound && i <= verse1UpperBound) {
        
        <<< "beatsVerse1: " 
        + (i - verse1LowerBound) + "/" + beatsVerse1>>>;
        
        if(i == verse1LowerBound + 1 + 4*0) {
            sendLyric(lyrics[3]);  
        }
        if (i == verse1LowerBound + 1 + 4*2) {
            sendLyric(lyrics[4]);
        }
        if (i == verse1LowerBound + 1 + 4*3) {
            sendLyric(lyrics[5]);
        }
        if (i == verse1LowerBound + 1 + 4*5) {
            sendLyric(lyrics[6]);
        }
        if (i == verse1LowerBound + 1 + 4*6) {
            sendLyric(lyrics[7]);
        }
        if (i == verse1LowerBound + 1 + 4*9) {
            sendLyric(lyrics[8]);
        }
        if (i == verse1LowerBound + 1 + 4*10) {
            sendLyric(lyrics[9]);
        }
        if (i == verse1LowerBound + 1  +4*12) {
            sendLyric(lyrics[10]);
        }
        if (i == verse1LowerBound + 1 + 4*14) {
            sendLyric(lyrics[11]);
        }
    }
    
    //prechorus1
    beatsIntro + beatsChorus1 + beatsVerse1 => int preChorus1LowerBound;
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 => int preChorus1UpperBound;
    if (i > preChorus1LowerBound && i <= preChorus1UpperBound) {
        <<< "beatsPreChorus1: " +  (i -preChorus1LowerBound)  + "/" + beatsPreChorus1>>>;
    }
    
    //chorus2
    beatsIntro + beatsChorus1 + beatsVerse1  + beatsPreChorus1 => int chorus2LowerBound;
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 => int chorus2UpperBound;
    if (i > chorus2LowerBound && i <= chorus2UpperBound) {
        <<< "beatsChorus2: " + (i - chorus2LowerBound) + "/" + beatsChorus2>>>;
        
        if(i == chorus2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[12]);  
        }
        if (i == chorus2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[13]);
        }
        if (i == chorus2LowerBound + 1 + 4*4) {
            sendLyric(lyrics[14]);
        }
    }
    
    //verse2
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 => int verse2LowerBound;
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 + beatsVerse2 => int verse2UpperBound;
    if (i > verse2LowerBound && i <= verse2UpperBound) {
        <<< "beatsVerse2: " + (i - verse2LowerBound) + "/" + beatsVerse2>>>;
        
        if(i == verse2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[15]);  
        }
        if(i == verse2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[16]);  
        }
        if(i == verse2LowerBound + 1 + 4*6) {
            sendLyric(lyrics[17]);  
        }
        if(i == verse2LowerBound + 1 + 4*9) {
            sendLyric(lyrics[18]);  
        }
        if(i == verse2LowerBound + 1 + 4*10) {
            sendLyric(lyrics[19]);  
        }
        if(i == verse2LowerBound + 1 + 4*13) {
            sendLyric(lyrics[20]);  
        }
        if(i == verse2LowerBound + 1 + 4*14) {
            sendLyric(lyrics[21]);  
        }
    }

    
    //prechorus2
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 + beatsVerse2 => int preChorus2LowerBound;
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 + beatsVerse2 + beatsPreChorus2 => int preChorus2UpperBound;
    if (i > preChorus2LowerBound && i <= preChorus2UpperBound) {
        <<< "beatsPreChorus2: " + (i - preChorus2LowerBound) + "/" + beatsPreChorus2>>>;
    }
    
    //chorus3
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 + beatsVerse2 + beatsPreChorus2 => int chorus3LowerBound;
    beatsIntro + beatsChorus1 + beatsVerse1 + beatsPreChorus1 + beatsChorus2 + beatsVerse2 + beatsPreChorus2 + beatsChorus3 => int chorus3UpperBound;
    if (i > chorus3LowerBound && i <= chorus3UpperBound) {
        <<< "beatsChorus3: " + (i - chorus3LowerBound) + "/" + beatsChorus3>>>;
        if(i == chorus3LowerBound + 1 + 4*0) {
            sendLyric(lyrics[22]);  
        }
        if (i == chorus3LowerBound + 1 + 4*2) {
            sendLyric(lyrics[23]);
        }
        if (i == chorus3LowerBound + 1 + 4*4) {
            sendLyric(lyrics[24]);
        }

    }
    
    sendBeat();
    msPerBeat :: ms => now;
}
    

    //let time flow
    divisorBeat * msPerBeat :: ms => now;
    (currentStep + 1) % 16 => currentStep;
    //advance ms according to beat
    //currentMs + msPerBeat => currentMs;
    //display current time
    //displayCurrentTime();   
 
//piece ended
<<< "piece ended" >>>;
