# OPENWEATHER API CALL EXAMPLES

## API CALL EXAMPLES
http://history.openweathermap.org/data/2.5/history/city?q=london,uk&type=hour&start=1369728000&end=1369789200&appid=<replace your API key here>

http://history.openweathermap.org/data/2.5/history/city?q=london,uk&type=hour&start=1618718315&cnt=1&appid=<replace your API key here>

http://history.openweathermap.org/data/2.5/history/city?id=1581130&type=hour&start=1618506000&appid=<replace your API key here>

http://api.openweathermap.org/data/2.5/forecast/daily?id=1581130&cnt=7&appid=<replace your API key here>&units=metric

## UNIX TIMESTAMP

### What is the unix time stamp?

The unix time stamp is a way to track time as a running total of seconds. This count starts at the Unix Epoch on ***January 1st, 1970 at UTC***. Therefore, the unix time stamp is merely the number of seconds between a particular date and the Unix Epoch. It should also be pointed out (thanks to the comments from visitors to this site) that this point in time technically does not change no matter where you are located on the globe. This is very useful to computer systems for tracking and sorting dated information in dynamic and distributed applications both online and client side.

Human Readable Time   | Seconds
:-|:-
1 Hour  | 3600 Seconds
1 Day   | 86400 Seconds
1 Week  | 604800 Seconds
1 Month (30.44 days)    | 2629743 Seconds
1 Year (365.24 days)    | 31556926 Seconds

e.g.
Epoch time: 1618506000

- 1618506000 / 31556926 = 51 years (since 1970) (2021)
- remaining seconds = 1618506000 - (31556926 * 51) = 9102774
- 9102774 / 2629743 = 3 months
- remaining seconds = 9102774 - (2629743 * 3) = 1213545
- 1213545 / 86400 = 14 days
- remaining seconds = 1213545 - (86400 * 14) = 3945
- 3945 / 3600 = 1 hour
- remaining seconds = 3945 - (3600 * 1) = 345
- 345 / 60 = 5 mins
- remaining seconds = 345 - 5 * 60 = 45 seconds

15 April 2021
