#import "@preview/gloss-awe:0.0.5": *
#import "@preview/tablex:0.0.8": tablex, cellx

= Introduction

// Defining, how marked glossary entries in the document appear
#show figure.where(kind: "jkrb_glossary"): it => { it.body }

The #gls[Hijri week calendar] (HWC) is a leap week calendar system based on the fundamentals of the ISO 8601 date system.

The HWC specifies a week of year atop any of the compatible Hijri calendars by defining a notation for ordinal weeks of the #gls[year]. The system is a derivative of the used Hijri calendar and is a standard representation of the underlying Hijri calendar therefore shares the accuracy of the underlying Hijri calendar.

The HWC derives a a standard representation from compatible existing Hijri #gls[calendar date]s. The resulting #gls[Hijri week date] may be different depending on the underlying Hijri calendar used. Therefore, it is important to reference the #gls[Hijri calendar] with the HWC representation when in need of interportability.

Because the HWC is designed to work with many types of Hijri Calendars, implementers of the HWC may need to create seperate implementations for each Hijri calendar. This should not be seen as a limitation but rather as a versatile feature allowing the HWC to be used with any Hijri calendar that may be introduced in the future.

The HWC and its rules are not limited to just the tabular varieties of Hijri calendars. This includes compatibility with calendars such as the Umm al-Qura calendar. For more information on non-compatible Hijri calendars, see @compatible-calendars.

// The week numbering scheme of the Hijri-Week Calendar System introduced in this document closely follows that introduced by the ISO 8601 with minor deviations which are specific to the nature of the Hijri calendars.

// The Hijri-Week Calendar System corresponds with the Hijri (Islamic) calendar and uses the same year number but its length is defined to be an integral number of weeks rather than months; its beginning can deviate up to a few days from 1 Muharram (the start of the Hijri year) and its end likewise can deviate up to a few days from the end of the Hijri year. On average, however, it remains in step with the Hijri calendar.

#set page(margin: auto)
#set quote(quotes: false, block: true)


= Scope

This document does not adress lunar based calendars other then Hijri (Islamic) ones nor does it address lunisolar calendars or hijri calendars that are based on sighting.

The system defined in this document covers both tabular and non-tabular Hijri calendars.


= Terms and Definitions

#include "terms.typ"



= Basics of The Hijri Calendar

