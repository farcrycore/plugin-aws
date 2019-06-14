component output="false" {

	property client;

	public any function afterInit() {

		try {
			this.client = new awscfml.aws(
				awsKey = application.fapi.getConfig("aws","accessKey",""),
				awsSecretKey = application.fapi.getConfig("aws","secretKey",""),
				defaultRegion = application.fapi.getConfig("aws","defaultRegion","")
			);
		}
		catch (any e) {
			var stdout = createObject("java", "java.lang.System").out;
			stdout.println("Error creating AWS Client: #e.message#");
		}

	}

}