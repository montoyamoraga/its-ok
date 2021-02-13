//we are going to be friends
//by the white stripes
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
["fall is here hear the yell",
"back to school ring the bell",
"brand new shoes walking blues",
"climb the fence books and pens",
"i can tell that we are going to be friends",
"i can tell that we are going to be friends",
"walk with me suzy lee",
"through the park and by the tree",
"we will rest upon the ground",
"and look at all the bugs we found",
"safely walk to school without a sound",
"safely walk to school without a sound",
"well here we are no one else",
"we walked to school all by ourselves",
"there is dirt on our uniforms",
"from chasing all the ants and worms",
"we clean up and now its time to learn",
"we clean up and now its time to learn",
"numbers letters learn to spell",
"nouns and books and show and tell",
"at playtime we will throw the ball",
"back to class through the hall",
"teacher marks our height against the wall",
"teacher marks our height against the wall",
"and we do not notice any time pass",
"we do not notice anything",
"we sit side by side in every class",
"teacher thinks that I sound funny",
"but she likes the way you sing",
"tonight i will dream while i am in bed",
"when silly thoughts go through my head",
"about the bugs and alphabet",
"and when I wake tomorrow i will bet",
"that you and I will walk together again",
"i can tell that we are going to be friends",
"cause i can tell that we are going to be friends"]
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
<<< "title: we are going to be friends">>>;
<<< "original artist: the white stripes">>>;

//set bpm
setBpm(90);
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
2*4 => int beatsIntro;
//0:04
9*4 => int beatsVerse1;
//0:28
9*4 => int beatsVerse2;
//0:50
9*4 => int beatsVerse3;
//1:12
9*4 => int beatsVerse4;
//1:34
8*4 => int beatsVerse5;
//1:53
9*4 => int beatsVerse6;