The Hijri calendar is a purely lunar calendar based on the phases of the moon. It comprises 12 months, each of either 29 or 30 days, resulting in a Hijri year of either 354 days (#gls[common year]) or 355 days (#gls[leap year]). This discrepancy arises because the lunar month alternates between 29 and 30 days, and a typical lunar year is about 11 days shorter than a solar year.

Traditionally, the start of a new day in the Hijri calendar begins after sunset. However, for practical reasons and especially in modern digital implementations, midnight is often used as the start of a new day. This adaptation is mainly for convenience and to align with the globally accepted standard of midnight as the beginning of a calendar day.

A leap year in the Hijri calendar has 355 days. There is no specific month that determines if a year is a leap year. This distinction is crucial as the additional day in a leap year can be placed in any of the 29-day months.

However, tabular-based Hijri calendars consist of 12 alternating months of 30 and 29 days (30 days for odd months and 29 days for even months), with the final 29-day month (month 12, Thul-Hijja) extended to 30 days during leap Hijri years making it the month that determines if a year is leap.

// <r>However, it **<r>must not** be assumed that the final month (month 12) being 30 days represents a leap-year in all Hijri Calendars because non-tabular calendars such as Um Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29 day months.</r>

== Types of Hijri Calendars

The Hijri calendar, with its lunar foundation and religious significance, exhibits diverse methodologies in its interpretation and application. These methodologies, varying in their reliance on observational techniques or mathematical calculations, have led to the development of distinct types of Hijri calendars. Each type caters to specific needs, ranging from the precise determination of religious observances to the use in administrative and digital systems. This section categorizes the Hijri calendars into two main categories: Sight-Based, Algorithmic, with further subdivisions into Astronomical, Tabular and Arithmetical under Algorithmic, providing a structured overview of their unique characteristics and methodologies.

=== Observational

The observational Hijri calendar is anchored in the traditional practice of visually sighting the new moon to determine the commencement of each month, which, in turn, establishes the length of the year. This method holds profound religious significance and remains prevalent in many Muslim countries today. Its adherence to the moon's phases ensures its close alignment with Islamic rituals and festivities.

However, the observational calendar is inherently location-specific, leading to potential variations in the start of the month across different regions. The reliance on moon sighting introduces a degree of unpredictability, making it challenging to forecast future dates with precision. As a result, while it is deeply integrated into religious observances, its application for administrative and day-to-day planning purposes is limited. The calendar's lack of uniformity and the difficulty in predicting long-term dates necessitate alternative systems for civil and formal scheduling needs.

=== Algorithmic

In response to the need for precise and reliable long-term scheduling, algorithmic calendars have been developed. Unlike traditional calendars that rely on the visual sighting of the moon, these calendars are based on a specific set of deterministic rules. The predictability and consistency of these rule-based systems make them particularly suited for administrative and civil purposes, as well as for ensuring uniformity in global communications and operations. Algorithmic calendars effectively align the lunar cycle with standardized calculations, offering a practical solution for managing time in various professional and international contexts. 

==== Tabular

Tabular Hijri calendars employ a systematic arrangement of months, alternating between 30 and 29 days. Specifically, odd-numbered months consist of 30 days, while even-numbered months have 29 days. Leap years introduce a modification to this pattern by extending the final (12th) month from 29 to 30 days, adjusting the yearly total to 355 days.

The structure of Tabular Hijri calendars is cyclical, encompassing a 30-year period. Within this cycle, there are 19 common years, each with a duration of 354 days, and 11 leap years, each lasting 355 days. The aggregate of days over the entire cycle amounts to 10,631. The allocation of leap years is methodical, adhering to one of four distinct schemas:

#tablex(
  columns: 2,
  [Type],[Intercalary years with 355 days inserted at year No],
  [Type I],[2, 5, 7, 10, 13, #text(red, weight: "bold")[15], 18, 21, 24, 26, 29],
  [Type II], [2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29],
  [Type III], [2, 5, 8, 10, 13, 16, 19, 21, 24, #text(blue, weight: "bold")[27], 29],
  [Type IV], [2, 5, 8, #text(orange, weight: "bold")[11], 13, 16, 19, 21, 24, 27, #text(orange, weight: "bold")[30]]
)

Among these, Type II is most prevalent and is the exclusive choice in the context of the International Components for Unicode (ICU). Specifically, ICU employs the Type II schema for its #text(style: "italic")[islamic-civil] and #text(style: "italic")[islamic-tbla] calendars, though each calendar operates on its distinct epoch, differentiating their respective computations and applications.

In terms of temporal precision, the Tabular Hijri calendar exhibits a mean year length of 354.366667 days and an average month duration of 29.530555 days. These figures closely mirror the synodic month, which spans 29.530588853 days, leading to a marginal deviation of roughly 0.000033298 day per month. Over an extended timeframe, this discrepancy results in a one-day shift relative to the lunar cycle every approximately 2,570 Hijri years.

==== Astronomical

Astronomical Hijri calendars are based on precise calculations of lunar positions and phases, These calendars determine the start of each month by calculating the actual lunar phases, specifically the conjunction (the moment when the Moon is directly between the Earth and the Sun) and the moonset after sunset at a specific location. 

These systems utilize astronomical data to predict the start of each lunar month, aligning the calendar with the moon's cycles in a systematic and location-specific manner.

*Key Characteristics of Astronomical Hijri Calendars:*

- *Conjunction-Based Initiation:* The commencement of each month is determined by the calculated time of the lunar conjunction, the point at which the Moon and the Sun align as viewed from Earth.

- *Location-Specific Calculations:* The calendar's calculations are tailored to the conditions of moon visibility at a particular geographic location, ensuring the calendar's alignment with local observational parameters.

- *Consistency and Precision:* These calendars offer a uniform structure, avoiding the variability inherent in direct moon sighting. Their reliance on precise astronomical data makes them particularly suited for civil and official use where consistency is key.

Astronomical Hijri calendars provide a standardized approach to aligning with the lunar cycle, merging traditional lunar timing with exact astronomical calculations to establish a reliable framework for civil dates and official planning.


The Umm al-Qura calendar or #text(style: "italic")[islamic-umalqura] under the ICU, which is used as the civil calendar in Saudi Arabia, exemplifies this approach. Its calculations are based on the moon's conjunction and visibility criteria specific to Makkah. However, it's important to note that this calendar, while influential in civil contexts, is not used for determining religious observances that require actual moon sighting, such as the start of Ramadan or the Hajj dates.

==== Arithmetical

Arithmetical Hijri calendars calculate Hijri dates using predetermined arithmetic rules to systematically convert dates from established calendar systems, like the Gregorian calendar. These calendars are not reliant on lunar observations but on fixed arithmetic formulas to ensure consistent and predictable date management across different systems.

An instance of an Arithmetical Hijri calendar is the #text(style: "italic")[islamic] calendar as implemented in the ICU. While this calendar provides a structured and algorithmic approach to converting Gregorian dates to Hijri dates, the implementation has certain limitations:

*Ad-hoc Conversion Method:* The algorithm uses a rough estimation method, which is primarily effective within a specific range of years. It is noted in the implementation that this method is roughly accurate for Gregorian years 1846-2138, with known accuracy issues outside this range.

// source: https://github.com/unicode-org/icu/blob/main/icu4c/source/i18n/islamcal.cpp#L572

*Error Rate:* The conversion process is a rough estimate that works for gregorian years in the range of 1846-2138. Otherwise, it produces an error rate estimated at about 3% of years outside that range.

*Implementation Limitations:* The code includes specific limitations, such as inaccurate handling of negative years and months potentially having up to 31 days, which deviates from the actual lunar month length making it incompatible with HWC.

// source: https://github.com/unicode-org/icu/blob/main/icu4c/source/i18n/islamcal.cpp#L229


== Compatibel Calendars <compatible-calendars>

The International Components for Unicode (ICU) defines five Hijri calendars, each with unique characteristics and applications. Below is a detailed breakdown of these calendars and their compatibility with the new Hijri Week Calendar system

#tablex(
  columns: 4,
  [Calendar], [Compatibility], [Type], [Notes],
  
  [islamic-civil], [Compatible], [Tabular calendar], [ The 'islamic-civil' calendar uses a tabular format with leap years [*2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29*] and a Friday epoch. Also known as "islamic-tblc" or 'islamicc', it sets its epoch to 19 July 622 Gregorian (16 July 622 CE Julian, Julian day 1948439.5).],

[islamic-tbla], [Compatible], [Tabular calendar], [ The 'islamic-tbla' calendar follows a tabular format with leap years [*2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29*] and a Thursday epoch. Known as Microsoft Hijri (Kuwaiti) calendar, it's used in the .NET Framework's HijriCalendar Class. Its epoch is 18 July 622 Gregorian (15 July 622 CE Julian, Julian day 1948438.5).],

[islamic-umalqura], [Compatible], [Astronomical calendar], [ The 'islamic-umalqura' calendar, used in Saudi Arabia, combines moon sighting and astronomical predictions for 1300-1600 AH. Outside this range, it follows the 'islamic-civil' tabular format with leap years [*2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29*]. Its epoch is set to 19 July 622 in the Gregorian calendar (Julian day 1948439.5).],

[islamic], [Not Compatible], [Arethmitical calendar], [ Known implementation issues, with inaccuracies in some years.],

[islamic-rgsa], [Not Compatible], [Arethmitical calendar], [Requested by Oracle thsi calendar was intended to mimic sighting calendar for Saudi Arabia. The implementation was never realized and is now an alias for the 'islamic' calendar hence contains the same issues.]
)

=== Recommendation and Note

// TODO: make the ICU names italic

The 'islamic-civil' and 'islamic-tbla' calendars both adhere to the same intercalary leap year sequence *[2,5,7,10,13,16,18,21,24,26,29]*, following the al-Khwarizmi/al-Battani method from the 9th century CE. However, they diverge by one day due to different epochs, with 'islamic-tbla' being a day earlier than 'islamic-civil'.

Usage of 'islamic' and 'islamic-rgsa' calendars from ICU is not recommended for any application not only when using the HWC, until such time the ICU implementation has been fixed.

= Structural elements of Hijri Week calendar

The following sections defines the structural elements and foundational constructs of the Hijri Week Calendar. This calendar system, is comprised of various components and rules that collectively define its operational framework.

== Hijri Week and Weekdays

The Hijri calendar defines a week as a cycle of seven days. This cycle commences on Saturday, designated as day 1, and concludes on Friday, marked as day 7. Accordingly, the weekdays are numerically represented as follows: Saturday (1), Sunday (2), Monday (3), Tuesday (4), Wednesday (5), Thursday (6), and Friday (7).

This structure presents a variation from the ISO standard, where the week starts on Monday (day 1) and ends on Sunday (day 7).

The conversion from ISO weekday numbering to Hijri weekday numbering involves a simple arithmetic transformation followed by a conditional adjustment to align the start and end of the week with Hijri calendar conventions. The process is as follows:

+ *Addition:* Begin by adding 2 to the ISO weekday number. This step shifts the start of the week from Monday (ISO) to Saturday (Hijri).

+ *Modulo Operation:* Apply the modulo operation with 7 to the result of the addition. This operation ensures that the resulting numbers stay within the range of 1 to 7, corresponding to the days of the week.

+ *Adjustment for Friday:* Since the modulo operation maps Friday to 0 (due to the addition in step 1), a final adjustment is necessary. If the result of the modulo operation is 0, it is replaced with 7 to correctly represent Friday as the last day of the Hijri week.

This methodical approach effectively recalibrates the ISO weekday numbering to align with the Hijri calendar's structure, ensuring that each day of the week is accurately represented in the context of the Hijri Week Calendar.

The followin table outlines the relationship between Hijri and ISO weekday numbering systems.

#tablex(
  columns: 6,
  [Weekday], [Hijri Day Number], [ISO Day Number], [Add 2 to ISO], [MOD 7], [logical OR with 7],
  [Saturday], [1], [6], [6+2 = 8], [1], [1],
  [Sunday], [2], [7], [7+2 = 9], [2], [2],
  [Monday], [3], [1], [1+2 = 3], [3], [3],
  [Tuesday], [4], [2], [2+2 = 4], [4], [4],
  [Wednesday], [5], [3], [3+2 = 5], [5], [5],
  [Thursday], [6], [4], [4+2 = 6], [6], [6],
  [Friday], [7], [5], [5+2 = 7], [0], [7]
)

== Week Numbering

In the Hijri week calendar system, a year is categorized as either 'short' or 'long' based on the total count of weeks it comprises. Specifically:

- A short year consists of 50 full weeks, summing up to 350 days.
- A long year encompasses 51 full weeks, totaling 357 days.

This structure contrasts with the typical Hijri year, which generally spans 354 or 355 days. The delineation into short and long years is instrumental for maintaining temporal alignment within the Hijri-Week Calendar system, accommodating variations in the lunar cycle over extended periods.

== Weeks Numbering Rules

The Hijri week calendar system adopts a week numbering methodology equivalant to the ISO 8601 standard, with a pivotal modification centered around the definition of the first and last calendar weeks of the year. The rules are as follows:

- *First calendar week (Week 01):* This is defined as the week that encompasses the first Tuesday of the Hijri year. It marks the commencement of the Hijri-week-year and its week numbering sequence.
- *Last calendar week:* This is the week immediately preceding the first calendar week of the subsequent Hijri-week-year, effectively closing the Hijri-week-year week numbering sequence.

The primary distinction from the ISO 8601 standard lies in the selection of the central day of the week. While ISO 8601 considers Thursday as the middle day, the Hijri week calendar system designates *Tuesday* as the pivotal day around which week boundaries are determined.

This adjustment ensures that each Hijri week calendar year aligns consistently with the characteristic of the temporal structure of the Hijri calendar, honoring its unique cultural and religious context.

// we chose tuesday because weeks should start on saturday
// weeks should start on satruday beacuse of relegious conciderations (friday last day)

== Formatting the Hijri-Week Date System

In the Hijri week calendar, dates are structured to ensure clarity and standardization, closely paralleling the format utilized by the ISO week-numbering system. The format components are as follows:

- *Year (YYYY):* The calendar year is denoted with four digits.
- *Week Number (ww):* This is a two-digit representation of the week within the year, ranging from 01 to 50/51, depending on the year's length (short or long). It is prefixed by the letter 'W' to denote the week number.
- *Weekday Number (d):* This is a single digit ranging from 1 to 7, starting with Saturday as 1 and concluding with Friday as 7.

Hence, a complete Hijri week date is represented in the extended format as YYYY-Www-d. For more compact communication, the date can be condensed into the format YYYYWwwd.

For instance, the Hijri (Islamic) date *Thursday, 15 Jumad II 1445* translates to the 6th day (Thursday) of the 23rd week in the year 1445. This date is formally expressed in the extended format as *1445-W23-6* and in the compact format as *1445W236*.

== Disambiguating Hijri Year from Hijri-Week Year <disambiguating-Hijri-Year-from-Hijri-Week-Year>

In the context of date notation, it's essential to distinguish clearly between the Hijri year and the Hijri week year, as they represent different temporal frameworks. The convention for this distinction is as follows:

- *Hijri year:* Denoted as a numerical year followed by the suffix 'AH' (Anno Hegirae), indicating the traditional lunar Hijri calendar year. For example, the year 1445 in the Hijri calendar is expressed as *1445 AH*.
- *Hijri week year:* Similar to the Hijri Year but differentiated by appending a 'W' before the 'AH' suffix. This signifies adherence to the Hijri week calendar system. Thus, the Hijri week year corresponding to 1445 AH would be denoted as *1445W AH*.

This notation ensures unambiguous communication by clearly demarcating the conventional Hijri calendar from the Hijri week calednar system.

== Significance of Muharram's 4th Day in Week Numbering

Within the Hijri week calendar, the 4th weekday, being Tuesday, holds a central position, akin to Thursday in the ISO Week. This alignment underscores the symmetry in the structure of both calendars, each spanning seven days per week. Specifically, the 4th day of Muharram, marking the start of the Hijri year, is designated as the #text(weight: "bold")[#gls[first week pivot day]]. This pivotal day bears resemblance to the 4th of January in the ISO calendar, delineating a key temporal marker with the following characteristics:

- *Week 01 Exclusivity:* It exclusively falls within the first week (Week 01) of the Hijri-Week Year, mirroring the structural initiation point of the year.
- *Uniqueness:* This day does not manifest in any other week, ensuring its role as a singular reference point for the onset of the annual cycle.

*Note on Week 01 Initiation:* To ascertain the commencement of Week 01 in any given Hijri-Week Year, one identifies the weekday corresponding to the 4th of Muharram. Subsequently, the nearest preceding Saturday is determined, marking the start date of Week 01.

== Tuesday's Pivotal Role in Week Number Calculation

// This section is for us to know the week number. previously named The Middle Weekday (Tuesday)

Tuesday, as the central day of the week, assumes a significant role within the Hijri-Week Calendar system, characterized by the following attributes:

- It invariably represents the mid-point of the Hijri Week.
- It is designated as weekday number 4.
- The initial Tuesday of the Hijri year invariably falls within Week 01.
- The concluding Tuesday of a given Hijri year falls within the final week, either Week 50 or Week 51.
- Dates falling on a Tuesday are always positioned in the middle of a week.
- Each Tuesday within a Hijri year is part of the corresponding Hijri-Week Year. Consequently, a Hijri year comprising 50 Tuesdays equates to a Hijri-Week Year with 50 weeks; similarly, 51 Tuesdays correspond to a Hijri-Week Year with 51 weeks.
- The allocation of days to weeks is guided by proximity to Tuesday. Specifically, Wednesday, Thursday, and Friday are grouped with the preceding Tuesday, while Saturday, Sunday, and Monday align with the succeeding Tuesday.

To pinpoint the specific week for a given Hijri date, one should first locate the nearest Tuesday to that date. This is achieved by adjusting the date's weekday number by subtracting the weekday number from 4, and then adding the resultant offset to the weekday number of the date. Next, determine the yearly #gls[ordinal date] for that Tuesday, counting from the start of the Hijri year. Dividing this ordinal number by 7 and rounding up yields the week number.

#tablex(
  columns: 4,
  [Weekday], [Weekday No], [Offset to Closest Tuesday (4 - Weekday No)], [Note],
  [Saturday], [1], [+3 ], [Next Tuesday],
  [Sunday], [2], [+2], [Next Tuesday],
  [Monday], [3], [+1], [Next Tuesday],
  [Tuesday], [4], [0], [],
  [Wednesday], [5], [-1 ], [Previous Tuesday],
  [Thursday], [6], [-2], [Previous Tuesday],
  [Friday], [7], [-3], [Previous Tuesday]
)

