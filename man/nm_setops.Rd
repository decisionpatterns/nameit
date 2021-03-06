% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nm_setops.R
\name{nm_intersect}
\alias{nm_intersect}
\alias{nm_union}
\alias{nm_setdiff}
\title{Set Operations on names}
\usage{
nm_intersect(x, y, ...)

nm_union(x, y, ...)

nm_setdiff(x, y, ...)
}
\arguments{
\item{x}{object with names}

\item{y}{object with names}

\item{...}{additional objects, currently unused

This is like \code{intersect} but works on names instead of values. It
returns tje}
}
\value{
character values of names
}
\description{
These functions provide operations similar to their base counterparts, except
}
\examples{

x <- list( a=1, b=2, c=3 )
y <- list( a=5,      c=4, d=0.1 )

nm_intersect( x, y )
nm_union( x, y )
nm_setdiff( x, y )

}
