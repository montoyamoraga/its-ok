//wave of mutilation
//by pixies
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

[
"cease to resist", //verse1
"giving my goodbye",
"drive my car",
"into the ocean",
"you think i am dead",
"but I sail away",
"on a wave of mutilation", //chorus1
"wave of mutilation",
"wave of mutilation",
"wave of mutilation",
"a wave",
"wave",
"i have kissed mermaids",//verse2
"rode the el nino", 
"walked the sand",
"with the crustaceans",
"could find my way",
"to mariana",
"on a wave of mutilation",//chorus2
"wave of mutilation", 
"wave of mutilation",
"wave of mutilation",
"wave of mutilation",
"wave",
"a wave",
"wave of mutilation", //chorus3
"wave of mutilation",
"wave of mutilation",
"wave of mutilation",
"wave",
"a wave"]
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

<<< "countdown" >>>;
sendLyric("one");
msPerBeat :: ms => now;
sendLyric("two");
msPerBeat :: ms => now;
sendLyric("three");
msPerBeat :: ms => now;
sendLyric("four");
msPerBeat :: ms => now;

//start the piece
<<< "title: wave of mutilation">>>;
<<< "original artist: pixies">>>;

//set bpm
setBpm(120);
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
(2+4)*4 => int beatsIntro;
//0:00
12*4 => int beatsVerse1;
//0:00
12*4 =>int beatsChorus1;
//0:00
12*4 => int beatsVerse2;
//0:00
12*4 =>int beatsChorus2;
//0:00
12*4 => int beatsChorus3;

beatsIntro + 
beatsVerse1 + 
beatsChorus2 +
beatsVerse2 + 
beatsChorus2 + 
beatsChorus3 => int totalBeats;

//countdown
sendLyric("one");
msPerBeat :: ms => now;
sendLyric("two");
msPerBeat :: ms => now;
sendLyric("three");
msPerBeat :: ms => now;
sendLyric("four");
msPerBeat :: ms => now;

//main part, the actual song
for (1 => int i; i <= totalBeats; i++) {
    
    //intro
    if (i <= beatsIntro) {
        <<< "beatsIntro: "  + i + "/" + beatsIntro>>>;
    }
    
    //verse1
    beatsIntro => int verse1LowerBound;
    beatsIntro + beatsVerse1 => int verse1UpperBound;
    if (i > verse1LowerBound && i <= verse1UpperBound){
        <<< "beatsVerse1: " + (i - verse1LowerBound) + "/" + beatsVerse1>>>;
        
        if (i == verse1LowerBound + 1 + 4*0) {
            sendLyric(lyrics[0]);  
        }
        if (i == verse1LowerBound + 1 + 4*2) {
            sendLyric(lyrics[1]);
        }
        if (i == verse1LowerBound + 1 + 4*4) {
            sendLyric(lyrics[2]);
        }
        if (i == verse1LowerBound + 1 + 4*6) {
            sendLyric(lyrics[3]);  
        }
        if (i == verse1LowerBound + 1 + 4*8) {
            sendLyric(lyrics[4]);
        }
        if (i == verse1LowerBound + 1 + 4*10) {
            sendLyric(lyrics[5]);
        }
    }
    
    //chorus1
    beatsIntro + beatsVerse1 => int chorus1LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 => int chorus1UpperBound;
    if (i > chorus1LowerBound && i <= chorus1UpperBound){
        <<< "beatsChorus1: " + (i - chorus1LowerBound) + "/" + beatsChorus1>>>;
        
        if (i == chorus1LowerBound + 1 + 4*0) {
            sendLyric(lyrics[6]);  
        }
        if (i == chorus1LowerBound + 1 + 4*2) {
            sendLyric(lyrics[7]);
        }
        if (i == chorus1LowerBound + 1 + 4*4) {
            sendLyric(lyrics[8]);
        }
        if (i == chorus1LowerBound + 1 + 4*6) {
            sendLyric(lyrics[9]);  
        }
        if (i == chorus1LowerBound + 1 + 4*8) {
            sendLyric(lyrics[10]);
        }
        if (i == chorus1LowerBound + 1 + 4*10) {
            sendLyric(lyrics[11]);
        }
    }
    
    //verse2
    beatsIntro + beatsVerse1 + beatsChorus1 => int verse2LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 => int verse2UpperBound;
    if (i > verse2LowerBound && i <= verse2UpperBound){
        <<< "beatsVerse2: " + (i - verse2LowerBound) + "/" + beatsVerse2>>>;
        
        if (i == verse2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[12]);  
        }
        if (i == verse2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[13]);
        }
        if (i == verse2LowerBound + 1 + 4*4) {
            sendLyric(lyrics[14]);
        }
        if (i == verse2LowerBound + 1 + 4*6) {
            sendLyric(lyrics[15]);  
        }
        if (i == verse2LowerBound + 1 + 4*8) {
            sendLyric(lyrics[16]);
        }
        if (i == verse2LowerBound + 1 + 4*10) {
            sendLyric(lyrics[17]);
        }
    }
    
    //chorus2
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 => int chorus2LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 => int chorus2UpperBound;
    if (i > chorus2LowerBound && i <= chorus2UpperBound){
        <<< "beatsChorus2: " + (i - chorus2LowerBound) + "/" + beatsChorus2>>>;
        
        if (i == chorus2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[18]);  
        }
        if (i == chorus2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[19]);
        }
        if (i == chorus2LowerBound + 1 + 4*4) {
            sendLyric(lyrics[20]);
        }
        if (i == chorus2LowerBound + 1 + 4*6) {
            sendLyric(lyrics[21]);  
        }
        if (i == chorus2LowerBound + 1 + 4*8) {
            sendLyric(lyrics[22]);
        }
        if (i == chorus2LowerBound + 1 + 4*10) {
            sendLyric(lyrics[23]);
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
    displayCurrentTime();   
 
//piece ended
<<< "piece ended" >>>;