*Example:*

Let's take the date: Wedensday 18 Shaʿbān 1445 AH using Ummu al-Qura
based on the table the shift is -1
so the new date is: Tueday 17 Shaʿbān 1445 AH
in this case the yearly ordinal date for Tueday 17 Shaʿbān 1445 AH is: 229
now the week number is: 229 / 7 ≈ 33

this means that Wedensday 18 Shaʿbān occurs on the 33rd week of 1445 AH according to Ummu al-Qura


== Hijri-Year Commencements and Its Length

// this section is for us to know the total weeks in a hijri year and the one after it. previously named First Day of the Hijri Year

The first day of the Hijri year directly determines the number of weeks in the corresponding Hijri-Week Year. The week count varies based on whether it's a common or leap year and the weekday of the year's first day:

*Common Hijri Year:*

- Starts on Sat, Sun, Mon, or Tue (days 1-4): Results in 51 weeks.
- Starts on Wed, Thu, or Fri (days 5-7): Results in 50 weeks.

*Leap Hijri Year:*

- Starts on Sat, Sun, Mon, Tue, or Fri (days 1-4, 7): Results in 51 weeks.
- Starts on Wed or Thu (days 5-6): Results in 50 weeks.

*Next Year's Start:*

- If the next Hijri Year begins on Sun, Mon, or Tue (days 2-4) (or on Mon or Tue in a leap year), the current year will have 50 weeks. Otherwise, it will have 51 weeks.

