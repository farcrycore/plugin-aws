component {

    public any function init(
        required any utils
    ) {
        variables.utils = utils;
        return this;
    }

    public any function makeHttpRequest(
        required string httpMethod,
        required string path,
        struct queryParams = { },
        struct headers = { },
        any body,
        boolean useSSL = true,
        numeric timeout = 50
    ) {
        var result = '';
        var fullPath = path & ( !queryParams.isEmpty() ? ( '?' & utils.parseQueryParams( queryParams ) ) : '' );
        var request_headers = utils.parseHeaders( headers );
        var urlPath = 'http' & (useSSL ? 's' : '') & '://' & fullPath;

        cfhttp( url = urlPath, method = httpMethod, result = 'result', timeout = timeout ) {

            for ( var header in request_headers ) {
                if ( header.name == 'host' ) continue;
                cfhttpparam( type = "header", name = lcase( header.name ), value = header.value );
            }

            if ( arrayFindNoCase( [ 'POST','PUT' ], httpMethod ) && !isNull( arguments.body ) ) {
                cfhttpparam( type = "body", value = body );
            }

        }
        return result;
    }

}
