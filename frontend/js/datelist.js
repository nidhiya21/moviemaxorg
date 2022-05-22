var d = new Date(),
month = '' + (d.getMonth() + 1),
day1 = '' + (d.getDate()+ 1),
day2 = '' + (d.getDate()+ 2),
day3 = '' + (d.getDate()+ 3),
day4 = '' + (d.getDate()+ 4),
day5 = '' + (d.getDate()+ 5),
day6 = '' + (d.getDate()+ 6),
day7 = '' + (d.getDate()+ 7),
day = '' + d.getDate(),
year = d.getFullYear();
if (month.length < 2) 
    month = '0' + month;
if (day.length < 2) 
    day = '0' + day;
var dates = [year, month, day].join('-');
var dates1 = [year, month, day1].join('-');
var dates2 = [year, month, day2].join('-');
var dates3 = [year, month, day3].join('-');
var dates4 = [year, month, day4].join('-');
var dates5 = [year, month, day5].join('-');
var dates6 = [year, month, day6].join('-');
var dates7 = [year, month, day7].join('-');
var theme = '';
    movieData = {
    
    [dates]: [
      
    ],
     [dates1]: [
      
    ],
     [dates2]: [
      
    ],
     [dates3]: [
      
    ],
     [dates4]: [
      
    ],
     [dates5]: [
      
    ],
     [dates6]: [
      
    ],
     [dates7]: [
      
    ],
}, movieDataByReleaseDate = {

    [dates]: [
      
    ],
     [dates1]: [
      
    ],
     [dates2]: [
      
    ],
     [dates3]: [
      
    ],
     [dates4]: [
      
    ],
     [dates5]: [
      
    ],
     [dates6]: [
      
    ],
     [dates7]: [
      
    ],

    
    
   
    
}, movieDataBySessionTimes = {
   
    [dates]: [
      
    ],
     [dates1]: [
      
    ],
     [dates2]: [
      
    ],
     [dates3]: [
      
    ],
     [dates4]: [
      
    ],
     [dates5]: [
      
    ],
     [dates6]: [
      
    ],
     [dates7]: [
      
    ],
  
};