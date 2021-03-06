\name{trEndpoint}
\alias{trEndpoint}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimator of endpoint
}
\description{
Estimator of endpoint using truncated Hill estimates.
}
\usage{
trEndpoint(data, r = 1, gamma, plot = FALSE, add = FALSE,
           main = "Estimates of endpoint", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
  Vector of \eqn{n} observations. 
}
  \item{r}{
Trimming parameter, default is \code{1} (no trimming).
}
\item{gamma}{
Vector of \eqn{n-1} estimates for the EVI obtained from \code{\link{trHill}}.
}
 \item{plot}{
Logical indicating if the estimates of \eqn{T} should be plotted as a function of \eqn{k}, default is \code{FALSE}.
}
  \item{add}{
Logical indicating if the estimates of \eqn{T} should be added to an existing plot, default is \code{FALSE}.
}
  \item{main}{
Title for the plot, default is \code{"Estimates of endpoint"}.
}
  \item{\dots}{
Additional arguments for the \code{plot} function, see \code{\link[graphics]{plot}} for more details.
}
}
\details{
The endpoint is estimated as
\deqn{\hat{T}_{k,n} = \max\{X_{n-k,n}  ( ((X_{n-k,n}/X_{n,n})^{1/\hat{\gamma}_k} - 1/(k+1)) / (1-1/(k+1)))^{-\hat{\gamma}_k}, X_{n,n}\}}
with \eqn{\hat{\gamma}_k} the Hill estimates adapted for truncation.

See Beirlant et al. (2016) or Section 4.2.3 of Albrecher et al. (2017) for more details.
}
\value{
A list with following components:
\item{k}{Vector of the values of the tail parameter \eqn{k}.}
\item{Tk}{Vector of the corresponding estimates for the endpoint \eqn{T}.}
}
\references{
Albrecher, H., Beirlant, J. and Teugels, J. (2017). \emph{Reinsurance: Actuarial and Statistical Aspects}, Wiley, Chichester.

Beirlant, J., Fraga Alves, M.I. and Gomes, M.I. (2016). "Tail fitting for Truncated and Non-truncated Pareto-type Distributions." \emph{Extremes}, 19, 429--462.
}
\author{
Tom Reynkens based on \code{R} code of Dries Cornilly.
}

\seealso{
\code{\link{trHill}}, \code{\link{trDT}}, \code{\link{trEndpointMLE}}
}
\examples{
# Sample from truncated Pareto distribution.
# truncated at 99\% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Truncated Hill estimator
trh <- trHill(X, plot=TRUE, ylim=c(0,2))

# Endpoint
trEndpoint(X, gamma=trh$gamma, plot=TRUE, ylim=c(8,12))
abline(h=qpareto(0.99, shape=shape), lty=2)
}
