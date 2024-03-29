\name{nbfires}
\alias{nbfires}
\alias{nbw.rect}
\alias{nbw.seg}
\alias{nbfires.extra}
\docType{data}
\title{Point Patterns of New Brunswick Forest Fires}
\description{
Point patterns created from yearly records, provided by the New
Brunswick Department of Natural Resources, of all fires falling
under their jurisdiction for the years 1987 to 2003 inclusive
(with the year 1988 omitted until further notice).
}
\usage{data(nbfires)}
\format{
  Executing \code{data(nbfires)} gives access to four objects:
  \code{nbfires}, \code{nbw.rect}, \code{nbw.seg} and \code{nbfires.extra}.

  The object \code{nbfires} is a marked point pattern (an object of
  class \code{"ppp"}) consisting of all of the fires in the years
  1987 to 2003 inclusive, with the omission of 1988.  The marks
  consist of a data frame of auxiliary information about the fires;
  see \emph{Details.} Patterns for individual years can be extracted
  using the function \code{\link[spatstat.geom]{split.ppp}()}.  (See \bold{Examples}.)

  The object \code{nbw.rect} is a rectangular window which covers
  central New Brunswick.  It is provided for use in illustrative and
  \sQuote{practice} calculations inasmuch as the use of a rectangular
  window simplifies some computations considerably.

  The object \code{nbw.seg} is a line segment pattern (object of class
  \code{"psp"}) consisting of all the boundary segments of the polygonal window
  of New Brunswick. The segments are classified into different types of
  boundary by \code{marks(nbw.seg)}.
  This is a data frame with three columns:
  \itemize{
    \item
    The column \code{type} describes the
    physical type of the border. It is a factor with levels
    \code{"land"} (land border),
    \code{"river"} (river border),
    \code{"coast"} (coast of the mainland)
    and \code{"island"} (coast of the 5 islands).
    To plot this classification, type \code{plot(nbw.seg)}.
    \item
    The column \code{share} specifies the territory which
    shares the border with New Brunswick. It is a factor with
    levels \code{"Quebec"}, \code{"NovaScotia"}, \code{"USA"}
    and \code{"water"}.
    To plot this classification, type \code{plot(nbw.seg,which.marks="share")}.
    \item
    The column \code{full} specifies both the physical type of border
    and the adjacent territory. It is a factor with levels
    \code{"coast"},
    \code{"island"},
    \code{"landNovaScotia"},
    \code{"landQuebec"},
    \code{"riverQuebec"},
    \code{"landUSA"},
    \code{"riverUSAnorth"},
    \code{"riverUSAsouth"}.
    To plot this classification, type \code{plot(nbw.seg,which.marks="full")}.
  }
  For conformity with other datasets, \code{nbfires.extra} is a list
  containing all the supplementary data. It contains copies of
  \code{nbw.rect} and \code{nbw.seg}.
}
\details{
The coordinates of the fire locations were provided in terms of
latitude and longitude, to the nearest minute of arc.  These were
converted to New Brunswick stereographic projection coordinates
(Thomson, Mephan and Steeves, 1977) which was the coordinate
system in which the map of New Brunswick --- which constitutes the
observation window for the pattern --- was obtained.  The conversion
was done using a \code{C} program kindly provided by Jonathan
Beaudoin of the Department of Geodesy and Geomatics, University of
New Brunswick.

Finally the data and window were rescaled since the use of the
New Brunswick stereographic projection coordinate system resulted
in having to deal with coordinates which are expressed as very
large integers with a bewildering number of digits.  Amongst other
things, these huge numbers tended to create very untidy axis labels
on graphs.  The width of the bounding box of the window was made
equal to 1000 units. In addition the lower left hand
corner of this bounding box was shifted to the origin. The height
of the bounding box was changed proportionately, resulting in a
value of approximately 959.

In the final dataset \code{nbfires}, one coordinate unit is equivalent to
0.403716 kilometres. To convert the data to kilometres,
use \code{rescale(nbfires)}.

The window for the fire patterns comprises 6 polygonal components,
consisting of mainland New Brunswick and the 5 largest islands.
Some lakes which should form holes in the mainland component are
currently missing; this problem may be remedied in future releases.
The window was formed by \sQuote{simplifying} the map that was originally
obtained.  The simplification consisted in reducing (using
an interactive visual technique) the number of polygon edges in
each component.  For instance the number of edges in the mainland
component was reduced from over 138,000 to 500.

For some purposes it is probably better to use a discretized
(mask type) window.  See \bold{Examples}.

Because of the coarseness of the coordinates of the original
data (1 minute of longitude is approximately 1 kilometer at the
latitude of New Brunswick), data entry errors, and the simplification
of the observation window, many of the original fire locations
appeared to be outside of the window.  This problem was addressed
by shifting the location of the \sQuote{outsider} points slightly,
or deleting them, as seemed appropriate.

Note that the data contain duplicated points (two points at the
same location). To determine which points are duplicates,
use \code{\link[spatstat.geom]{duplicated.ppp}}.
To remove the duplication, use \code{\link[spatstat.geom]{unique.ppp}}.

The columns of the data frame comprising the marks of
\code{nbfires} are:
\describe{
  \item{year}{
    This a \emph{factor} with levels 1987, 1989,
    \ldots, 2002, 2003.  Note that 1988 is not present in
    the levels.
  }
  \item{fire.type}{
    A factor with levels \code{forest},
    \code{grass}, \code{dump}, and \code{other}.
  }
  \item{dis.date}{
    The discovery date of the fire, which is the
    nearest possible surrogate for the starting time
    of the fire.  This is an object of class \code{POSIXct}
    and gives the starting discovery time of the fire to
    the nearest minute.
  }
  \item{dis.julian}{
    The discovery date and time of the fire, expressed
    in \sQuote{Julian days}, i.e. as a decimal fraction representing the number
    of days since the beginning of the year (midnight 31 December).
  }
  \item{out.date}{
    The date on which the fire was judged to be
    \sQuote{out}. This is an object of class \code{POSIXct} and gives the
    \sQuote{out} time of the fire to the nearest minute.
  }
  \item{out.julian}{
    The date and time at which the fire was judged
    to be \sQuote{out}, expressed in Julian days.
  }
  \item{cause}{
    General cause of the fire.  This is a factor with
    levels \code{unknown}, \code{rrds} (railroads), \code{misc}
    (miscellaneous), \code{ltning} (lightning), \code{for.ind}
    (forest industry), \code{incend} (incendiary), \code{rec}
    (recreation), \code{resid} (resident), and \code{oth.ind}
    (other industry).  Causes \code{unknown}, \code{ltning}, and
    \code{incend} are supposedly designated as \sQuote{final} by the New Brunswick
    Department of Natural Resources, meaning (it seems) \dQuote{that's
    all there is to it}.  Other causes are apparently intended
    to be refined by being combined with \dQuote{source of ignition}.
    However cross-tabulating \code{cause} with \code{ign.src} ---
    see below --- reveals that very often these three \sQuote{causes}
    are associated with an \dQuote{ignition source} as well.
  }
  \item{ign.src}{
    Source of ignition, a factor with levels
    \code{cigs} (cigarette/match/pipe/ashes), \code{burn.no.perm}
    (burning without a permit), \code{burn.w.perm} (burning with a
    permit), \code{presc.burn} (prescribed burn), \code{wood.spark}
    (wood spark), \code{mach.spark} (machine spark), \code{campfire},
    \code{chainsaw}, \code{machinery}, \code{veh.acc} (vehicle
    accident), \code{rail.acc} (railroad accident), \code{wheelbox}
    (wheelbox on railcars), \code{hot.flakes} (hot flakes off
    railcar wheels), \code{dump.fire} (fire escaping from a dump),
    \code{ashes} (ashes, briquettes, burning garbage, etc.)
  }
  \item{fnl.size}{
    The final size of the fire (area burned)
    in hectares, to the nearest 10th hectare.
  }
}
Note that due to data entry errors some of the \dQuote{out dates} and
\dQuote{out times} in the original data sets were actually \emph{earlier}
than the corresponding \dQuote{discovery dates} and \dQuote{discover times}.
In such cases all corresponding entries of the marks data frame
(i.e. \code{dis.date}, \code{dis.julian}, \code{out.date}, and
\code{out.julian}) were set equal to \code{NA}.  Also, some of the
dates and times were missing (equal to \code{NA}) in the original
data sets.

The \sQuote{ignition source} data were given as integer codes
in the original data sets.  The code book that I obtained
gave interpretations for codes 1, 2, \ldots, 15.  However
the actually also contained codes of 0, 16, 17, 18, and in
one instance 44.  These may simply be data entry errors.
These uninterpretable values were assigned the level
\code{unknown}.  Many of the years had most, or sometimes
all, of the ignition source codes equal to 0 (hence turning
out as \code{unknown}, and many of the years had many
missing values as well.  These were also assigned the
level \code{unknown}.  Of the 7108 fires in \code{nbfires},
4354 had an \code{unknown} ignition source.  This variable
is hence unlikely to be very useful.

There are also anomalies between \code{cause} and \code{ign.src},
e.g. \code{cause} being \code{unknown} but \code{ign.src}
being \code{cigs}, \code{burn.no.perm}, \code{mach.spark},
\code{hot.flakes}, \code{dump.fire} or \code{ashes}.  Particularly
worrisome is the fact that the cause \code{ltning} (!!!) is
associate with sources of ignition \code{cigs}, \code{burn.w.perm},
\code{presc.burn}, and \code{wood.spark}.
}
\source{
  The data were kindly provided by the New Brunswick Department
  of Natural Resources.  Special thanks are due to Jefferey Betts for
  a great deal of assistance.
}
\references{
Turner, Rolf.
Point patterns of forest fire locations.
\emph{Environmental and Ecological Statistics}
\bold{16} (2009) 197 -- 223, \code{DOI:10.1007/s10651-007-0085-1}.

Thomson, D. B., Mephan, M. P., and Steeves, R. R. (1977)
The stereographic double projection.
Technical Report 46, University of New Brunswick,
Fredericton, N. B., Canada
URL: \code{gge.unb.ca/Pubs/Pubs.html}.
}

\examples{
if(interactive()) {
  if(require(spatstat.geom)) {
# Get the year 2000 data.
X <- split(nbfires,"year")
Y.00 <- X[["2000"]]
# Plot all of the year 2000 data, marked by fire type.
plot(Y.00,which.marks="fire.type")
# Cut back to forest and grass fires.
Y.00 <- Y.00[marks(Y.00)$fire.type \%in\% c("forest","grass")]
# Plot the year 2000 forest and grass fires marked by fire duration time.
stt  <- marks(Y.00)$dis.julian
fin  <- marks(Y.00)$out.julian
marks(Y.00) <- cbind(marks(Y.00),dur=fin-stt)
plot(Y.00,which.marks="dur")
# Look at just the rectangular subwindow (superimposed on the entire window).
nbw.mask <- as.mask(Window(nbfires), dimyx=500)
plot(nbw.mask, col=c("green", "white"))
plot(Window(nbfires), border="red", add=TRUE)
plot(Y.00[nbw.rect],use.marks=FALSE,add=TRUE)
plot(nbw.rect,add=TRUE,border="blue")
  if(require(spatstat.explore)) {
    # Look at the K function for the year 2000 forest and grass fires.
    K.00 <- Kest(Y.00)
    plot(K.00)
   }
# Rescale to kilometres
NBF <- rescale(nbfires)
  }
}
}
\keyword{datasets}
\keyword{spatial}
