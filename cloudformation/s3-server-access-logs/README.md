# s3-server-access-logs

This template will create an s3 bucket to be used as a destination for s3 server access logs. All s3 buckets that require s3 server access logging in the same account should send logs here.

## Parameters

| Parameter   | Description |
| ----------- | ----------- |
| Environment | String. The environment for the account the bucket is being deployed to. Can be one of "dev", "build", "staging", "integration", or "production" |

## Sending to the bucket

Set the following config on the bucket you want to send logs from:

```
LoggingConfiguration:
    DestinationBucketName: !Sub "${AWS::AccountId}-s3-server-access-logs"
    LogFilePrefix: !Sub "${ThisS3BucketName}/"
```

Ensure you include the trailing slash on the prefix - this will create a subdirectory in the logging bucket for your s3 bucket's logs. 

Omitting the slash will only add the prefix to every logfile, which will get messy as you add more s3 bucket logs.

