#import "@preview/outrageous:0.1.0"
#import "@preview/note-me:0.2.1": *

#let gnote(text) = admonition(
  title: "Note",
  color: color.green.darken(40%))[#text]

// Quotes use single quote
= Introduction

The Hijri week calendar (HWC) is a leap week date system based on the fundamentals of the ISO 8601 week date system.

The HWC specifies a week of year atop any of the compatible Hijri calendars by defining a notation for ordinal weeks of the year. The HWC is a standard representation of the underlying Hijri calendar and therefore shares the accuracy of the underlying Hijri calendar. The resulting Hijri week date may be different depending on the underlying Hijri calendar used. Therefore, it is important to reference the underlying Hijri calendar with the HWC representation when in need of interoperability.

Because the HWC is designed to work with many types of Hijri calendars, implementers of the HWC may need to create seperate implementations for each Hijri calendar. This should not be seen as a limitation but rather as a versatile feature allowing the HWC to be used with any Hijri calendar that may be introduced in the future.

The HWC and its rules are not limited to just the tabular varieties of Hijri calendars. This includes compatibility with calendars such as the Umm Al-Qura calendar. For more information on compatible and non-compatible Hijri calendars. See @compatible-calendars.

// The week numbering scheme of the Hijri-Week Calendar System introduced in this document closely follows that introduced by the ISO 8601 with minor deviations which are specific to the nature of the Hijri calendars.

// The Hijri-Week Calendar System corresponds with the Hijri (Islamic) calendar and uses the same year number but its length is defined to be an integral number of weeks rather than months; its beginning can deviate up to a few days from 1 Muharram (the start of the Hijri year) and its end likewise can deviate up to a few days from the end of the Hijri year. On average, however, it remains in step with the Hijri calendar.

#set page(margin: auto)
#set outline(indent: auto)
#page()[
  #show outline.entry: outrageous.show-entry
  #outline()
]

= Scope

This document does not address lunar based calendars other than Hijri (Islamic) ones nor does it address lunisolar calendars or Hijri calendars that are based on sighting.

The system defined in this document covers both tabular and non-tabular Hijri calendars.


= Terms and Definitions

#include "terms.typ"



= Introduction to the Hijri Calendar

The Hijri calendar is a purely lunar calendar based on the phases of the moon. It comprises 12 months, each of either 29 or 30 days, resulting in a Hijri year of either 354 days (common year) or 355 days (leap year). This discrepancy arises because a lunar month alternates between 29 and 30 days. A typical Hijri  year is about 11 days shorter than a Gregorian year.

The start of a new day in the Hijri calendar begins after sunset. However, for practical reasons and especially in modern digital implementations, midnight is often used as the start of a new day. This adaptation is mainly for convenience and to align with the globally accepted standard of midnight as the beginning of a calendar day.

A leap year in the Hijri calendar has 355 days. There is no specific month that determines if a year is a leap year. This distinction is crucial as the additional day in a leap year can be placed in any of the 29-day months. However, tabular-based Hijri calendars consist of 12 alternating months of 30 and 29 days (30 days for odd months and 29 days for even months), with the final 29-day month (month 12, Dhu al-Hijja) extended to 30 days during leap Hijri years making it the month that determines if a year is leap.

== Types of Hijri Calendars

The Hijri calendar, with its lunar foundation and religious significance, exhibits diverse methodologies in its interpretation and application. These methodologies, varying in their reliance on observational techniques or mathematical calculations, have led to the development of distinct types of Hijri calendars. Each type caters to specific needs, ranging from the precise determination of religious observances to the use in administrative and digital systems. This section categorizes Hijri calendars into two main categories: Sighting-based, and Algorithmic; the latter is further categorized into Astronomical, Tabular and Arithmetical.

=== Sighting-based

Sighting-based Hijri calendars are anchored in the traditional practice of sighting the new moon to determine the commencement of each month, which, in turn, establishes the length of the year. This method holds profound religious significance and remains prevalent in many Muslim countries today to determine Islamic rites and festivities.

However, sigting-based calendars are inherently location-specific, leading to potential variations in the start of the month across different regions. The reliance on moon sighting introduces a degree of unpredictability, making it challenging to forecast future dates with precision. As a result, while it is deeply integrated into religious observances, its application for administrative and day-to-day planning purposes is limited. The calendars' lack of uniformity and the difficulty in predicting long-term dates necessitate alternative systems for civil and formal scheduling needs.