beatsIntro + 
beatsVerse1 +
beatsVerse2 + 
beatsVerse3 +
beatsVerse4 + 
beatsVerse5 +
beatsVerse6  => int totalBeats;

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
    if (i > beatsIntro && i <= beatsIntro + beatsVerse1){
        <<< "beatsVerse1: " + (i -beatsIntro) + "/" + beatsVerse1>>>;
        
        if (i == beatsIntro + 1 + 4*0) {
            sendLyric(lyrics[0]);  
        }
        if (i == beatsIntro + 1 + 4*1) {
            sendLyric(lyrics[1]);
        }
        if (i == beatsIntro + 1 + 4*2) {
            sendLyric(lyrics[2]);
        }
        if (i == beatsIntro + 1 + 4*3) {
            sendLyric(lyrics[3]);  
        }
        if (i == beatsIntro + 1 + 4*4) {
            sendLyric(lyrics[4]);
        }
        if (i == beatsIntro + 1 + 4*6) {
            sendLyric(lyrics[5]);
        }
    }
    
    //verse2
    beatsIntro + beatsVerse1 @=> int verse2LowerBound;
    beatsIntro + beatsVerse1 + beatsVerse2 @=> int verse2UpperBound;
    if (i > verse2LowerBound && i <= verse2UpperBound){
        <<< "beatsVerse2: " + (i - verse2LowerBound) + "/" + beatsVerse2>>>;
        
        if (i == verse2LowerBound + 1 + 4*0) {
            sendLyric(lyrics[6]);  
        }
        if (i == verse2LowerBound + 1 + 4*1) {
            sendLyric(lyrics[7]);
        }
        if (i == verse2LowerBound + 1 + 4*2) {
            sendLyric(lyrics[8]);
        }
        if (i == verse2LowerBound + 1 + 4*3) {
            sendLyric(lyrics[9]);  
        }
        if (i == verse2LowerBound + 1 + 4*4) {
            sendLyric(lyrics[10]);
        }
        if (i == verse2LowerBound + 1 + 4*6) {
            sendLyric(lyrics[11]);
        }
    }
    //verse3
    beatsIntro + beatsVerse1 + beatsVerse2 @=> int verse3LowerBound;
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 @=> int verse3UpperBound;
    if (i > verse3LowerBound && i <= verse3UpperBound){
        <<< "beatsVerse3: " + (i - verse3LowerBound) + "/" + beatsVerse3>>>;
        
        if (i == verse3LowerBound + 1 + 4*0) {
            sendLyric(lyrics[12]);  
        }
        if (i == verse3LowerBound + 1 + 4*1) {
            sendLyric(lyrics[13]);
        }
        if (i == verse3LowerBound + 1 + 4*2) {
            sendLyric(lyrics[14]);
        }
        if (i == verse3LowerBound + 1 + 4*3) {
            sendLyric(lyrics[15]);  
        }
        if (i == verse3LowerBound + 1 + 4*4) {
            sendLyric(lyrics[16]);
        }
        if (i == verse3LowerBound + 1 + 4*6) {
            sendLyric(lyrics[17]);
        }
    }
    //verse4
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 @=> int verse4LowerBound;
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 + beatsVerse4 @=> int verse4UpperBound;
    if (i > verse4LowerBound && i <= verse4UpperBound){
        <<< "beatsVerse4: " + (i - verse4LowerBound) + "/" + beatsVerse4>>>;
        
        if (i == verse4LowerBound + 1 + 4*0) {
            sendLyric(lyrics[18]);  
        }
        if (i == verse4LowerBound + 1 + 4*1) {
            sendLyric(lyrics[19]);
        }
        if (i == verse4LowerBound + 1 + 4*2) {
            sendLyric(lyrics[20]);
        }
        if (i == verse4LowerBound + 1 + 4*3) {
            sendLyric(lyrics[21]);  
        }
        if (i == verse4LowerBound + 1 + 4*4) {
            sendLyric(lyrics[22]);
        }
        if (i == verse4LowerBound + 1 + 4*6) {
            sendLyric(lyrics[23]);
        }
    }
    //verse5
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 + beatsVerse4 @=> int verse5LowerBound;
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 + beatsVerse4 + beatsVerse5 @=> int verse5UpperBound;
    if (i > verse5LowerBound && i <= verse5UpperBound){
        <<< "beatsVerse5: " + (i - verse5LowerBound) + "/" + beatsVerse5>>>;
        
        if (i == verse5LowerBound + 1 + 4*0) {
            sendLyric(lyrics[24]);  
        }
        if (i == verse5LowerBound + 1 + 4*2) {
            sendLyric(lyrics[25]);
        }
        if (i == verse5LowerBound + 1 + 4*4) {
            sendLyric(lyrics[26]);
        }
        if (i == verse5LowerBound + 1 + 4*6) {
            sendLyric(lyrics[27]);  
        }
        if (i == verse5LowerBound + 1 + 4*7) {
            sendLyric(lyrics[28]);
        }
    }
    //verse6
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 + beatsVerse4 + beatsVerse5 @=> int verse6LowerBound;
    beatsIntro + beatsVerse1 + beatsVerse2 + beatsVerse3 + beatsVerse4 + beatsVerse5 + beatsVerse6 @=> int verse6UpperBound;
    if (i > verse6LowerBound && i <= verse6UpperBound){
        <<< "beatsVerse6: " + (i - verse6LowerBound) + "/" + beatsVerse6>>>;
        
        if (i == verse6LowerBound + 1 + 4*0) {
            sendLyric(lyrics[29]);  
        }
        if (i == verse6LowerBound + 1 + 4*1) {
            sendLyric(lyrics[30]);
        }
        if (i == verse6LowerBound + 1 + 4*2) {
            sendLyric(lyrics[31]);
        }
        if (i == verse6LowerBound + 1 + 4*3) {
            sendLyric(lyrics[32]);  
        }
        if (i == verse6LowerBound + 1 + 4*4) {
            sendLyric(lyrics[33]);
        }
        if (i == verse6LowerBound + 1 + 4*6) {
            sendLyric(lyrics[34]);
        }
        if (i == verse6LowerBound + 1 + 4*8) {
            sendLyric(lyrics[35]);
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
