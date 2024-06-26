# Rules

The proposed rules (which follow the ISO week standards) are designed to be applicable to all types of Hijri (islamic) Calendars, not limited to just the tabular varieties. This includes compatibility with calendars such as the Umm al-Qura calendar. For more information on non-compatible calendars, see [Compatible Calendars](/#compatible-calendars) section.

1. **Week Definition**:
   - A week is always 7 days long and starts on Saturday designated as day 1, and ends on Friday, designated as day 7. Note: Islamic weeks start on Saturday compared to ISO and Gregorian weeks which start on Monday.

2. **Weekday Numbering**:
   - Days of the week are numbered sequentially from 1 (Saturday) to 7 (Friday).

3. **Year Length**:
   - A 'short year' consists of 50 weeks, totaling 350 days.
   - A 'long year' consists of 51 weeks, totaling 357 days.

4. **Midweek Day**:
   - Tuesday is always the middle day of the week, designated as day 4. This is similar to ISO mid-week day 4 which is Thursday.

5. **First Week Identification**:
   - The first week of the Hijri Week Calendar year (Week 01) is identified by the inclusion of the 4th day of Muharram (which is the 4th day of the starting Hijri year). This is similar to the ISO standard whereby 4th January falls exclusively in Week 01.

6. **4th Muharram Placement**:
   - The 4th of Muharram of a Hijri year occurs exclusively in the first week (week 01) of the year in a Hijri Week Calendar.
   - It does not appear in any other weeks, such as the 51st or 2nd weeks.

The above rule is compliant with the ISO standard.

7. **Week 51 Extension**:
   - Week 51 may extend into the following Hijri year but only up to the 3rd of Muharram.

8. **Week 50 Limitation**:
   - Week 50 does not extend into the following Hijri year.
   - Its latest possible day is the 29th of Dhu al-Hijjah.
   - In rare cases, like in the Umm al-Qura calendar, week 50 may extend to this date, after which week 1 of the next year begins.

9. **Date Placement in Weeks 51 and 1**:
   - The dates of 30th Dhu al-Hijjah, and the 1st, 2nd, and 3rd of Muharram can only fall within week 51 of the ending year or week 1 of the starting year.
   - To determine the first week of the Hijri week calendar year, locate the 4th of Muharram and identify the corresponding Saturday of that week. This Saturday marks the first day of the week in the Hijri week calendar.

> **Note on Terminology**:
> Within this Hijri week calendar system, years are categorized as 'short' or 'long.' The terms 'leap' and 'common' years are not applicable.

## Compatible Calendars

To ensure compatibility with this implementation, a Hijri calendar must adhere to the following rules:

1. **Year Length**:
   - A Hijri year must consist of either 354 or 355 days.

2. **Long and Short Years**:
   - A common Hijri year (354 days) comprises 6 months of 29 days and 6 months of 30 days.
   - A leap Hijri year (355 days) comprises 5 months of 29 days and 7 months of 30 days.

Given these rules, the following calendars are found as of today **incompatible** with this implementation:

- **Islamic Calendar**:
   - This calendar calculates Hijri dates using arithmetic based on a formula with an offset to the Gregorian calendar. It provides approximate Hijri dates and is inaccurate for [approximately 3%](https://github.com/unicode-org/icu/blob/1a60a038e14f0c56f50052c03fe76c4933cda339/icu4c/source/i18n/islamcal.cpp#L562) of the years.
   - Notably, it includes years of 353 days, such as in 17 AH, 325 AH, 992 AH, 3954 AH, and 4485 AH. These years have 7 months of 29 days and 5 months of 30 days, totaling 353 days, which violates the year length rule for Hijri calendars.

- **Rgsa-Islamic Calendar**:
   - Although it claims to be based on lunar sightings, [this calendar is not practically implemented](https://github.com/unicode-org/icu/blob/1a60a038e14f0c56f50052c03fe76c4933cda339/icu4c/source/i18n/islamcal.h#L697) and essentially relies on the Islamic calendar mentioned above. As a result, it is incompatible with this implementation due to the same reasons.