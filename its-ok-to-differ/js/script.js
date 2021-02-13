console.log("hey i am a script");


// d3.selectAll("p").style("color", function() {
//   return "hsl(" + Math.random() * 360 + ", 100%, 50%)";
// });


//aaron data
var data_aaron_time_mile = [11*60+33, 11*60+35, 10*60+54, 10*60+40, 10*60+5,
                       10*60+28, 11*60+18, 10*60+58, 11*60+41, 11*60+15,
                       12*60+31, 14*60+27, 15*60+31, 12*60+55, 12*60+50,
                       13*60+12, 12*60+54, 13*60+22, 13*60+8, 14*60+50,
                       13*60+50, 14*60+12, 15*60+1, 13*60+11, 15*60+44,
                       17*60+3, 16*60+22];

//victor data

var data_victor_time_km = [5*60+51, 6*60+6, 6*60+0, 6*60+45, 6*60+27,
                      6*60+12, 6*60+24, 6*60+27, 6*60+49, 6*60+24,
                      6*60+39, 6*60+36, 6*60+48, 6*60+48, 6*60+54,
                      6*60+24, 6*60+30, 6*60+33, 6*60+45, 7*60+3,
                      7*60+21, 7*60+21, 7*60+33, 7*60+27, 8*60+3,
                      8*60+0, 10*60+51, 7*60+24, 7*60+25, 7*60+51,
                      8*60+18, 8*60+3, 7*60+57, 8*60+0, 8*60+15,
                      8*60+6, 8*60+48, 7*60+39, 8*60+30, 7*60+24,
                      7*60+12, 8*60+0];

// var body = d3.select("body");
// var div = body.append("div");
// div.html("hello world");

console.log("begin chart aaron");

var x_aaron = d3.scaleLinear()
          .domain([0, d3.max(data_aaron_time_mile)])
          .range([0, 420])

d3.select(".chart_aaron")
  .selectAll("div")
  .data(data_aaron_time_mile)
  .enter().append("div")
  .style("width", function(d) {return x_aaron(d) + "px";})
  .text(function(d) {return Math.floor(d/60) + "m" + Math.floor(d%60) + "s";});

console.log("finish chart aaron");

console.log("begin chart victor");

var x = d3.scaleLinear()
          .domain([0, d3.max(data_victor_time_km)])
          .range([0, 420])

var x_victor = d3.scaleLinear()
          .domain([0, d3.max(data_aaron_time_mile)])
          .range([0, 420])


d3.select(".chart_victor")
  .selectAll("div")
  .data(data_victor_time_km)
  .enter().append("div")
  .style("width", function(d) {return x_victor(d) + "px";})
  .text(function(d) {return Math.floor(d/60) + "m" + Math.floor(d%60) + "s";});

console.log("finish chart victor");



console.log("i finished doing stuff");