The starting day of the Hijri Year is critical for defining the total weeks in the Hijri-Week Year, aligning with the Hijri lunar calendar's structure.

== Characteristics of The First Week (Week 01)

The First Week (Week 01) of the Hijri-Week Year is characterized by specific temporal properties that establish its position and duration within the calendar system. These properties are:

- *Inclusion of the First Tuesday:* Week 01 invariably encompasses the first Tuesday of the Hijri Year, marking it as a significant week.
- *Minimum Duration:* This week is the earliest in the Hijri-Week Year that contains at least four days, aligning with the structural requirements of the calendar.
- *Commencement Date Variability:* Depending on the year's structure:
  - For a year ending on the 29th of Dhu al-Hijja (#gls[year-ending-29]), Week 01 can start as early as the 27th of Dhu al-Hijja of the preceding Hijri year.
  - For a year concluding on the 30th of Dhu al-Hijja (#gls[year-ending-30]), this week can commence as early as the 28th of Dhu al-Hijja of the preceding Hijri year.
- *Latest Conclusion Date:* The week can extends up to the 4th of Muharram of the subsequent Hijri year.
- *Guaranteed Span:* Regardless of the starting point, Week 01 always spans a minimum of four days within the starting Hijri year.

These characteristics ensure that Week 01 serves as a foundational segment in the Hijri-Week Year, establishing the framework for subsequent weeks and their numbering.


== Concluding Week Dynamics: Week 50 or 51

The #link(<disambiguating-Hijri-Year-from-Hijri-Week-Year>)[Hijri week year] concludes with either Week 50 or Week 51. This final week plays a key role in bridging the transition between years and has a number of characteristics:

- *Preceding Week 01:* This week directly precedes Week 01 of the succeeding Hijri-Week Year.
- *Inclusion of the Last Tuesday:* The year's final Tuesday is always within this week, marking its significance.
- *Tuesday's Position:* The middle day of this week, Tuesday, consistently occurs in the ending year, ensuring alignment with the weekly structure.
- *Conclusion on Friday:* The week terminates on the Friday that is closest to the conclusion of the last month of the preceding year.
- *Dhu al-Hijja Presence:* At least four days of this week fall within the month of Dhu al-Hijja, marking the end of the lunar year.

*Characteristics of Week 50:*

- Commencement may be as early as the 20th of Dhu al-Hijja (year-ending-29) or the 21st of Dhu al-Hijja (year-ending-30).
- The latest it can conclude is the 29th of Dhu al-Hijja of the same year, not extending into the following year.

*Characteristics of Week 51:*

- It may start as early as the 23rd of Dhu al-Hijja (year-ending-29) or the 24th of Dhu al-Hijja (year-ending-30).
- The final day can be as late as the 3rd of Muharram of the subsequent Hijri year.
- The central weekday, Tuesday, is always within the concluding Hijri year, maintaining consistency with the week's structure.

== Characteristics of the Final Tuesday in Hijri-Week Year

The Last Tuesday of the Hijri Year invariably aligns with the final week of the Hijri-Week Year, either Week 50 or Week 51. This day is characterized by the following properties:

- It marks the conclusion of Tuesdays in both the Hijri Year and the Hijri-Week Year.
- It occurs during the ultimate week of the Hijri-Week Year, which is designated as Week 50 or Week 51.

These attributes establish the Last Tuesday as a significant temporal marker within the Hijri-Week calendar system, delineating the transition between annual cycles.

== Final Day's Placement in the Hijri-Week Year

The Last Day of the Hijri Year, either the 29th or 30th of Dhu al-Hijja, delineates the year's end with distinct features:

- The date falls on either the 29th or the 30th of the 12th month (Dhu al-Hijja), regardless of it being a common or leap year.
- It is positioned within Week 51 or Week 01 of the Hijri-Week Year. It does not occur in Week 50.
- For common years concluding on a Tuesday, Wednesday, Thursday, or Friday (days 4, 5, 6, or 7), or for leap years ending on a Saturday, Tuesday, Wednesday, Thursday, or Friday (days 1, 4, 5, 6, or 7), the Hijri-Week Year comprises 51 weeks.
- Conversely, for common years ending on a Saturday, Sunday, or Monday (days 1, 2, or 3), or for leap years concluding on a Sunday or Monday (days 2 or 3), the Hijri-Week Year contains 50 weeks.


== Properties of the Last Week Pivot Day

The #gls[last week pivot day] marks a critical reference point in the Hijri-Week Calendar, occurring three days prior to the year's conclusion. Its characteristics are as follows:

- It consistently occurs during the final week of the Hijri-Week Year, either Week 50 or Week 51.
- It is precisely seven days prior to the 4th of Muharram in the subsequent year.
- If the Hijri year concludes on the 29th of Dhu al-Hijja (year-ending-29), the Last Week Pivot Day falls on the 26th of Dhu al-Hijja (26th of Dhu al-Hijja).
- If the Hijri year ends on the 30th of Dhu al-Hijja (year-ending-30), this day is observed on the 27th of Dhu al-Hijja (27th of Dhu al-Hijja).

*Note:* The Last Week Pivot Day's occurrence within the final week of the Hijri-Week Year facilitates the determination of the total number of weeks in that year. This can be achieved by calculating the difference in days between the start of the Hijri Year and the Last Week Pivot Day, then dividing this number by 7 and applying a ceiling function to round up to the nearest whole number.

// = Other Days in the First Month of the Hijri Year
== Week Allocation for Initial Days of Muharram

The initial days of Muharram, the first month of the Hijri Year, have a structured and predictable placement within the Hijri-Week Calendar:

- The 4th of Muharram invariably falls in Week 01.
- The 11th of Muharram invariably falls in Week 02.
- The 18th of Muharram invariably falls in Week 03.
- The 25th of Muharram invariably falls in Week 04.
- The 1st, 2nd, and 3rd of Muharram are confined to either Week 01 or the preceding Week 51, depending on the year's structure.

= Tables

== Example of Hijri Year Ending 30 days

#figure(
  image("images/table-01.jpg", width: 80%),
  caption: [
    Distribution of the weeks at the start of a year where the ending Hijri year (previous year) ends with the last month having 30 days.
  ],
)

*Note*: it must not be assumed that the final month (month 12) being 30 days represents a leap-year in all Hijri Calendars because non-tabular calendars such as Um Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29 day months 

== Example of Hijri Year Ending 29 days

#figure(
  image("images/table-02.jpg", width: 80%),
  caption: [
     Distribution of the weeks at the start of a year where the ending Hijri year (previous year) ends with the last month having 29 days.
  ],
)

*Note*: The year ending with a 29 days month could be a common year or a leap year as non-tabular calendars such as Um Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29 day months

