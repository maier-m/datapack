% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataPackage.R
\docType{methods}
\name{addData}
\alias{addData}
\alias{addData,DataPackage,DataObject-method}
\title{Add a DataObject to the DataPackage}
\usage{
addData(x, do, ...)

\S4method{addData}{DataPackage,DataObject}(x, do, mo = NA_character_)
}
\arguments{
\item{x}{A DataPackage instance}

\item{do}{A DataObject instance}

\item{...}{(Additional parameters)}

\item{mo}{A DataObject (containing metadata describing \code{"do"} ) to associate with the science object.}
}
\value{
the updated DataPackage object
}
\description{
The DataObject is added to the DataPackage.
}
\details{
The DataObject \code{"do"} is added to the DataPackage. If the optional \code{"mo"} parameter is specified, then it is 
assumed that the DataObject \code{"mo"} is a metadata
object that describes the science object \code{"do"} that is being added. The \code{addData} function will add a relationship
to the DataPackage resource map that indicates that the metadata object describes the science object using the 
Citation Typing Ontology (CITO).
Note: this method updates the passed-in DataPackage object.
\code{documents} and \code{isDocumentedBy} relationship.
}
\examples{
dpkg <- new("DataPackage")
data <- charToRaw("1,2,3\\n4,5,6")
metadata <- charToRaw("EML or other metadata document text goes here\\n")
md <- new("DataObject", id="md1", dataobj=metadata, format="text/xml", user="smith", 
  mnNodeId="urn:node:KNB")
do <- new("DataObject", id="id1", dataobj=data, format="text/csv", user="smith", 
  mnNodeId="urn:node:KNB")
# Associate the metadata object with the science object. The 'mo' object will be added 
# to the package  automatically, since it hasn't been added yet.
# This method is now deprecated, so suppress warnings if desired. 
suppressWarnings(dpkg <- addData(dpkg, do, md))
}
\seealso{
\code{\link{DataPackage-class}}
}
