#import "@preview/gloss-awe:0.0.5": *

#set quote(quotes: false, block: true)
#set terms(separator: [: ])

  // done
  / Hijri calendar: A lunar calendar widely used in the Islamic world. It is based on the lunar months, with a year of 12 lunar months lasting either 354 or 355 days, making it shorter than the Gregorian calendar. #label("hijri-calendar")
    
  / common year: In the #link("hijri-calendar")[Hijri calendar] a calendar year that has 354 calendar days is a common year. in the Gregorian calendar  a calendar year that has 365 calendar days is a common year.
  
  / leap year: In the #link("hijri-calendar")[Hijri calendar] a calendar year that has 355 calendar days is a leap year. in the Gregorian calendar  a calendar year that has 366 calendar days is a leap year.

  #quote[Note: it must not be assumed that the final month (month 12) being 30 days represents a leap-year in all Hijri Calendars because non-tabular calendars such as Um Al-Qura calendar can have the extra day needed to make-up a leap year inserted at the end of any of the other 29 day months]

  // should we introduce an equivalaent rule for hijri?

  // Note: A leap year is a calendar year whose year number is divisible by four and is not a centennial year, or a centennial year whose year number is divisible by four hundred.

  / Hijri week calendar: a calendar based on an unbounded series of contiguous calendar weeks that uses the time scale unit of calendar week as its basic unit to represent a calendar year, according to the rule that the first calendar week of a calendar year is the week including the first Tuesday of that year, and that the last one is the week immediately preceding the first calendar week of the next calendar year #label("hijri-week-calendar")

  #quote[
    Note: This rule is based on the principle that a week belongs to the calendar year to which the majority of its calendar days belong.
  ]

  #quote[
    Note: In the Hijri week calendar, calendar days of the first and last calendar week of a calendar year may belong to the previous and the next calendar year respectively in the Hijri calendar.
  ]
    
  
  / calendar date: a particular calendar day represented by its calendar year, its #link("calendar-month")[calendar month] and its #link("calendar-day-of-month")[calendar day of month] #label("calendar-date")

  //   // FIXME: the reference style doesn't seem to work
  //   link: [ISO 8601-1:2019, Date and time — Representations for information interchange — Part 1: Basic rules (publicly avaialble informative sections)]


  / ordinal date: a particular calendar day represented by its calendar year and its #link("calendar-day-of-year")[calendar day of year] #label("ordinal-date")

  //   link: [ISO 8601-1:2019, Date and time — Representations for information interchange — Part 1: Basic rules (publicly avaialble informative sections)]

  / Hijri week date: a particular Hijri calendar day represented by the Hijri calendar year to which its #link("hijri-week-calendar")[Hijri calendar week] belongs, its #link("hijri-calendar-week-of-year")[Hijri calendar week of year] and its #link("hijri-calendar-day-of-week")[Hijri calendar day of week] #label("week-date")

  // / calendar day: 
    // Shoudl we define this and do we need to touch on the fact in hijri the start of day is on sunset but we use midnite for now

  / Hijri calendar week of year: an ordinal number of a #link("hijri-calendar-week")[Hijri calendar week] within a Hijri calendar year of the #link("hijri-week-calendar")[Hijri week calendar]. #label("week-of-year")

  / Hijri calendar day of week: day amongst the sequence of #link("hijri-week-calendar")[Hijri week calendar] days, namely, Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday or Friday.

    #quote[
      Note: Hijri weeks start on Saturday not Monday.
    ] #label("hijri-calendar-day-of-week")
  
  / calendar day of month: an ordinal number of a calendar day within a calendar month

  
  / calendar day of year: ordinal number of a calendar day within a calendar year #label("calendar-day-of-year")

  //   link: [ISO 8601-1:2019, Date and time — Representations for information interchange — Part 1: Basic rules (publicly avaialble informative sections)]
  // ),

  / Hijri calendar week: a duration of seven calendar days which begins on Saturday and ends on Friday according to the #link("hijri-week-calendar")[Hijri week clendar]. #label("hijri-calendar-week")


  // / Hijri calendar month: 
    // Shoudl we define a hijri calendar month?

  / year: In the #link("hijri-calendar")[Hijri calendar], a year has 354 or 355 days.
  //     // add counterpart for hijri
  //     // The duration is 355 days if the corresponding time interval begins February 28 or earlier in a leap year (3.1.1.21) or March 2 or later in a year immediately preceding a leap year. If the interval begins February 29 (on a leap year), or March 1 of a year preceding a leap year, the end date has to be agreed on. Otherwise the duration is 365 days

  / first week pivot day: The 4th of Muharam #label("first-week-pivot-day")

  / last week pivot day: 3rd days before Hijri year end which is either 26 of Dhu al-Hijja or 27 of Dhu al-Hijja #label("last-week-pivot-day")
  
  / year-ending-30: A Hijri year that has the last month Dhu al-Hijja with 30 days #label("year-ending-30")

  / year-ending-29: A Hijri year that has the last month Dhu al-Hijja with 29 days #label("year-ending-29")


// - Year-Ending30         : A Hijri Year that has the last month Dhu Al-Hijjah (month 12) with 30 days.
// - Year-Ending29         : A Hijri Year that has the last month Dhu Al-Hijjah (month 12) with 29 days.
// - First Week Pivot Day  : 4th Muarram (4/1).
// - Last Week Pivot Day   : 3 days before Hijri Year End (26/12 or 27/12).
// - Leap Hijri Year       : A Hijri Year with 355 days.
// - Common Hijri Year     : A Hijri Year with 354 days.