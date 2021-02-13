//heaven knows im miserable now
//by the smiths
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
[
"I was happy in the haze of a drunken hour",
"but heaven knows i am miserable now",
"i was looking for a job and then i found a job",
"and heaven knows i am miserable now",
"in my life",
"why do i give valuable time",
"to people who do not care",
"if i live or die?",
"two lovers entwined pass me by",
"and heaven knows i am miserable now",
"i was looking for a job and then i found a job",
"and heaven knows i am miserable now",
"in my life",
"why do i give valuable time",
"to people who do not care",
"if I live or die",
"what she asked of me at the end of the day",
"caligula would have blushed",
"oh, you have been in the house too long she said",
"and i naturally fled",
"in my life",
"why do i smile",
"at people who i would much",
"rather kick in the eye",
"i was happy in the haze of a drunken hour",
"but heaven knows i am miserable now",
"oh you have been in the house too long she said",
"and i naturally fled",
"in my life",
"why do I give valuable time",
"to people who do not care",
"if i live or die"]
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
<<< "title: heaven knos im miserable now">>>;
<<< "original artist: the smiths">>>;

//set bpm
setBpm(110);
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
8*4 => int beatsIntro;
//0:15
8*4 => int beatsVerse1;
//0:33
12*4 => int beatsChorus1;
//0:58
8*4 => int beatsVerse2;
//1:15
12*4 => int beatsChorus2;
//1:48
8*4 => int beatsVerse3;
//2:05
12*4 => int beatsChorus3;
//2:30
8*4 => int beatsVerse4;
//2:47
12*4 => int beatsChorus4;


beatsIntro + 
beatsVerse1 +
beatsChorus1 + 
beatsVerse2 + 
beatsChorus2 + 
beatsVerse3 + 
beatsChorus3 +
beatsVerse4 +
beatsChorus4 => int totalBeats;

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
    }
    
    //chorus1
    beatsIntro + beatsVerse1 => int chorus1LowerBound;
    beatsIntro +  beatsVerse1 + beatsChorus1 => int chorus1UpperBound;
    if (i > chorus1LowerBound && i <= chorus1UpperBound) {
        <<< "beatsChorus1: " + (i - chorus1LowerBound) + "/" + beatsChorus1>>>;
        
        if (i == chorus1LowerBound + 1 + 4*0) {
            sendLyric(lyrics[4]);  
        }
        if (i == chorus1LowerBound + 1 + 4*2) {
            sendLyric(lyrics[5]);
        }
        if (i == chorus1LowerBound + 1 + 4*4) {
            sendLyric(lyrics[6]);  
        }
        if (i == chorus1LowerBound + 1 + 4*6) {
            sendLyric(lyrics[7]);
        }
    }
    
    //verse2
    beatsIntro + beatsVerse1 + beatsChorus1 => int verse2LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 => int verse2UpperBound;
    if (i > verse2LowerBound && i <= verse2UpperBound){
        <<< "beatsVerse2: " + (i - verse2LowerBound) + "/" + beatsVerse2>>>;
        
        if (i == verse2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[8]);  
        }
        if (i == verse2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[9]);
        }
        if (i == verse2LowerBound + 1 + 4*4) {
            sendLyric(lyrics[10]);
        }
        if (i == verse2LowerBound + 1 + 4*6) {
            sendLyric(lyrics[11]);
        }
    }
    
    //chorus2
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 => int chorus2LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 => int chorus2UpperBound;
    if (i > chorus2LowerBound && i <= chorus2UpperBound) {
        <<< "beatsChorus2: " + (i - chorus2LowerBound) + "/" + beatsChorus2>>>;
        
        if (i == chorus2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[12]);  
        }
        if (i == chorus2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[13]);
        }
        if (i == chorus2LowerBound + 1 + 4*4) {
            sendLyric(lyrics[14]);  
        }
        if (i == chorus2LowerBound + 1 + 4*6) {
            sendLyric(lyrics[15]);
        }
    }
    
    //verse3
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 => int verse3LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 => int verse3UpperBound;
    if (i > verse3LowerBound && i <= verse3UpperBound){
        <<< "beatsVerse3: " + (i - verse3LowerBound) + "/" + beatsVerse3>>>;
        
        if (i == verse3LowerBound + 1 + 4*0) {
            sendLyric(lyrics[16]);  
        }
        if (i == verse3LowerBound + 1 + 4*2) {
            sendLyric(lyrics[17]);
        }
        if (i == verse3LowerBound + 1 + 4*4) {
            sendLyric(lyrics[18]);
        }
        if (i == verse3LowerBound + 1 + 4*6) {
            sendLyric(lyrics[19]);
        }
    }
    
    //chorus3
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 => int chorus3LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 + beatsChorus3 => int chorus3UpperBound;
    if (i > chorus3LowerBound && i <= chorus3UpperBound) {
        <<< "beatsChorus3: " + (i - chorus3LowerBound) + "/" + beatsChorus3>>>;
        
        if (i == chorus3LowerBound + 1 + 4*0) {
            sendLyric(lyrics[20]);  
        }
        if (i == chorus3LowerBound + 1 + 4*2) {
            sendLyric(lyrics[21]);
        }
        if (i == chorus3LowerBound + 1 + 4*4) {
            sendLyric(lyrics[22]);  
        }
        if (i == chorus3LowerBound + 1 + 4*6) {
            sendLyric(lyrics[23]);
        }
    }
    
    //verse4
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 + beatsChorus3 => int verse4LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 + beatsChorus3 + beatsVerse4 => int verse4UpperBound;
    if (i > verse4LowerBound && i <= verse4UpperBound){
        <<< "beatsVerse4: " + (i - verse4LowerBound) + "/" + beatsVerse4>>>;
        
        if (i == verse4LowerBound + 1 + 4*0) {
            sendLyric(lyrics[24]);  
        }
        if (i == verse4LowerBound + 1 + 4*2) {
            sendLyric(lyrics[25]);
        }
        if (i == verse4LowerBound + 1 + 4*4) {
            sendLyric(lyrics[26]);
        }
        if (i == verse4LowerBound + 1 + 4*6) {
            sendLyric(lyrics[27]);
        }
    }
    
    //chorus4
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 + beatsChorus3 + beatsVerse4 => int chorus4LowerBound;
    beatsIntro + beatsVerse1 + beatsChorus1 + beatsVerse2 + beatsChorus2 + beatsVerse3 + beatsChorus3 + beatsVerse4 + beatsChorus4 => int chorus4UpperBound;
    if (i > chorus4LowerBound && i <= chorus4UpperBound) {
        <<< "beatsChorus4: " + (i - chorus4LowerBound) + "/" + beatsChorus4>>>;
        
        if (i == chorus4LowerBound + 1 + 4*0) {
            sendLyric(lyrics[28]);  
        }
        if (i == chorus4LowerBound + 1 + 4*2) {
            sendLyric(lyrics[29]);
        }
        if (i == chorus4LowerBound + 1 + 4*4) {
            sendLyric(lyrics[30]);  
        }
        if (i == chorus4LowerBound + 1 + 4*6) {
            sendLyric(lyrics[31]);
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
