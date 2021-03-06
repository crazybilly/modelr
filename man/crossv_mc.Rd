% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cross-validation.R
\name{crossv_mc}
\alias{crossv_kfold}
\alias{crossv_mc}
\title{Generate cross-validated test-training pairs}
\usage{
crossv_mc(data, n, test = 0.2, id = ".id")

crossv_kfold(data, k = 5, id = ".id")
}
\arguments{
\item{data}{A data frame}

\item{n}{Number of test-training pairs to generate (an integer).}

\item{test}{Proportion of observations that should be held out for testing
(a double).}

\item{id}{Name of variable that gives each model a unique integer id.}

\item{k}{Number of folds (an integer).}
}
\value{
A data frame with \code{n}/\code{k} rows and columns \code{test} and
  \code{train}. \code{test} and \code{train} are list-columns containing
  \code{\link{resample}} objects.
}
\description{
\code{crossv_kfold} splits the data into \code{k} exclusive partitions,
and uses each partition for a test-training split. \code{crossv_mc}
generates \code{n} random partitions, holding out \code{p} of the
data for training.
}
\examples{
cv1 <- crossv_kfold(mtcars, 5)
cv1

library(purrr)
cv2 <- crossv_mc(mtcars, 100)
models <- map(cv2$train, ~ lm(mpg ~ wt, data = .))
errs <- map2_dbl(models, cv2$test, rmse)
hist(errs)
}

