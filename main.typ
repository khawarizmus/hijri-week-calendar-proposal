#import "layout.typ": title, subtitle, authors, affiliations, abstract, margins, publishDate
#import "lapreprint.typ": template

#show: template.with(
  title: title,
  subtitle: subtitle,
  open-access: true,
  font-face: "Noto Sans",
  heading-numbering: "1.a.i",
  theme: green.darken(40%),
  authors: authors,
  affiliations: affiliations,
  date: (
    (title: "Published", date: publishDate),
  ),
  abstract: abstract,
  margin: margins,
)

#include "content.typ"