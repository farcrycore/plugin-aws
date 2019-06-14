component {

    variables.service = 'sqs';

    public any function init(
        required any api,
        required struct settings
    ) {
        variables.api = arguments.api;
        variables.utils = variables.api.getUtils();
        variables.apiVersion = arguments.settings.apiVersion;
        return this;
    }

    public any function listQueues() {
        var requestSettings = api.resolveRequestSettings( argumentCollection = arguments );
        var apiResponse = apiCall( requestSettings, 'GET', '/', { 'Action': 'ListQueues' } );
        if ( apiResponse.statusCode == 200 ) {
            apiResponse[ 'data' ] = utils.parseXmlDocument( apiResponse.rawData );
        }
        return apiResponse;
    }

    // private

    private string function getHost(
        required string region
    ) {
        return variables.service & '.' & region & '.amazonaws.com';
    }

    private any function apiCall(
        required struct requestSettings,
        string httpMethod = 'GET',
        string path = '/',
        struct queryParams = { },
        struct headers = { },
        any payload = ''
    ) {
        var host = getHost( requestSettings.region );
        structAppend( queryParams, { 'Version': variables.apiVersion }, false );

        return api.call(
            variables.service,
            host,
            requestSettings.region,
            httpMethod,
            path,
            queryParams,
            headers,
            payload,
            requestSettings.awsCredentials
        );
    }

}