=== Algorithmic

In response to the need for precise and reliable long-term scheduling, algorithmic calendars were developed. Unlike sighting-based calendars, these calendars are based on a specific set of deterministic rules. The predictability and consistency of these rule-based systems make them particularly suited for administrative and civil purposes, as well as for ensuring uniformity in global communications and operations. Algorithmic calendars effectively align the lunar cycle with standardized calculations, offering a practical solution for managing time in various professional and international contexts. 

==== Tabular

Tabular Hijri calendars employ a systematic arrangement of months, alternating between 30 and 29 days. Specifically, odd-numbered months consist of 30 days, while even-numbered months have 29 days. Leap years introduce a modification to this pattern by extending the final month (12th month) from 29 to 30 days, adjusting the yearly total to 355 days.

The structure of Tabular Hijri calendars is cyclical, encompassing a 30-year period. Within this cycle, there are 19 common years, each with a duration of 354 days, and 11 leap years, each lasting 355 days. The aggregate of days over the entire cycle amounts to 10,631. The allocation of leap years is methodical, adhering to one of four distinct schemas:

#figure(
table(
  columns: 2,
  [Type],[Intercalary years with 355 days \ inserted at year Nos.],
  [Type I],[2, 5, 7, 10, 13, #text(red, weight: "bold")[15], 18, 21, 24, 26, 29],
  [Type II], [2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29],
  [Type III], [2, 5, 8, 10, 13, 16, 19, 21, 24, #text(blue, weight: "bold")[27], 29],
  [Type IV], [2, 5, 8, #text(orange, weight: "bold")[11], 13, 16, 19, 21, 24, 27, #text(orange, weight: "bold")[30]],
))

#gnote[
The highlighted years in each schema signifies the difference of each schema relative to Type II.
]

Among these, Type II is most prevalent and is the exclusive choice in the context of the International Components for Unicode (ICU). Specifically, ICU employs the Type II schema for its #text(style: "italic")[islamic-civil] and #text(style: "italic")[islamic-tbla] calendars, though each calendar operates on its distinct epoch, differentiating their respective computations and applications.

In terms of temporal precision, the Tabular Hijri calendar exhibits a mean year length of 354.366667 days and an average month duration of 29.530555 days. These figures closely mirror the synodic month, which spans 29.530588853 days, leading to a marginal deviation of roughly 0.000033298 day per month. Over an extended timeframe, this discrepancy results in a one-day shift relative to the lunar cycle approximately every 2,570 Hijri years.

==== Astronomical

Astronomical Hijri calendars determine the start of each month based on precise calculations of the lunar phases, specifically the conjunction (the moment when the moon is directly between the earth and the sun) and the moonset after sunset at a specific location.

These calendars utilize astronomical data to predict the start of each lunar month, aligning the calendar with the moon's cycles in a systematic and location-specific way.

*Key Characteristics of Astronomical Hijri Calendars:*


- *Conjunction-based Initiation:* The start of each month in the Astronomical Hijri calendar is determined by the precise calculation of the lunar conjunction. This is the moment when the moon and the sun are exactly aligned as viewed from Earth.

- *Location-specific Calculations:* The calendar's calculations are tailored to the conditions of moon visibility at a particular geographic location, ensuring the calendar's alignment with local observational parameters.

- *Consistency and Precision:* These calendars offer a uniform structure, avoiding the variability inherent in direct moon sighting. Their reliance on precise astronomical data makes them particularly suited for civil and administrative use where consistency is key.

Astronomical Hijri calendars provide a standardized approach to aligning with the lunar cycle, merging traditional lunar timing with exact astronomical calculations to establish a reliable framework for civil dates and administrative planning.


The Umm Al-Qura calendar or #text(style: "italic")[islamic-umalqura] as per the ICU, which is used as the civil calendar in Saudi Arabia, exemplifies this approach. Its calculations are based on the moon's conjunction and visibility criteria specific to Makkah. However, it's important to note that this calendar, while influential in civil contexts, is not used for determining religious observances that require actual moon sighting, such as the start of Ramadan or the Hajj dates.

==== Arithmetical

Arithmetical Hijri calendars calculate Hijri dates using predetermined arithmetic rules to systematically convert dates from established calendar systems such as the Gregorian calendar. These calendars are not reliant on lunar observations but on fixed arithmetic formulas to ensure consistent and predictable date management.

An instance of an arithmetical Hijri calendar is the #text(style: "italic")[islamic] calendar as implemented by the ICU. While this calendar provides a structured and algorithmic approach to converting Gregorian dates to Hijri dates, the implementation has certain limitations:

*Bounded accuracy:* The algorithm uses a rough estimation method, which is primarily effective within a specific range of years. It is noted in the implementation that this method is roughly accurate for Gregorian years 1846-2138, with an estimated error rate of 3% outside this range.#footnote[https://github.com/unicode-org/icu/blob/main/icu4c/source/i18n/islamcal.cpp#L572]

// source: https://github.com/unicode-org/icu/blob/main/icu4c/source/i18n/islamcal.cpp#L572


*Implementation inaccuracies:* The current implementation inaccurately handles negative years, which are years before the Hijra. Additionally, months can potentially have up to 31 days, deviating from the actual lunar month length of 29 or 30 days. It can also have years with 353 days, which deviates from the Hijri year length of 354 or 355 days, making it incompatible with the HWC.#footnote[https://github.com/unicode-org/icu/blob/main/icu4c/source/i18n/islamcal.cpp#L229]

// source: https://github.com/unicode-org/icu/blob/main/icu4c/source/i18n/islamcal.cpp#L229


== Compatible Calendars <compatible-calendars>

The ICU defines five Hijri calendars, each with unique characteristics and applications. Below is a detailed breakdown of these calendars and their compatibility with the HWC system.

#table(
  columns: 4,
  [Calendar], [Compatible], [Type], [Notes],
  
  [islamic-civil], [Yes], [Tabular calendar], [ The #text(style: "italic")[islamic-civil] calendar uses a tabular format with leap years [2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29] and a Friday epoch. Also known as #text(style: "italic")[islamic-tblc] or #text(style: "italic")[islamicc], it sets its epoch to 19 July 622 Gregorian (16 July 622 CE Julian, Julian day 1948439.5).],

[islamic-tbla], [Yes], [Tabular calendar], [ The #text(style: "italic")[islamic-tbla] calendar follows a tabular format with leap years [2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29] and a Thursday epoch. Known as Microsoft Hijri (Kuwaiti) calendar, it's used in the .NET Framework's HijriCalendar Class. Its epoch is 18 July 622 Gregorian (15 July 622 CE Julian, Julian day 1948438.5).],

[islamic-umalqura], [Yes], [Astronomical calendar], [ The #text(style: "italic")[islamic-umalqura] calendar, used in Saudi Arabia, combines moon sighting and astronomical predictions for 1300-1600 AH. Outside this range, it follows the #text(style: "italic")[islamic-civil] tabular format with leap years [2, 5, 7, 10, 13, 16, 18, 21, 24, 26, 29]. Its epoch is set to 19 July 622 in the Gregorian calendar (16 July 622 CE Julian, Julian day 1948439.5).],

[islamic], [No], [Arithmetical calendar], [ Known implementation issues, with inaccuracies in some years and months.],

[islamic-rgsa], [No], [Arithmetical calendar], [Requested by Oracle. This calendar was intended to mimic the sighting-based calendar for Saudi Arabia. The implementation was never realized and is now an alias for the #text(style: "italic")[islamic] calendar and hence contains the same issues.]
)

=== Recommendation and Note

The #text(style: "italic")[islamic-civil] and #text(style: "italic")[islamic-tbla] calendars both adhere to the same intercalary leap year sequence [2,5,7,10,13,16,18,21,24,26,29], following the al-Khwarizmi/al-Battani method from the 9th century CE. However, they diverge by one day due to different epochs, with #text(style: "italic")[islamic-tbla] being a day earlier than #text(style: "italic")[islamic-civil].

Usage of #text(style: "italic")[islamic] and #text(style: "italic")[islamic-rgsa] calendars from the ICU is not recommended, even when using the HWC until such time the ICU implementation is fixed.

= Structural Elements of the Hijri Week Calendar (HWC)

The following sections define the structural elements and foundational constructs of the HWC. This calendar system is comprised of various components and rules that collectively define how it operates.

== Hijri Week and Weekdays

The HWC defines a week as a cycle of seven days. This cycle commences on Saturday, designated as day 1, and concludes on Friday, designated as day 7. Accordingly, the weekdays are numerically represented as follows: Saturday (1), Sunday (2), Monday (3), Tuesday (4), Wednesday (5), Thursday (6), and Friday (7).

This structure presents a variation from the ISO standard, where the week starts on Monday (day 1) and ends on Sunday (day 7).

The conversion from ISO weekday numbering to HWC weekday numbering involves a simple arithmetic transformation followed by a conditional adjustment to align the start and end of the week with HWC conventions. The process is as follows:

+ *Addition:* Begin by adding 2 to the ISO weekday number. This step shifts the start of the week from Monday (ISO) to Saturday (HWC).

+ *Modulo Operation:* Apply the modulo operation with 7 to the result of the addition. This operation ensures that the resulting numbers stay within the range of 1 to 7, corresponding to the days of the week.

+ *Adjustment for Friday:* Since the modulo operation maps Friday to 0 (due to the addition in step 1), a final adjustment is necessary. If the result of the modulo operation is 0, it is replaced with 7 to correctly represent Friday as the last day of the Hijri week.

This methodical approach effectively recalibrates the ISO weekday numbering to align with the HWC's structure, ensuring that each day of the week is accurately represented in the context of the HWC.

#pagebreak()

The following table outlines the relationship between HWC and ISO weekday numbering systems.

#table(
  columns: 6,
  [Weekday], [HWC Day Number], [ISO Day Number], [Add 2 to ISO], [MOD 7], [logical OR with 7],
  [Saturday], [1], [6], [6+2 = 8], [1], [1],
  [Sunday], [2], [7], [7+2 = 9], [2], [2],
  [Monday], [3], [1], [1+2 = 3], [3], [3],
  [Tuesday], [4], [2], [2+2 = 4], [4], [4],
  [Wednesday], [5], [3], [3+2 = 5], [5], [5],
  [Thursday], [6], [4], [4+2 = 6], [6], [6],
  [Friday], [7], [5], [5+2 = 7], [0], [7]
)

== Week Numbering

In the HWC system, a year is categorized as either being 'short' or 'long' based on the total count of weeks it comprises. Specifically:

- A short year consists of 50 full weeks, totaling 350 days.
- A long year consists of 51 full weeks, totaling 357 days.

This structure contrasts with the typical Hijri year, which generally spans 354 or 355 days. The delineation into short and long years is instrumental for maintaining temporal alignment within the HWC system, accommodating variations in the lunar cycle over extended periods.

== Weeks Numbering Rules

The HWC system adopts a week numbering methodology equivalant to the ISO 8601 standard, with a pivotal modification centered around the definition of the first and last calendar weeks of the year. The rules are as follows:

- *First calendar week (Week 01):* This is defined as the week that encompasses the first Tuesday of the underlying Hijri year. It marks the commencement of the HWC year and its week numbering sequence.
- *Last calendar week:* This is the week immediately preceding the first calendar week of the subsequent HWC year, effectively closing the HWC year week numbering sequence.

The primary distinction from the ISO 8601 standard lies in the selection of the pivotal day of the week. While ISO 8601 considers Thursday as the pivotal day, the HWC system designates *Tuesday* as the pivotal day around which week boundaries are determined.

This adjustment ensures that each HWC year aligns consistently with the characteristic of the temporal structure of the underlying Hijri calendar, honoring its unique cultural and religious context.

// we chose tuesday because weeks should start on saturday
// weeks should start on satruday beacuse of relegious conciderations (friday last day)

#pagebreak()

== Formatting the Hijri Week Date System <formatting-the-hijri-week-date-system>

In the HWC, dates are structured to ensure clarity and standardization, closely paralleling the format utilized by the ISO 8601 week-numbering system. The format components are as follows:

- *Year (`YYYY`):* The calendar year is denoted with four digits.
- *Week Number (`ww`):* This is a two-digit representation of the week within the year, ranging from 01 to 50/51, depending on the year's length (short or long). It is prefixed by the capital letter 'W' to denote the week number.
- *Weekday Number (`d`):* This is a single digit ranging from 1 to 7, with 1 representing Saturday and 7 representing Friday.

Hence, a complete Hijri week date is represented in the extended format as YYYY-Www-d. For more compact communication, the date can be condensed into the format YYYYWwwd.

For instance, the Hijri date *Thursday, 15 Jumada II 1445* as per #text(style: "italic")[islamic-umalqura] translates to the 6th day (Thursday) of the 23rd week in the year 1445 in the HWC. This date is formally expressed in the extended format as *`1445-W23-6`* and in the compact format as *`1445W236`*.

== Disambiguating Hijri Year from HWC Year <disambiguating-Hijri-Year-from-Hijri-Week-Year>

In the context of date notation, it's essential to distinguish clearly between the underlying Hijri year and the HWC year, as they represent different temporal frameworks. The convention for this distinction is as follows:

- *Hijri year:* Denoted as a numerical year followed by the suffix 'AH' (Anno Hegirae), indicating the traditional lunar Hijri calendar year. For example, the year 1445 in the Hijri calendar is expressed as *1445 AH*.
- *HWC year:* Similar to the Hijri year but differentiated by appending a 'W' immediatly after the year before the 'AH' suffix. This signifies adherence to the HWC system. Thus, the HWC year corresponding to 1445 AH would be denoted as *`1445W AH`*.

This notation ensures unambiguous communication by clearly differentiate the conventional underlying Hijri calendar from the HWC system.

== Calendar Awareness for Hijri Week Dates

When working with different systems that use the HWC or when using different underlying Hijri calendars within a system that uses the HWC, it is essential to specify the underlying Hijri calendar for any specific Hijri week date to ensure accurate date conversion from a Hijri week date to a Hijri date. The mapping of the Hijri week date to its underlying Hijri calendar is as follows:

- *Hijri Week Date (`YYYY-Www-d` or `YYYYWwwd`):* Expressed in the format `YYYY-Www-d` or the compact format `YYYYWwwd`. See @formatting-the-hijri-week-date-system.
- *Underlying Hijri Calendar (`[u-ca=<calendar-identifier>]`):* The specific Hijri calendar used to determine the corresponding Hijri date. This information is crucial for accurate conversion from the Hijri week date to the designated Hijri date. the suffix key `u-ca` is allocated to indicate the underlying Hijri calendar in which the Hijri week date should be presented. Possible values for the calendar identifier include the ICU Hijri calendar identifiers that are compatible with the HWC such as `islamic-civil`, `islamic-tbla`, and `islamic-umalqura`. See @compatible-calendars.

By associating the Hijri week date with the underlying Hijri calendar, the corresponding Hijri date can be determined precisely, ensuring consistency and accuracy in date representation across different systems and contexts.

For example, the Hijri week date *`1445-W23-6[u-ca=islamic-umalqura]`* specifies that the underlying Hijri calendar used is the Umm Al-Qura calendar. (This calendar notation is also used by the RFC 9557@igalia2024rfc)
// as seen in : https://datatracker.ietf.org/doc/html/rfc9557#section-5


When working with Hijri week dates across different Hijri calendars, it is essential to convert the Hijri week date to the corresponding Hijri date in the specified calendar before converting it to another Hijri calendar. This is due to the absence of direct conversion between Hijri calendars in the HWC system.

== Significance of Muharram's 4th Day in Week Numbering

The 4th day of Muharram is designated as the #text(weight: "bold")[first week pivot day]. This pivotal day bears resemblance to the 4th of January in the ISO calendar, delineating a key temporal marker. This day does not manifest in any other week besides week 01 of the HWC year, ensuring its role as a singular reference point for the beginning of the annual cycle.


To establish the beginning of week 01 in any given HWC year, one identifies the weekday corresponding to the 4th of Muharram. Subsequently, if that day isn't Saturday, the nearest preceding Saturday is determined, marking the start date of week 01. Otherwise that Saturday becomes the start of week 01.

== Tuesday's Pivotal Role in Week Number Calculation

// This section is for us to know the week number. previously named The Middle Weekday (Tuesday)

As the central day of the week, Tuesday assumes a significant role within the HWC system, characterized by the following attributes:

- It represents the mid-point of the Hijri week.
- It is designated as weekday number 4.
- The first Tuesday of the Hijri year always falls within week 01. // is this true? yes verified
- The concluding Tuesday of a given Hijri year falls within the final week, either week 50 or week 51.
- Dates falling on a Tuesday are always positioned in the middle of a week.
- Each Tuesday within a Hijri year is part of the corresponding HWC year. Consequently, a Hijri year comprising 50 Tuesdays equates to a HWC year with 50 weeks; similarly, 51 Tuesdays correspond to a HWC year with 51 weeks.
- The allocation of days to weeks is guided by proximity to Tuesday. Specifically, Wednesday, Thursday, and Friday are grouped with the preceding Tuesday, while Saturday, Sunday, and Monday align with the succeeding Tuesday.

To calculate the specific week number for a given Hijri date:
1. Locate the nearest Tuesday to that date. This is achieved by adjusting the date's weekday number by subtracting the weekday number from 4 (Tuesday).
2. Shift the date by the resulting offset from step 1 to move towards the nearest Tuesday.
3. Determine the yearly ordinal date for the date obtained from step 2.
4. Divide the yearly ordinal date number from step 3 by 7 and round it up. This results in the week number counting from the start of the Hijri year.

#table(
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

Consider the date: Wednesday 18 Shaʿbān 1445 AH using Umm Al-Qura Hijri calendar.

1. Based on the table the shift is -1 (i.e 4 - 5).
2. Shifting the date by -1 days results in Tueday 17 Shaʿbān 1445 AH.
3. Tueday 17 Shaʿbān 1445 AH yearly ordinal date is: 229.
4. We determine the week number by dividing the ordinal date and rounding it up: 229 / 7 ≈ 33.

This means that Wednesday 18 Shaʿbān occurs on the 33rd week of 1445 AH as per the Umm Al-Qura Hijri calendar.


== The Beginning of The HWC Year and its Length

// this section is for us to know the total weeks in a hijri year and the one after it. previously named First Day of the Hijri Year

The first day of the Hijri year directly determines the number of weeks in the corresponding HWC year. The week count varies based on whether it's a common year or leap year and the weekday of the year's first day:

*Common Hijri Year:*

- Starts on Sat, Sun, Mon, or Tue (days 1-4): Results in 51 weeks.
- Starts on Wed, Thu, or Fri (days 5-7): Results in 50 weeks.

*Leap Hijri Year:*

- Starts on Sat, Sun, Mon, Tue, or Fri (days 1-4, 7): Results in 51 weeks.
- Starts on Wed or Thu (days 5-6): Results in 50 weeks.

*Next Year's Start:*

- If the next Hijri year is a common year and begins on Sun, Mon or Tue (days 2-4) then the current year will have 50 weeks. Otherwise, it will have 51 weeks.
- If the next Hijri year is a leap year and begins on Mon or Tue (days 3 and 4) then the current year will have 50 weeks. Otherwise, it will have 51 weeks.

The starting day of the Hijri Year is critical for defining the total weeks in the HWC year, aligning with the underlying Hijri calendar's structure.

== Characteristics of The First Week (Week 01)

The first week (week 01) of the HWC year is characterized by specific temporal properties that establish its position and duration within the calendar system. These properties are:

- *Inclusion of the first Tuesday:* Week 01 always includes the first Tuesday of the underlying Hijri Year.
- *Minimum Duration:* This week is the earliest in the HWC year which contains at least four days of the underlying Hijri year, aligning with the structural requirements of the HWC.
- *Commencement Date Variability:* Depending on the underlying Hijri year's structure:
  - For a year ending on the 29th of Dhu al-Hijja (year-ending-29), week 01 can start as early as the 27th of Dhu al-Hijja of the preceding underlying Hijri year.
  - For a year concluding on the 30th of Dhu al-Hijja (year-ending-30), this week can commence as early as the 28th of Dhu al-Hijja of the preceding underlying Hijri year.
- *Earliest Concluding Day:* The week earliest concluding day is 4th of Muharram.
- *Guaranteed Span:* Regardless of the starting point, week 01 always spans a minimum of four days within the starting underlying Hijri year.

These characteristics ensure that week 01 serves as a foundational segment in the HWC year, establishing the framework for subsequent weeks and their numbering.


== Concluding Week Dynamics: Week 50 or 51

The #link(<disambiguating-Hijri-Year-from-Hijri-Week-Year>)[Hijri week year] concludes with either week 50 or week 51. This final week plays a key role in bridging the transition between years and has a number of characteristics:

- *Preceding week 01:* This week directly precedes week 01 of the succeeding HWC year.
- *Tuesday's Position:* The middle day of this week, Tuesday, always occurs in the ending underlying Hijri year and it is the last Tuesday of that year.
- *Conclusion on Friday:* The week terminates on the Friday that is closest to the last day of the last month of the preceding underlying Hijri year.
- *Dhu al-Hijja Presence:* At least four days of this week fall within the month of Dhu al-Hijja, marking the end of the underlying Hijri year.

*Characteristics of Week 50:*

- Commencement may be as early as the 20th of Dhu al-Hijja (year-ending-29) or the 21st of Dhu al-Hijja (year-ending-30).
- The latest it can conclude is the 28th of Dhu al-Hijja (year-ending-29) or 29th of Dhu al-Hijja (year-ending-30), not extending into the subsequent underlying Hijri year.

*Characteristics of Week 51:*

- It may start as early as the 23rd of Dhu al-Hijja (year-ending-29) or the 24th of Dhu al-Hijja (year-ending-30).
- The final day can be as late as the 3rd of Muharram of the subsequent underlying Hijri year.

#pagebreak()

== Characteristics of the Final Tuesday in HWC year

The last Tuesday of the underlying Hijri year always aligns with the final week of the HWC year, either week 50 or week 51. This day is characterized by the following properties:

- It marks the conclusion of Tuesdays in both the underlying Hijri Year and the HWC year.
- It occurs during the final week of the HWC year, which is designated as week 50 or week 51.

These attributes establish the last Tuesday as a significant temporal marker within the HWC system, marking the transition between annual cycles.

== Final Day's Placement in the HWC year

The last day of the underlying Hijri year, either the 29th or 30th of Dhu al-Hijja, highlighting the year's end with distinct features:

- The date falls on either the 29th or the 30th of the 12th month (Dhu al-Hijja), regardless of it being a common or leap year.
- It is positioned within week 51 or week 01 of the HWC year. It does not occur in week 50.
- For common years concluding on a Tuesday, Wednesday, Thursday, or Friday (days 4-7), or for leap years ending on a Saturday, Tuesday, Wednesday, Thursday, or Friday (days 1 and 4-7), the HWC year comprises 51 weeks.
- For common years ending on a Saturday, Sunday, or Monday (days 1-3), or for leap years concluding on a Sunday or Monday (days 2 or 3), the HWC year contains 50 weeks.

== Properties of the Last Week's Pivot Day

The last week's pivot day marks a critical reference point in the HWC, occurring three days prior to the HWC year's conclusion. Its characteristics are as follows:

- If the underlying Hijri year concludes on the 29th of Dhu al-Hijja (year-ending-29), the last week's pivot day falls on the 26th of Dhu al-Hijja.
- If the underlying Hijri year ends on the 30th of Dhu al-Hijja (year-ending-30), this day is observed on the 27th of Dhu al-Hijja.
- It consistently occurs during the final week of the HWC year, either week 50 or week 51.
- It is precisely seven days prior to the 4th of Muharram in the subsequent year.

#gnote[
The occurrence of the last week's pivot day falls within the final week of the HWC year facilitates the determination of the total number of weeks in that year. This can be achieved determining the ordinal day number of the last week's pivot day, then dividing it by 7 and applying a ceiling function to round up to the nearest whole number.
]

#pagebreak()

// = Other Days in the First Month of the Hijri Year
== Week Allocation for Initial Days of Muharram

The initial days of Muharram, the first month of the Hijri year, have a structured and predictable placement within the HWC:

- The 4th of Muharram always falls in week 01.
- The 11th of Muharram always falls in week 02.
- The 18th of Muharram always falls in week 03.
- The 25th of Muharram always falls in week 04.
- The 1st, 2nd, and 3rd of Muharram are confined to either week 01 or the preceding week 51, depending on the year's structure.

= Tables

== Example of Hijri Year Ending 30 days

#figure(
  image("images/table-01-fixed.png", width: 80%),
  caption: [
    Distribution of the weeks at the start of a year where the ending Hijri year (previous year) ends with the last month having 30 days.
  ],
)

#gnote[
It must not be assumed that the final month (month 12) being 30 days represents a leap-year in all Hijri calendars, because non-tabular calendars such as the Umm Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29-day months.
]

#pagebreak()

== Example of Hijri Year Ending 29 days

#figure(
  image("images/table-02-fixed.png", width: 80%),
  caption: [
     Distribution of the weeks at the start of a year where the ending Hijri year (previous year) ends with the last month having 29 days.
  ],
)

#gnote[
The year ending with a 29-day month could be a common year or a leap year as non-tabular calendars such as the Umm Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29-day months.
]

#v(1fr)

#bibliography("ref.bib", style: "chicago-fullnotes")