## HOW TO DO DRIFT DETECTION? IF A MANUAL CHANGE IS MADE ON THE INFRASTRUCTURE, HOW TO MAKE SURE THAT THE .tfstate FILE IS CONSISTENT WITH WHAT IS IN REMOTE INFRASTRUCTURE?

Solution-1: Use `terraform refresh` command. That will update your `.tfstate` file as per remote infrastructure status. You can set up a `cron job to run terraform refresh` command as per your need


Solution-2: Implement strong IAM policies which will prevent IAM users from accessing the resources managed by terraform


Solution-3: Write a lambda function which has a list of resources managed by terraform. It references audit logs from Cloudwatch to see if any change on any of terraform managed resources was made by IAM user or terraform user. If the change is made by IAM user, it can send a notification or alert to the respective party
