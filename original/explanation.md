<style>
r { color: Red }
o { color: Orange }
g { color: Green }
bl { color: Blue }
</style>

### Hijri-Week Calendar System

<bl>Written by: Mohsen Alyafei (27 Dec 2023).</bl>

The Hijri-Week Calendar (HWC) System or the Hijri-Week Date (HWD) System is effectively a leap week calendar system that mimics and is based on the principles of the ISO 8601 date system.

The system specifies a week year atop any of the Hijri (Islamic) calendars by defining a notation for ordinal weeks of the year. The system is a derivative of the used Hijri (Islamic) calendar and therefore shares the accuracy of the underlying Hijri (Islamic) calendar.

The week numbering scheme of the Hijri-Week Calendar System introduced in this document closely follows that introduced by the ISO 8601 with minor deviations which are specific to the nature of the Hijri calendars.

The Hijri-Week Calendar System corresponds with the Hijri (Islamic) calendar and uses the same year number but its length is defined to be an integral number of weeks rather than months; its beginning can deviate up to a few days from 1 Muharram (the start of the Hijri year) and its end likewise can deviate up to a few days from the end of the Hijri year. On average, however, it remains in step with the Hijri calendar.

The system defined in this document works with all Hijri (Islamic) calendars (both tabular and non-tabular calendars).

The system is based on converting any existing Hijri Date (any type of Hijri Calendars) into the Hijri-Week Calendar System. The resulting Hijri-Week Date may be different depending on the underlying Hijri Calendar used. Therefore, it is important to associate a Hijri Calendar with the required Hijri-Week Calendar.

Because the system is defined to work with all types of Hijri Calendars it is not possible to create a specific independent algorithm for the system (i.e. like the ISO week date system) because the days of the months in non-tabular Hijri calendars (like the Umm Al-Qura Calendar) can vary and are not fixed as in the tabular types (intercalary years calendars, also known as arithmetical calendars). However, this should not be seen as a limitation but rather as versatile feature allowing the Hijri-Week Calendar System to be easily used and adapted to any Hijri (Islamic) calendar that may be introduced in the future.

#### Background on Hijri (Islamic) Calendars

