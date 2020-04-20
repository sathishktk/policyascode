# Using this repo to showcase some examples related to Hashicorp Sentinel policies - Policy as code approach

You can see from the screen shot below, terramform apply will not work since the tags were not available in the s3 buckets during the tfplan process. Updated the code to inlcude tags, with the tests to include the tags checking as well. I have only included pass tests, but you should be easily replicate the same for fail tests as well

![image](https://user-images.githubusercontent.com/35387416/79785267-92468800-8311-11ea-9e97-e27baae83bb3.png)
