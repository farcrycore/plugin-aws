component extends="farcry.core.packages.forms.forms" displayname="AWS" hint="AWS plugin credentials and configuration" output="false" key="aws" {

	property name="accessKey" type="string" required="false" 
		ftSeq="1" ftWizardStep="" ftFieldset="AWS Credentials" ftLabel="Access Key"
		ftHint="";

	property name="secretKey" type="string" required="false" 
		ftSeq="2" ftWizardStep="" ftFieldset="AWS Credentials" ftLabel="Secret Key"
		ftHint="";

	property name="defaultRegion" type="string" required="false" 
		ftSeq="3" ftWizardStep="" ftFieldset="AWS Credentials" ftLabel="Default Region"
		ftHint="";

}
