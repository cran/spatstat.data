\name{chicago}
\alias{chicago}
\docType{data}
\title{
  Chicago Crime Data
}
\description{
  This dataset is a record of spatial locations of crimes
  reported in the period 25 April to 8 May 2002,
  in an area of Chicago (Illinois, USA)
  close to the University of Chicago.
  The original crime map was published in the
  Chicago Weekly News in 2002. 
  
  The data give the spatial location (street address) of each crime report,
  and the type of crime. The type labels are interpreted as follows:
  \tabular{ll}{
    \code{assault} \tab battery/assault \cr
    \code{burglary} \tab burglary \cr
    \code{cartheft} \tab motor vehicle theft \cr
    \code{damage} \tab criminal damage \cr
    \code{robbery} \tab robbery \cr
    \code{theft} \tab theft \cr
    \code{trespass} \tab criminal trespass
  }
  All crimes occurred on or near a street. The data give the
  coordinates of all streets in the survey area, and their connectivity.

  Spatial coordinates are expressed in feet (one foot is 0.3048 metres).

  The dataset \code{chicago} is an object of class \code{"lpp"}
  representing a point pattern on a linear network.
  See \code{\link[spatstat.linnet]{lpp}} for further information on the format.

  These data were published and analysed in
  Ang, Baddeley and Nair (2012).
} 
\format{
  Object of class \code{"lpp"}. 
  See \code{\link[spatstat.linnet]{lpp}}.
}
\usage{data(chicago)}
\examples{
data(chicago)
  if(require(spatstat.linnet)) {
plot(chicago)
plot(as.linnet(chicago), main="Chicago Street Crimes",col="green")
plot(as.ppp(chicago), add=TRUE, col="red", chars=c(16,2,22,17,24,15,6))
  }
}
\source{
  Chicago Weekly News, 2002.
  Manually digitised by \adrian.
}
\references{
  Ang, Q.W. (2010)
  \emph{Statistical methodology for events on a network}.
  Master's thesis, School of Mathematics and Statistics, University of
  Western Australia.
  
  Ang, Q.W., Baddeley, A. and Nair, G. (2012)
  Geometrically corrected second-order analysis of 
  events on a linear network, with applications to
  ecology and criminology.
  \emph{Scandinavian Journal of Statistics} \bold{39}, 591--617.

  Chicago Weekly News website: \url{http://www.chicagoweeklynews.com}
}
\keyword{datasets}
\keyword{spatial}
