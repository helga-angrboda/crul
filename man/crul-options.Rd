% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set.R
\name{crul-options}
\alias{crul-options}
\alias{set_opts}
\alias{set_proxy}
\alias{set_auth}
\alias{set_headers}
\alias{crul_settings}
\title{Set curl options, proxy, and basic auth}
\usage{
set_opts(...)

set_proxy(x)

set_auth(x)

set_headers(...)

crul_settings(reset = FALSE)
}
\arguments{
\item{...}{For \code{set_opts()} any curl option in the set
\code{\link[curl:curl_options]{curl::curl_options()}}. For \code{set_headers()} a named list of headers}

\item{x}{For \code{set_proxy()} a \code{proxy} object made with \code{\link[=proxy]{proxy()}}. For
\code{set_auth()} an \code{auth} object made with \code{\link[=auth]{auth()}}}

\item{reset}{(logical) reset all settings (aka, delete them).
Default: \code{FALSE}}
}
\description{
Set curl options, proxy, and basic auth
}
\details{
the \code{mock} option will be seen in output of \code{crul_settings()}
but is set via the function \code{\link[=mock]{mock()}}
}
\examples{
# get settings
crul_settings()

# curl options
set_opts(timeout_ms = 1000)
crul_settings()
set_opts(timeout_ms = 4000)
crul_settings()
set_opts(verbose = TRUE)
crul_settings()
\dontrun{
HttpClient$new('https://httpbin.org')$get('get')
}

# basic authentication
set_auth(auth(user = "foo", pwd = "bar", auth = "basic"))
crul_settings()

# proxies
set_proxy(proxy("http://97.77.104.22:3128"))
crul_settings()

# headers
crul_settings(TRUE) # reset first
set_headers(foo = "bar")
crul_settings()
set_headers(`User-Agent` = "hello world")
crul_settings()
\dontrun{
set_opts(verbose = TRUE)
HttpClient$new('https://httpbin.org')$get('get')
}

# reset
crul_settings(TRUE)
crul_settings()

# works with async functions
## Async
set_opts(verbose = TRUE)
cc <- Async$new(urls = c(
    'https://httpbin.org/get?a=5',
    'https://httpbin.org/get?foo=bar'))
(res <- cc$get())

## AsyncVaried
set_opts(verbose = TRUE)
set_headers(stuff = "things")
reqlist <- list(
  HttpRequest$new(url = "https://httpbin.org/get")$get(),
  HttpRequest$new(url = "https://httpbin.org/post")$post())
out <- AsyncVaried$new(.list = reqlist)
out$request()
}