The Hijri (Islamic) Calendar is a purely lunar (moon-based) calendar with 12 months of either 29 days or 30 days (there are no 28 or 31 days' months). The Hijri year is either 354 days (common years) or 355 days (leap years); there are no 353 or 356 days' years.

The tabular-based (arithmetical) Hijri calendars consist of 12 alternating months of 30 and 29 days (30 days for odd months and 29 days for even months), with the final 29-day month (month 12) extended to 30 days during leap Hijri years.

<r>However, it **<r>must not** be assumed that the final month (month 12) being 30 days represents a leap-year in all Hijri Calendars because non-tabular calendars such as Um Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29 day months.</r>

<bl>A Hjri leap year can therefore only be determined by examining the total number of days in the year; if it is 355 days then it is a leap year.</bl>

Tabular Hijri calendars are made of a cycle of 30 years. The complete 30-year cycle is divided into 19 common years of 354 days and 11 leap years of 355 days. This gives a total of 10,631 days in the full 30-year cycle (19 x 354 + 11 x 355).
The distribution of the leap years within the 30-year cycle (the insertion or addition of the 1 intercalary day at the end of each leap year) may be one of the common four (4) different types.

|Type|Intercalary years with 355 days inserted at year No.|
| :--------------------: |:-----------------|
**I** |2, 5, 7, 10, 13, **<r>15**, 18, 21, 24, 26, 29|
**II** |2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29|
**III** |2, 5, 8, 10, 13, 16, 19, 21, 24, **<bl>27**, 29|
**IV** |2, 5, 8, **<o>11**, 13, 16, 19, 21, 24, 27, **<o>30**|


**Type II** Intercalary tabular calendar is the most common and is used in the ICU '**islamic-civil**' and '**islamic-tbla**' calendars, though with different epochs for each type.

Under a tabular Hijri calendar, the length of the year is equal to: (19 × 354 + 11 × 355) / 30 = **354.366667 days**, and the mean length of the month is therefore **29.530555 days** resulting in a total of **50.6238095 weeks per year**. This is very close to the mean synodic month (time from the new moon to the next new moon) of **29.530588853 days**. This is an error of about **0.000033298 day per month** (or **2.877 seconds per month** or **0.0974226 seconds per day**), with the tabular lunar calendars only slipping one day with respect to the moon every about 2570 Hijri years.

#### Programming Implementation

Any programming implementation of the Hijri-Week Calendar System requires the use and access to an underlying 'Date Utility' or 'Date API' that supports a Hijri Calendar. All programming languages nowadays support Hijri Calendars and provide various properties and methods for converting between Gregorian and Hijri dates.

The initial implementation of the Hijri-Week Calendar System described in this document uses the <bl>*javascript Temporal API*</bl> which supports all the ICU Hijri Calendars, as will be further described hereunder.

<bl>*<u>Note</u>: Core functions are also provided for manipulating the new implementation of the proposed Hijri-Week Calendar (HWC) system, currently available in both javascript and typescript, with further plans for porting to C# and C++.*</bl>

#### Hijri Calendars under the ICU

The following five (5) Hijri Calendars are defined under the International Components for Unicode (ICU) and are available in many programming implementations:

|Calendar|Notes|
| :-------------------- |:-----------------|
|islamic-civil ✔️|**ICU <bl>Tabular</bl> Calendar** (intercalary leap years [**2,5,7,10,13,16,18,21,24,26,29**] Friday epoch). Alternative names include "islamic-tblc" and 'islamicc'.<br>*<u>Epoch</u> is Gregorian 19 July 622 (Friday) i.e. July 16th, 622 CE in the Julian calendar (Julian day 1948439.5).*|
|islamic-tbla ✔️|**ICU <bl>Tabular</bl> Calendar** (intercalary leap years [**2,5,7,10,13,16,18,21,24,26,29**] Thursday epoch). Also known as the Microsoft Hijri (Kuwaiti) calendar and used in the Microsoft .NET Framework HijriCalendar Class.<br>*<u>Epoch</u> is Gregorian 18 July 622 (Friday) i.e. July 15th, 622 CE in the Julian calendar (Julian day 1948438.5).*|
|islamic-umalqura ✔️|**ICU Calendar**. This is the variant used in Saudi Arabia and is based on data partially observed by sighting the new moon and partially by astronomical calculations/predictions. The special data used is for years 1300 AH to 1600 AH. For years before 1300 AH and years after 1600 AH, the calendar uses a tabular calendar with the leap year pattern [**2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29**] with civil (Friday) epoch; i.e. it uses the "islamic-civil" tabular calendar. The epoch used is Gregorian 19 July 622 (Friday) i.e. July 16th, 622 CE in the Julian calendar (Julian day 1948439.5).|
|   islamic ❌| **ICU Calendar**. Non-Tabular islamic calendar (*buggy breaks at some years*). **<r>Not Recommended.</r>**|
|islamic-rgsa ❌| **ICU Calendar**. Saudi Arabia sighting (an alias that uses the islamic default calendar) [*contains bugs*]. **<r>Not Recommended.</r>**|

Both the 'islamic-civil' and 'islamic-tbla' use the same intercalary leap years [**2,5,7,10,13,16,18,21,24,26,29**] (*known as the al-Khwarizmi or al-Battani style (9th century)*); however, with different epoch and therefore differ by one (1) day, with the 'islamic-tbla' being one (1) day earlier than the 'islamic-civil'.

The author does not recommend the use of the ICU 'islamic' or the 'islamic-rgsa' calendars in any applications and not when using the Hijri-Week Calendar System, until such time the ICU implementation has been fixed.


However, it must be noted that the implementation of the Hijri-Week Calendar System supports **all** of the above Hijri Calendars with the default being **islamic-umalqura** if no particular calendar is specified.

#### Hijri Week and Weekdays

The Hijri Week is a seven (7) days week **starting on Saturday (day 1)** and ending on Friday (day 7). The weekday numbers are therefore: (1) Saturday, (2) Sunday, (3) Monday, (4) Tuesday, (5) Wednesday, (6) Thursday, and (7) Friday.

Compared to the ISO weekday numbers, the following is a summary with a method to convert the ISO weekday to the Hijri weekday:


|Weekday|Hijri Day Number|ISO Day Number|Add 2 to ISO|MOD 7|logical OR with 7|
| :---------------- |:------:|:------:|:------------:|:----:|:----:|
| Saturday |1|6|6+2 = 8|1|1|
| Sunday   |2|7|7+2 = 9|2|2|
| Monday   |3|1|1+2 = 3|3|3|
| Tuesday  |4|2|2+2 = 4|4|4|
| Wednesday|5|3|3+2 = 5|5|5|
| Thursday |6|4|4+2 = 6|6|6|
| Friday   |7|5|5+2 = 7|0|7|

The above can be achieved in javascript as follows:

```js
let hijriWeekDay = ((isoWeekDay + 2) % 7) || 7;
```

#### Week Numbering

A Hijri-Week year (Hijri-Week Calendar) has either 50 full weeks (a short year) or 51 full weeks (a long year). That is 350 days in the short years or 357 days in the long years instead of the usual 354 or 355 days.

#### <bl>Weeks Numbering Rule</b>

The rule for numbering the weeks in the Hijri-Week System is identical to the ISO 8601 system with a slight modification: "**<bl>The <u>first calendar week (Week 01) of the year</u> is that week which includes the <r>first Tuesday of that year</r>, and the <u>last calendar week of a calendar year</u> is the week immediately preceding the first calendar week of the next calendar year**".</bl>

The modification or variation from the ISO 8601 is that the middle day of the week is **Tuesday** rather than Thursday.

#### Formatting the Hijri-Week Date System

The Hijri-Week Date format follows exactly that of the ISO week-numbering year in the format **YYYY**, a week number in the format **ww** **(2 digits)** prefixed by the letter 'W', and the weekday number, and **one (1) digit** **d** from 1 through 7, beginning with Saturday and ending with Friday.

For example, the Hijri (Islamic) date **<g>Thursday, 15 Jumad II 1445</g>** corresponds to day number 6 in the week number 23 of 1445, and is written as **<bl>1445-W23-6</bl>** (in extended form) or **<bl>1445W236</bl>** (in compact form).


#### Designation between the normal Hijri Year and the Hijri-Week Year

When a year is written as a standalone number, the Hijri Year is normally designated by number like 1445 AH. However, the Hijri-Week Year is designated by adding the letter W to the end of the year; 1445W AH.

#### 4th Day of Muharram (4th Day of the start Hijri Year)

The 4th weekday is the middle of the Hijri Week being Tuesday. This is similar to the ISO Week where the 4th weekday is the middle of the week being Thursday (both calendar types have 7 days a week). On this basis, the 4th of the first month of the Hijri year (4th of Muharram) is considered the **<bl>First Week Pivot Day</bl>** as it is (similar to the ISO week 4th January day) and **<r>can only occur in the the first week (Week 01) and cannot occur in any other week.</r>**


The 4th day of Hijri month 1 (the month of “Muharram”) has the following properties:

- Can only occur in Week 01 of the Hijri-Week Year.
- Does not occur in any other week of the Hijri-Week Year.

<bl>*<u>Note</u>: The first day of the first week (Week 01) of the Hijri-Week Year can be determined by finding the weekday number that falls on the 4th Muharram of the particular Hijri year. Then, finding the first Saturday date that falls on or before that date which is the start date of Week 01.*</bl>

#### The Middle Weekday (Tuesday)

The middle weekday (Tuesday) has significant importance in the Hijri-Week Calendar system, and has the following properties:

- It is the middle day of every the Hijri Week.
- It is weekday number 4.
- The first Tuesday in the Hijri year always occurs in Week 01.
- The Last Tuesday of the ending Hijri Year always occurs in the last Week (Week N° 50 or 51).
- The date that falls on a Tuesday is always in the middle of a Week.
- Each Tuesday in a Hijri year belongs to the same Hijri-Week Year. Therefore, if a Hijri year contains 50 Tuesdays, then the corresponding Hijri-Week Year has 50 Weeks, and if a Hijri year contains 51 Tuesdays, then the corresponding Hijri-Week Year also has 51 Weeks.
- A day falls in the week that has the closest Tuesday to it. In other words, Wednesday, Thursday, and Friday fall in the week that has the previous Tuesday in it, while Saturday, Sunday, and Monday fall in the week that has the next Tuesday in it.

To obtain the location of the week for a given Hijri date, first find the location of the middle of the week (Tuesday) for that date. The following can be used (by subtracting 4 from the date's weekday number). Then add the offset to the weekday number of the date. Then calculate the day ordinal for the Tuesday which is the day of year for Tuesday counted from the start of the Hijri year. The ordinal number can then be divided by 7 and rounded up to an integer.

|Weekday  | day No.|offset to closest Tuesday|note|
|:----------------|:------:|:------:|:----|
|Saturday |1|+3 (4 - 1)|next Tue|
|Sunday   |2|+2 (4 - 2)|next Tue|
|Monday   |3|+1 (4 - 3)|next Tue|
|Tuesday  |4|0 (4 - 4)|
|Wednesday|5|-1 (4 -5)|previous Tue|
|Thursday |6|-2 (4 - 6)|previous Tue|
|Friday   |7|-3 (4 - 7)|previous Tue|


#### First Day of the Hijri Year

The first day of the Hijri year has the following properties:

- A Common Hijri Year that starts on Sat, Sun, Mon, or Tue (days 1, 2, 3, or 4) has **51 weeks** in the corresponding Hijri-Week Year; similarly, a common Hijri year that starts on Wed, Thu, or Fri (days 5, 6, or 7) has **50 weeks** in the corresponding Hijri-Week Year.

- A Leap Hijri Year that starts on Sat, Sun, Mon, Tue, or Fri (days 1, 2, 3, 4, or 7) has **51 weeks** in the corresponding Hijri-Week Year; similarly, a leap Hijri year that starts on Wed or Thu (days 5 or 6) has **50 weeks** in the corresponding Hijri-Week Year.

- If the following Hijri Year starts on Sun, Mon, or Tue (days 2-4) (or starting on Mon or Tue (days 3 or 4) in a leap year) then this year has 50 weeks, else it is 51 weeks.

#### The First Week (Week 01)

Week 01 of the Hijri-Week Year has the following properties:

- Always has the first Tuesday of the Hijri Year in it.
- Is the earliest week of the Hijri-Week Year that contains at least four (4) days in it.
- Can begin as early as 27/12 in a Year-Ending29 (i.e. if the Hijri year ends on 29/12).
- Can begin as early as 28/12 in a Year-Ending30 (i.e. if the Hijri year ends on 30/12).
- Ends as late as 4/1 of the following year.
- Has a minimum of 4 days in the starting year.

#### The Last Week (Week 50 or Week 51)

The last week of the Hijri Week year can be either week 50 or week 51, and has the following properties:

- Is the week before W01 of the next year.
- It has the year's last Tuesday in it.
- Its middle day, Tuesday, always falls in the ending year.
- Its last day is the Friday nearest to end of the last month of the previous year.
- Is the last week that contains at least four (4) days of the month with Dhu al-Hijja in it.

##### Week 50 has the following properties:

- Starts as early as 20/12 in a Year-Ending29.
- Starts as early as 21/12 in a Year-Ending30.
- Ends as late as 29/12 of the following year.
- Cannot extend to the following year.


##### Week 51 has the following properties:

- Starts as early as 23/12 in a Year-Ending29.
- Starts as early as 24/12 in a Year-Ending30.
- Ends as late as 3/1 of the following year.
- Has the middle weekday (Tue) always in the ending year.


#### The Last Tuesday of the Hijri Year

The last Tuesday of the Hijri Year fall on the last week of the Hijri-Week Year and has the following properties:

- Is also the last Tuesday of the the Hijri-Week Year;
- Falls on the last week of the Hijri-Week Year (Week 50 or Week 51).


#### The Last Day of the Hijri Year

The last day of the Hijri year (day 29/12 or day 30/12) has the following properties:

- Can be either day 29 or day 30 of the last month (month 12 “Dhu al-Ḥijjah”) irrespective whether the year is a common or a leap year.

- Can only be in Week 51 or Week 01 of the Hijri-Week Year; i.e. the last day of the year cannot occur in Week 50.

- A common Hijri Year ending on Tue, Wed, Thu, or Friday (days 4, 5, 6 or 7) (or ending on Sat, Tue, Wed, Thu, or Friday (days 1, 4, 5, 6, or 7) in a leap year) has a total of 51 weeks in the corresponding Hijri-Week Year.

- A common Hijri Year ending on Sat, Sun, or Mon (days 1, 2, or 3) (or ending on Sun or Mon (days 2 or 3) in a leap year) has a total of 50 weeks in the corresponding Hijri-Week Year.

#### The Last Week Pivot Day

The Last Week Pivot Day is that day occurring 3 days before the end of the Hijri year and has the following properties:

- Always falls on the last week of the Hijri-Week Year (either on week 50 or week 51).
- Is always 7 days before the 4th Muharram of the following year.
- Falls on 26/12 (26 of Dhu al-Ḥijjah) if the Hijri year ends on 29/12 (Year-Ending2).
- Falls on 27/12 (27 of Dhu al-Ḥijjah) if the Hijri year ends on 30/12 (Year-Ending30).

<bl>*<u>Note</u>: Because the Last Week Pivot Day always falls on the last week of the Hijri-Week Year, one can easily determine the total number of weeks for a given Hijri-Week Year by calculating the difference in days between the start of the Hijri Year and the Last Week Pivot Day for that Hijri Year (i.e. the ordinal day of the Last Week Pivot Day) and then dividing the result by 7 (rounding up 'ceiling' to full integer).*</bl>

#### Other Days in the First Month of the Hijri Year

- 4/1 only occurs in Week 01.
- 11/1 only occurs in Week 02.
- 18/1 only occurs in Week 03.
- 25/1 only occurs in Week 04.
- Days 1, 2, and 3 of the first month of the Hijri year (the month of Muharram) can only occur in either week 1 or week 51.

### Definitions

- Year-Ending30         : A Hijri Year that has the last month Dhu Al-Hijjah (month 12) with 30 days.
- Year-Ending29         : A Hijri Year that has the last month Dhu Al-Hijjah (month 12) with 29 days.
- First Week Pivot Day  : 4th Muarram (4/1).
- Last Week Pivot Day   : 3 days before Hijri Year End (26/12 or 27/12).
- Leap Hijri Year       : A Hijri Year with 355 days.
- Common Hijri Year     : A Hijri Year with 354 days.

#### Tables

##### 1. Example of Hijri Year Ending 30 days

The following table shows the distribution of the weeks at the start of a year where the ending Hijri year (previous year) ends with the last month having 30 days.

<bl>*<u>Note</u>: The year ending in 30 days could be a common year or a leap year.*</bl>

![Table10](./table01.jpg)

##### 2. Example of Hijri Year Ending 29 days

The following table shows the distribution of the weeks at the start of a year where the ending Hijri year (previous year) ends with the last month having 29 days.

<bl>*<u>Note</u>: The year ending in 29 days could be a common year or a leap year.*</bl>

![Table02](./table02.jpg)