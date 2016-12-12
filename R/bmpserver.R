#' Start a Browser Mob proxy
#'
#' Start a Browser Mob proxy
#' @param port Port to run on
#' @param version what version of chromedriver to run. Default = "latest"
#'     which runs the most recent version. To see other version currently
#'     sourced run binman::list_versions("chromedriver")
#' @param proxyPortRange The range of ports to use for proxies as integers.
#' @param ttl Time in seconds until an unused proxy  is deleted 
#'
#' @return Returns a list with named elements process, output, error
#'     and stop. process is the output from calling \code{\link{spawn_process}}
#'     output, error and stop are functions calling
#'     \code{\link{process_read}}, \code{\link{process_read}} with "stderr"
#'     pipe and \code{\link{process_kill}}  respectively  on process.
#' @export
#'
#' @examples
#' \dontrun{
#' bmPxy <- bmproxy()
#' bmPxy$stop()
#' }

bmproxy <- function(port = 9090L, version = "latest",
                    proxyPortRange = 39500L:39999L, 
                    ttl = 600L){
  assert_that(is_integer(port))
  assert_that(is_string(version))
  assert_that(is_integer(proxyPortRange))
  bmpCheck <-  bmpCheck()
  bmpPlat <-  bmpCheck[["platform"]]
  bmpVersion <- bmpVer(bmpPlat, version)
  args <- c()
  tFile <- tempfile(fileext = ".txt")
  args[["portSwitch"]] <- "--port"
  args[["port"]] <- port
  args[["portRangeSwitch"]] <- "--proxyPortRange"
  args[["portRange"]] <- 
    paste( min(proxyPortRange), max(proxyPortRange), sep = "-")
  args[["ttlSwitch"]] <- "--ttl"
  args[["ttl"]] <- ttl
  
  bmpserv <- subprocess::spawn_process(
    bmpVersion[["path"]], arguments = args
  )
  if(!is.na(subprocess::process_return_code(bmpserv))){
    stop("BrowserMob Proxy couldn't be started",
         subprocess::process_read(bmpserv, "stderr"))
  }
  list(
    process = bmpserv,
    output = function(timeout = 0L){
      subprocess::process_read(bmpserv, timeout = timeout)
    },
    error = function(timeout = 0L){
      subprocess::process_read(bmpserv, pipe = "stderr", timeout)
    },
    stop = function(){subprocess::process_kill(bmpserv)}
  )
}

bmpCheck <- function(){
  bmpyml <- system.file("yaml", "bmproxy.yml", package = "bmproxy")
  byml <- yaml::yaml.load_file(bmpyml)
  message("checking Browser Mob proxy versions:")
  binman::process_yaml(bmpyml)
  bmpplat <- "generic"
  list(yaml = byml, platform = bmpplat)
}

bmpVer <- function(platform, version){
  bmpver <- binman::list_versions("bmproxy")[[platform]]
  bmpver <- if(identical(version, "latest")){
    as.character(max(package_version(bmpver)))
  }else{
    mtch <- match(version, bmpver)
    if(is.na(mtch) || is.null(mtch)){
      stop("version requested doesnt match versions available = ",
           paste(bmpver, collpase = ","))
    }
    bmpver[mtch]
  }
  bmpdir <- normalizePath(
    file.path(binman::app_dir("bmproxy"), platform, bmpver)
  )
  bmpregex <- if(identical(getOS(), "win")){
    "browsermob-proxy\\.bat$"
  }else{
    "browsermob-proxy$"
  }
  bmppath <- list.files(bmpdir,
                            pattern = bmpregex,
                            recursive = TRUE,
                            full.names = TRUE)
  if(file.access(bmppath, 1) < 0){
    Sys.chmod(bmppath, '0755')
  }
  list(version = bmpver, dir = bmpdir, path = bmppath)
}
