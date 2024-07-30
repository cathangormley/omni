
// Do GET requests through curl system command

\d .curl

handleresponse:{[resp]
  // Header is separated from body by empty line
  d:count'[resp]?0;
  `header`body!(d#resp;.j.k raze(d+1)_resp)
 };

handleparameters:{[params]
  if[0=count params;:""];
  s:?[10h=type each params;params;string params];
  "?","&" sv string[key s],'"=",'value s
 };

hget:{[endpoint;params]
  req:.env.BINANCEADDRESS,endpoint,handleparameters params;
  resp:system"curl -i -s -X GET ",req;
  handleresponse resp
 };



\
.curl.hget["time"]
